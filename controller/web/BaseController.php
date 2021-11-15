<?php

namespace xcx;


use ApplicationController;

/**
 *
 */
class BaseController extends ApplicationController
{
    private $_current_user;
    private $_current_product_channel;

    public $remote_ip;

    static $SKIP_ACTIONS = [
        'home' => '*',
        'member' => ['xcx_binding', 'email_register', 'qrcode', 'code_login', 'login', 'sync', 'author_list', 'detail'],
        'news' => ['list'],
        'tags' => ['search', 'detail', 'hot_list'],
        'company' => ['detail'],
        'articles' => ['list', 'page_detail'],
        'company_signs' => ['list'],
        'comment_article' => ['list'],
        'black_card' => ['order_config', 'pay_result_config', 'register_config', 'share_config'],
    ];

    function isDebug()
    {
        return '1' == $this->params('debug') && isDevelopmentEnv();
    }

//    const SID_PREFIX = '_sid_';
//
//    function getSid()
//    {
//
//    }
//
//    function setSid()
//    {
//        $redis = \Member::getHotWriteCache();
//        $pre = self::SID_PREFIX . $this->id / 100;
//        $redis->zadd($pre, time() + 3600 * 2 - 30 * 60, $this->id);
//    }

    function currentUserId()
    {
        $sid = $this->context('sid');
        if (isBlank($sid)) {
            $sid = fetch(json_decode($this->request->getRawBody(), true), 'sid');
            if (isBlank($sid)) {
                info('no_sid', $this->remoteIp(), $this->params());
                return null;
            }
        }

        $user_id = intval($sid);
        return $user_id;
    }

    /**
     * @return \Member
     */
    function currentUser()
    {
        $user_id = $this->currentUserId();
        if (isBlank($user_id)) {
            return null;
        }

        if (!isset($this->_current_user) && $user_id) {
            $user = \Member::findFirstById($user_id);
            $this->_current_user = $user;
        }

        if ($this->_current_user && $this->_current_product_channel && $this->_current_user->product_channel_id == $this->_current_product_channel->id) {
            $this->_current_user->product_channel = $this->_current_product_channel;
        }

        return $this->_current_user;
    }

    /**
     * @return \ProductChannels
     */
    function currentProductChannel()
    {
        $code = $this->params('code');
        if (!isset($this->_current_product_channel) && $code) {
            $this->_current_product_channel = \ProductChannels::findFirstByCodeHotCache($code);
        }

        return $this->_current_product_channel;
    }

    function currentProductChannelId()
    {
        if ($this->currentProductChannel()) {
            return $this->_current_product_channel->id;
        }
        return 0;
    }

    function authorize()
    {
        return $this->currentUser() && $this->params('sid') == $this->currentUser()->sid;
    }

    function xcxAuthorize()
    {
        return $this->currentUser() && $this->currentUser()->xcx_openid;
    }


    function getArrayParams($params = [])
    {

        $ls = [];
        foreach ($params as $param) {
            $ls[$param] = $this->params($param);
        }

        return $ls;
    }

    function beforeAction($dispatcher)
    {
        $controller_name = $dispatcher->getControllerName();
        $action_name = $dispatcher->getActionName();
        $controller_name = \Phalcon\Text::uncamelize($controller_name);
        $action_name = \Phalcon\Text::uncamelize($action_name);
        $controller_name = strtolower($controller_name);
        $action_name = strtolower($action_name);
        $this->remote_ip = $this->remoteIp();

        $current_product_channel = $this->currentProductChannel();
        if (!$current_product_channel) {
            return $this->renderJSON(ERROR_CODE_FAIL, '渠道有误[E22]');
        }

        if (!$current_product_channel->isStatusOn()) {
            return $this->renderJSON(ERROR_CODE_FAIL, '暂停服务');
        }

        // 更新设备或用户状态
        if ($this->currentUser()) {
            $this->checkLoginStatus();
        }

        // 不验证用户登录
        if ($this->skipAuth($controller_name, $action_name)) {
            return true;
        }

        $current_user = $this->currentUser();
        if (isBlank($current_user)) {
            info('Exce 请关闭微信重新打开', $this->params());
            return $this->renderJSON(ERROR_CODE_NEED_LOGIN, '请登录1');
        }

        if ($current_user->isBlocked()) {
            return $this->renderJSON(ERROR_CODE_FAIL, '账户状态异常');
        }

        if (!$this->authorize()) {
            info('no_sid_authorize 请关闭微信重新打开', $this->remoteIp(), $this->params());
            return $this->renderJSON(ERROR_CODE_NEED_LOGIN, '您已经在其他地方登陆，请重新登陆。');
        }

//        if (!$this->xcxAuthorize()) {
//            info('no_sid_xcxAuthorize 请关闭微信重新打开', $this->remoteIp(), $this->params());
//            return $this->renderJSON(ERROR_CODE_NEED_XCX_AUTHORIZE, '请登录3');
//        }

    }

    function skipAuth($controller_name, $action_name)
    {
        if (isset(self::$SKIP_ACTIONS[$controller_name])) {
            $values = self::$SKIP_ACTIONS[$controller_name];
            if ($values == '*') {
                return true;
            }

            if (is_array($values) && in_array($action_name, $values)) {
                return true;
            }
        }
        return false;
    }

    public function checkLoginStatus()
    {
        $fresh_attrs = [
            'platform' => $this->getPlatform(),
            'ip' => $this->remote_ip,
        ];

        if ($this->currentUser()) {
            info($this->currentUser()->id, $fresh_attrs, $this->params());
            $this->currentUser()->onlineFresh($fresh_attrs);
        }
    }

    //Mozilla/5.0 (iPhone; CPU iPhone OS 12_3_1 like Mac OS X) AppleWebKit/605.1.15
    // (KHTML, like Gecko) Mobile/15E148 MicroMessenger/7.0.5(0x17000523) NetType/4G Language/zh_CN
    function getPlatform()
    {
        $user_agent = $this->request->getUserAgent();
        $platform = 'android';
        if (preg_match('/ios|iphone/i', $user_agent)) {
            $platform = 'ios';
        }
        return 'xcx_' . $platform;
    }

}
