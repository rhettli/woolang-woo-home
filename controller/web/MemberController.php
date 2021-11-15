<?php

namespace xcx;

class MemberController extends BaseController
{

    function emailRegisterAction()
    {
        $email = $this->params('email');
        $psw = $this->params('psw');
        if ($email && $psw) {
            $member = new \Member();
            $member->password = md5($psw);
            $member->email = $member->nickname = $email;
            $member->save();
            return $this->renderJSON(ERROR_CODE_SUCCESS, '', ['detail' => $member->toSimpleJson()]);
        }
        return $this->renderJSON(ERROR_CODE_FAIL, '');
    }

    // API登陆操作
    function loginAction()
    {
        $m = $this->params('mobile', '');
        $email = $this->params('email', '');
        $psw = $this->params('psw', '');
        if ($email && $psw) {
            /** @var \Member $member */
            $member = \Member::findFirstByEmail($email);

            !$member && $member = \Member::findFirstByUsername($email);

            if ($member && $member->password == md5($psw)) {
                $member->generateSid('s');
                $member->save();
                return $this->renderJSON(ERROR_CODE_SUCCESS, '', ['data' => $member->toSimpleJson()]);
            }
        }

        return $this->renderJSON(ERROR_CODE_FAIL, '登陆失败');

    }


    function detailAction()
    {
        $this->paramsId($id);
        !$id && $id = $this->currentUserId();

        $member = $id ? \Member::findById($id) : null;

        $this->withCodeOk()->out(['data' => ($member ?: $this->currentUser())->toSimpleJson()]);
    }

    // 取一个虚拟随机用户
    function randomAction()
    {
        // 只能有虚拟权限的才能取虚拟用户

        //select id from word_video_information
        //
        //order by rand() limit 5;

        if (!$this->currentUser()->can_virtual) {
            exit('');
        }

        // https://www.cnblogs.com/my_life/articles/7827233.html
        $sql = 'select id from member where id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM `table`))) and is_random=1 limit 1';

        $ids = \SqlModel::execStatic($sql);
        $ids && $ids = $ids[0]['id'] ?? '';

        if ($ids) {
            /** @var \Member $member */
            $member = \Member::findByIds($ids);
            return $this->withCodeOk()->out($member->toSimpleJson());
        }
//        $i = 0;
//        while ($i < 10) {
//            $radom_id = mt_rand(10, 1111);
//            if (($member = \Member::findByIds($radom_id)) && $member->is_random == 1) {
//                $this->withCodeOk()->out($member->toSimpleJson());
//            }
//            $i++;
//        }

        return $this->withCodeOk()->out();

    }

    // 其他系统远程同步创建用户
    function syncAction()
    {
        $username = $this->params('username');
        $age = $this->params('age');
        $avatar = $this->params('avatar');
        $sync_id = $this->params('sync_id');
        info($this->params());

        if ($avatar && $username && $sync_id) {

            if ($member = \Member::findFirstBySyncId($sync_id)) {
                return;
            }
            $member = new \Member();
            $member->username = $username;
            $member->nickname = $username;
            $member->age = $age;
            $member->status = 1;
            $member->is_random = 1;
            $member->sync_id = $sync_id;
            $member->email = $username;
            $member->save();

            $member->username = $member->id;
            $member->email = $member->id . '@wooyri.com';
            $member->update();

            $fpath = '/wooyri';

            $local_temp_file = '/tmp/' . $sync_id;

            file_put_contents($local_temp_file, file_get_contents($avatar));

            $destination = $fpath . '/' . 'avatar' . '/' . $member->id . '-' . time() . '.jpg';

            $url = \StoreFile::upload($local_temp_file, $destination);
            if ($url) {
                $member->avatar = $destination;
                $member->update();
            }
            unlink($local_temp_file);
        }
    }

    /**
     * 微信小程序静默授权
     */
    public function codeLoginAction()
    {
        $xcx_code = $this->params('xcx_code', '');
        $system = $this->params('system', '');
        if (!$xcx_code) {
            return $this->renderJSON(ERROR_CODE_FAIL, '请关闭微信重新打开:code');
        }

        $product_channel = $this->currentProductChannel();
        $xcx = new \XcxEvents($product_channel);
        $xcx_openid = $xcx->getOpenid($xcx_code);
        $third_unionid = $xcx->getUnionid($xcx_code);

        if (!$xcx_openid) {
            info('Exce 注册失败 请关闭微信重新打开', $this->params());
            return $this->renderJSON(ERROR_CODE_FAIL, '授权失败code');
        }

        $user = \Member::findFirstByWxThirdUnionid($product_channel, $third_unionid);
        if (!$user) {
            $user = \Member::findFirstByXcxOpenid($product_channel, $xcx_openid);
        }

        if ($user) {
            if (!$user->third_unionid) {
                $user->third_unionid = $third_unionid;
                $user->update();
            }
            if (!$user->xcx_openid) {
                $user->xcx_openid = $xcx_openid;
                $user->update();
            }
            return $this->renderJSON(ERROR_CODE_SUCCESS, '绑定成功', ['userInfo' => $user->toSimpleJson()]);
        }

        $r = explode(" ", $system);
        $opts = [
            'xcx_openid' => $xcx_openid,
            'system' => $system,
            'platform_version' => $r['1'] ?? '',
            'platform' => $this->getPlatform(),
            'ip' => $this->remoteIp(),
            'third_unionid' => $third_unionid ? $third_unionid : '',
        ];

        if (!$third_unionid) {
            info('Exce 注册no third_unionid', $opts);
        }

        $user = \Member::registerForXcxOpenId($product_channel, $opts);
        if (!$user) {
            info('Exce 注册失败 请关闭微信重新打开', $opts);
            return $this->renderJSON(ERROR_CODE_FAIL, '请关闭微信重新打开:register fail');
        }

        return $this->renderJSON(ERROR_CODE_SUCCESS, '绑定成功', ['userInfo' => $user->toSimpleJson()]);
    }


    // 微信授权登录
    public function authorizationMobileLoginAction()
    {

        if (!$this->request->isPost()) {
            return $this->renderJSON(ERROR_CODE_FAIL, 'must post！');
        }

        $data = $this->params();
        info('绑定参数', $data);
        if (!$data) {
            return $this->renderJSON(ERROR_CODE_FAIL, 'no post params！');
        }

        $product_channel = $this->currentProductChannel();

        $code = fetch($data, 'xcx_code');
        $share_history_id = $this->params('share_history_id');

        $xcx = new \XcxEvents($product_channel);
        $xcx_openid = $xcx->getOpenid($code);
        if (!$xcx_openid) {
            info($code, 'xcx_openid参数有误', $xcx_openid);

            return $this->renderJSON(ERROR_CODE_FAIL, 'not got open id！');
        }

        $wx_third_unionid = $xcx->getUnionid($code);

        list($user_info, $error_code) = $xcx->getUserInfo($code, $data);
        info('微信返回参数:', $code, 'user_info:', $user_info, 'error_code:', $error_code);
        if (ERROR_CODE_SUCCESS != $error_code) {
            return $this->renderJSON(ERROR_CODE_FAIL, 'we back params error！' . $error_code);
        }
        $user_info = json_decode($user_info, true);
        $mobile = fetch($user_info, 'phoneNumber');
        if (!$mobile) {
            info('mobile参数有误', $mobile);

            return $this->renderJSON(ERROR_CODE_FAIL, 'not get mobile！');
        }
        return $this->renderJSON(ERROR_CODE_SUCCESS, '',
            ["mobile" => $mobile, 'xcx_openid' => $xcx_openid]);

        //用户微信绑定的手机号，更换之后可能导致新注册用户，但是xcx_openid 会一样
//        $user = \Users::findFirstByMobile($this->currentProductChannel(), $mobile);
//        if ($user) {
//            if ($wx_third_unionid) {
//                $user->wx_third_unionid = $wx_third_unionid;
//                $user->subscribe = USER_SUBSCRIBE;
//            }
//            $user->user_status = USER_STATUS_ON;
//            $user->sid = $user->generateSid('s');
//            $user->update();
//
//            // user 和$xcx_openid不一致怎么处理
//            return $this->renderJSON(ERROR_CODE_SUCCESS, '登录成功',
//                ['sid' => $user->sid, "mobile" => $mobile, 'xcx_openid' => $xcx_openid]);
//
//        }
//
//        return [];
//
//        $share_history = \ShareHistories::findFirstById($share_history_id);
//        $skip_url = false;
//
//        $user = \Users::findFirstByWxThirdUnionid($product_channel, $wx_third_unionid);
//        if ($user && !$user->mobile && $share_history && $share_history->user) {
//            //先关注公众号未绑定手机
//            $user->bindParent($share_history->user);
//            $skip_url = self::getSkipUrl($share_history_id);
//            $user->mobile = $mobile;
//            $user->subscribe = USER_SUBSCRIBE;
//            $user->xcx_openid = $xcx_openid;
//            $user->user_status = USER_STATUS_ON;
//            $user->login_type = USER_LOGIN_TYPE_MOBILE;
//            $user->member_level = MEMBER_LEVEL_ORDINARY;
//            $user->role = USER_ROLE_CUSTOMER_KOALA_JIE;
//            $user->platform = $this->getPlatform();
//            $user->sid = $user->generateSid('s');
//            $user->update();
//            info('先关注公众号未绑定手机，登录成功', $user->id, $user->mobile, $wx_third_unionid, $this->params());
//
//            return $this->renderJSON(ERROR_CODE_SUCCESS, '登录成功',
//                ['sid' => $user->sid, "mobile" => $mobile, 'xcx_openid' => $xcx_openid, 'is_member_expired' => $user->needBuyMember(), 'skip_url' => $skip_url]);
//        }

//        if ($share_history && $share_history->user) {
//            $invite_user = $share_history->user;
//            $opts = $this->params();
//            $opts['mobile'] = $mobile;
////            $opts['wx_third_unionid'] = $wx_third_unionid ? $wx_third_unionid : '';
//            $opts['xcx_openid'] = $xcx_openid;
//            $opts['invite_user'] = $invite_user;
//            $opts['source_type'] = USER_SOURCE_TYPE_REGISTER;
//            $opts['login_type'] = USER_LOGIN_TYPE_MOBILE;
//            $opts['role'] = USER_ROLE_CUSTOMER_KOALA_JIE;
//            $opts['platform'] = $this->getPlatform();
//            $user = \Users::registerForXcx($this->currentProductChannel(), $opts);
//            $user->updateAttributes($opts);
//            info('xcx用户注册', $user->id, $opts);
//            $skip_url = self::getSkipUrl($share_history_id);
//
//            return $this->renderJSON(ERROR_CODE_SUCCESS, '',
//                ['sid' => $user->sid, "mobile" => $mobile, 'xcx_openid' => $xcx_openid, 'is_member_expired' => $user->needBuyMember(), 'skip_url' => $skip_url]);
//        }
//
//        $sms_token = md5($mobile . '-' . $xcx_openid . '-sms_token');
//
//        return $this->renderJSON(ERROR_CODE_NEED_REGISTER, '请注册',
//            ['sid' => '', "mobile" => $mobile, 'xcx_openid' => $xcx_openid, 'sms_token' => $sms_token, 'wx_third_unionid' => $wx_third_unionid]);
    }


    /**
     *  https://wxcx.fddchina.com/xcx/users/xcx_binding  Completed 0.308s dispatcher xcx/users#xcx_binding
     * Parameters: {"encryptedData":"WKLZfvg%2FuC7boid7QYPlRnpERyxTqKqeKE3q%2FifY9YNetQbcgMRFLhZDRZX3jJGZl0vJOlw78Jmt3r9CBi5PSsxDpPoYgj0NFNigwwXqP5GtLyrhTiwWk%2Fc%2B%2Brfk%2BoaQ96MDu90FcEasNCOvPEw41JIQ5Z94YCYMQgOYEbvobxxr6WVeDSrIb2ZarwGGbQzuhZ2ECD9ntZyzS4kgsY2yx6qC5hOcQVyzVs06xI30FuargD645egCvAQ25euXLH7ayZViQztQYNB%2Bk1ZFFOH3cFWAOvalo4%2BzTqMt2KuNPkRxSuzuaGGhGn2dik4sW5KDq3%2BfgWPAlYhkFeE6xwwA3Q5%2FUUpTfo7TnR3kDV3gbVu1kg8Y35cQ2Yz8TM%2BSCXC%2BQAjGOSRZGeKDnZwh1seqOAepsb6x1gHP%2BKlltzlw0isOh124NWUnIDndaqwZR985BAw7k1Vriv%2FhZESqFSRbm8I8WmltuwwDQUu9S0qsrqFMVnpk5eK8NveX088J%2BvgmzDNHJVxMisGUv6XA52a30g%3D%3D",
     * "xcx_code":"0813cUkR1wdxP111QhlR1kfHkR13cUkm","iv":"Hvv%2F4VBzCHtUqDpWxmZ%2Bxw%3D%3D","system":"Android 8.0.0","share_history_id":"",
     * "version_code":"1","version_name":"1.0.3","sid":"","code":"black_card","ckey":"","h":"165574c0519de2099ddb73ac1de40f36"}
     * 小程序账号绑定(创建用户)
     */
    function xcxBindingAction()
    {
        $data = $this->params();
        $product_channel = $this->currentProductChannel();
        $code = fetch($data, 'xcx_code');
        $xcx = new \XcxEvents($product_channel);
        // openid可以用来区分用户在不同的设备中使用
        $xcx_openid = $xcx->getOpenid($code);
        if (!$xcx_openid) {
            info('Exce 注册失败 请关闭微信重新打开', $this->params());
            return $this->renderJSON(ERROR_CODE_FAIL, '授权失败code');
        }
        $third_unionid = $xcx->getUnionid($code);
        $system = fetch($data, 'system');
        $share_history_id = fetch($data, 'share_history_id', 0);


        //查询
        $user = \Member::findFirstByWxThirdUnionid($product_channel, $third_unionid);
        if (!$user) {
            $user = \Member::findFirstByXcxOpenid($product_channel, $xcx_openid);
        }

        if ($user) {

            if (!$user->third_unionid) {
                $user->third_unionid = $third_unionid;
                $user->update();
            }

            if (!$user->xcx_openid) {
                $user->xcx_openid = $xcx_openid;
                $user->update();
            }
            return $this->renderJSON(ERROR_CODE_SUCCESS, '绑定成功', $user->toSimpleJson());
        }


        //创建
//        $share_history = \ShareHistories::findFirstById($share_history_id);
//        $parent_id = 0;//如果是0,独立用户
//        if ($share_history && $share_history->user_id) {
//            $parent_id = $share_history->user_id;
//        }

        list($user_info, $error_code) = $xcx->getUserInfo($code, $data);
        if ($error_code == ERROR_CODE_SUCCESS) {
            $user_info = json_decode($user_info, true);

            $third_unionid = fetch($user_info, 'unionId');
            $user = \Member::findFirstByWxThirdUnionid($product_channel, $third_unionid);
            if (!$user) {
                $user = \Member::findFirstByXcxOpenid($product_channel, $xcx_openid);
            }

            if ($user) {
                if (!$user->third_unionid) {
                    $user->third_unionid = $third_unionid;
                    $user->update();
                }

                if (!$user->xcx_openid) {
                    $user->xcx_openid = $xcx_openid;
                    $user->update();
                }

                return $this->renderJSON(ERROR_CODE_SUCCESS, '绑定成功', $user->toSimpleJson());
            }

            $opts = [
                'xcx_openid' => $xcx_openid,
                'system' => $system,
                'parent_id' => 0,    // $parent_id,
                'platform_version' => explode(" ", $system)['1'],
                'platform' => $this->getPlatform(),
                'ip' => $this->remoteIp(),
                'third_unionid' => $third_unionid,
                'nickname' => fetch($user_info, 'nickName')
            ];

            if (!$third_unionid) {
                info('Exce 注册no third_unionid', $opts);
            }

            $user = \Member::registerForXcxOpenId($product_channel, $opts);
            if (!$user) {
                info('Exce 注册失败 请关闭微信重新打开', $opts);
                return $this->renderJSON(ERROR_CODE_FAIL, '请关闭微信重新打开');
            }

            $url = fetch($user_info, 'avatarUrl');
            $temp = APP_ROOT . 'temp/' . uniqid() . ".jpg";
            if ($url && httpSave($url, $temp)) {
                $user->updateAvatar($temp);
                unlink($temp);
            }

            return $this->renderJSON(ERROR_CODE_SUCCESS, '绑定成功', $user->toSimpleJson());
        }

        info('Exce 注册失败 请关闭微信重新打开', $this->params());

        return $this->renderJSON(ERROR_CODE_FAIL, '失败');
    }

    /**
     * 用户基本信息
     */
    function userInfoAction()
    {
        $user = $this->currentUser();
        if (!$user) {
            return $this->renderJSON(ERROR_CODE_FAIL, '');
        }
        return $this->renderJSON(ERROR_CODE_SUCCESS, '', $user->toSimpleJson());
    }

    public function qrcodeAction()
    {
        $user = $this->currentUser();
        if (!$user) {
            return $this->renderJSON(ERROR_CODE_FAIL, '');
        }

        $share_history = \ShareHistories::getShareHistory($user, SHARE_HISTORIES_TYPE_BUY_CARD);
        if (!$share_history) {
            $share_history = \ShareHistories::createShareHistory($user, SHARE_HISTORIES_TYPE_BUY_CARD);
        }

        return $this->renderJSON(ERROR_CODE_SUCCESS, '获取成功', ['qrcode' => $share_history->qrcode_url,
            'share_history_id' => $share_history->id]);
    }

    function uploadFileAction()
    {

        $origin_file_name = $this->params('origin_file_name');

        $fpath = '/wooyri';

        info('move file done', $_FILES['file']['tmp_name']);

        $filename = uniqid();

        $destination = $fpath . '/' . date('Y-m-d') . '/' . $filename . '.jpg';

        $destination_absolute = '/' . $destination;

        $url = \StoreFile::upload($_FILES['file']['tmp_name'], $destination);

        // $url = move_uploaded_file($_FILES['file']['tmp_name'], $final_local_addr);

        // Ucloud云存储
        if ($url) {
            \File::delay()->new($destination_absolute, md5($_FILES['file']['tmp_name']), filesize($_FILES['file']['tmp_name']));
            $operate = $this->params('operate');
            // 上传为公司图片
            if ($operate == 'com_pic' && $company_id = $this->params('company_id')) {
                \CompanyPhotos::new($this->currentUserId(), $company_id, $destination_absolute);
            }

            $addr = \StoreFile::getUrl($destination_absolute);

            return $this->renderJSON(ERROR_CODE_SUCCESS, '', ['detail' => ['origin_file_name' => $origin_file_name, 'path' => $destination_absolute, 'url' => $addr]]);

        }
        return $this->renderJSON(ERROR_CODE_FAIL, 'upload file error.');
    }


    /**
     * 裁剪图片
     * $src_img 图片源文件
     * $dst_w 目标图片宽
     * $dst_h 目标图片高
     * $catid ,$id 该文章id栏目id
     * @Linyufan.com
     * @2018.9.11
     */
    static function get_thumb_img($src_img, $dst_w, $dst_h, $catid, $id)
    {
        //$src_img = ""; // 原图

        //$dst_w = 1240;
        //$dst_h = 700;

        list($src_w, $src_h) = getimagesize($src_img); // 获取原图尺寸
        $dst_scale = $dst_h / $dst_w; //目标图像长宽比
        $src_scale = $src_h / $src_w; // 原图长宽比
        if ($src_scale >= $dst_scale) { // 过高
            $w = intval($src_w);
            $h = intval($dst_scale * $w);

            $x = 0;
            $y = ($src_h - $h) / 3;
        } else { // 过宽
            $h = intval($src_h);
            $w = intval($h / $dst_scale);

            $x = ($src_w - $w) / 2;
            $y = 0;
        }

        // 剪裁
        $source = imagecreatefromjpeg($src_img);
        $croped = imagecreatetruecolor($w, $h);
        imagecopy($croped, $source, 0, 0, $x, $y, $src_w, $src_h);

        // 缩放
        $scale = $dst_w / $w;
        $target = imagecreatetruecolor($dst_w, $dst_h);
        $final_w = intval($w * $scale);
        $final_h = intval($h * $scale);
        imagecopyresampled($target, $croped, 0, 0, 0, 0, $final_w, $final_h, $w, $h);

        // 保存
        imagejpeg($target, "/thumb/$catid-$id.jpg");
        imagedestroy($target);
    }


    // 查看名片
    function watchCardAction()
    {
        $member = $this->currentUser();
        $c = $member->doWatchCard();
        if ($member->getRealVipLevel() == 0) {
            return $this->renderJSON(-2, '查看次数用完');
        } else if ($member->getRealVipLevel() == 1 && $c > 100) {
            return $this->renderJSON(-2, '查看次数用完');
        }

        $member->doWatchCard(1);

        $this->detailAction();
    }

    function updateAction()
    {

        $mobile = $this->params('mobile');
        $company = $this->params('company');
        $department = $this->params('department');
        $sex = $this->params('sex');
        $name = $this->params('name');
        $avatar = $this->params('avatar');
        $language = $this->params('language');
        $country = $this->params('country');

        $member = $this->currentUser();

        $mobile && $member->mobile = $mobile;
        if ($country)
            $member->country = $country;
        if ($language)
            $member->language = $language;
        if ($company)
            $member->company = $company;
        if ($department)
            $member->department = $department;
        if ($name)
            $member->username = $name;
        if ($sex !== null)
            $member->sex = $sex;
        if ($avatar)
            $member->avatar = $avatar;
        $member->update();

        return $this->renderJson(ERROR_CODE_SUCCESS, '');

    }

    function cancelCardAction()
    {
        $user = $this->currentUser();
        $user->mobile = '';
        $user->save();
        return $this->renderJson(ERROR_CODE_SUCCESS, '');
    }

    /**
     * 创建支付接口
     */
    function payOrderAction()
    {
        $buy_type = $this->params('buy_type');
        $buy_time = $this->params('buy_time');
        if (!$buy_time || !$buy_type)
            return '';

        $member_id = $this->currentUserId();

        $xcx_order = \XcxOrders::createOrder(['member_id' => $member_id, 'buy_type' => $buy_type, 'buy_time' => $buy_time]);
        if (!$xcx_order) {
            return '';
        }


        if (!is_object($xcx_order) || ($xcx_order && !$xcx_order->isWaitPay())) {
            info('==order already finished==', $this->currentUserId());
            return $this->renderJSON(ERROR_CODE_FAIL, '您已经支付过了！');
        }

        list($code, $msg_or_data) = $xcx_order->pay($this->currentUser(), $this->headers('Referer'), $this->remoteIp(), $this->getRoot());
        if ($code == ERROR_CODE_SUCCESS) {
            return $this->renderJSON(ERROR_CODE_SUCCESS, '', $msg_or_data);
        }
        return $this->renderJSON(ERROR_CODE_FAIL, $msg_or_data);
    }

    function userOperateCountAction()
    {
        $p = $this->params('op', 'sign_card|watch_card|write_oil_msg');
        $p = explode('|', $p);

        $member = $this->currentUser();
        $ls = [];
        $r = $member->getRealVipLevel();
        if (in_array('write_oil_msg', $p)) {

            $c = $member->doOilMsgCount();

            $ls['write_oil_msg'] = ['can_do' => $r == 0 ? 0 : ($r == 1 && $c < 100 ? 1 : ($r == 2 ? 1 : 0)), 'count' => $c, 'total' => $r == 0 ? '0' : '100'];
        }
        if (in_array('watch_card', $p)) {

            $c = $member->doWatchCard();

            $ls['watch_card'] = ['can_do' => $r == 0 ? 0 : ($r == 1 && $c < 100 ? 1 : ($r == 2 ? 1 : 0)), 'count' => $c, 'total' => $r == 0 ? '0' : '100'];

        }
        if (in_array('sign_card', $p)) {

            $c = $member->doSignCardCount();

            $ls['sign_card'] = ['can_do' => $r == 0 ? ($c < 1 ? 1 : 0) : ($r == 1 && $c < 5 ? 1 : ($r == 2 ? 1 : 0)), 'count' => $c, 'total' => $r == 0 ? '1' : '5'];
        }
        return $this->renderJSON(ERROR_CODE_FAIL, '', ['item' => $ls]);

    }

    // 是热门作者列表
    function authorHotListAction()
    {
        $this->authorListAction();
    }


    function authorListAction()
    {
        $p = $this->params('p');

        info('author list before:==', $p);

        /** @var \Member[] $as */
        $as = \Member::findPagination([], $p);
        $ls = [];
        foreach ($as as $a) {
            $ls[] = $a->toSimpleJson();
        }
        info('author list end:==', $ls);
        $this->withCodeOk()->out(['data' => $ls]);
    }

}
