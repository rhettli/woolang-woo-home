<?php

namespace xcx;

class CloudController extends BaseController
{
    /*
     * 获取操作token，防止人为截包，删除其他文件
     */
    function tkAction()
    {
        $t = $this->params('t');

        if (!$t) return '';

        $uid = uuid() . $this->currentUserId();
        
//        $uid .= '|' . calculateSum($uid);

        $encode = base64_encode(json_encode(['tk' => $uid]));

        return $this->withCodeOk()->out(
            ['data' => $encode]);
    }

    function lsAction()
    {

    }

    function upAction()
    {
        ini_set('', '2G');

    }

    function delAction()
    {
        $tk = $this->params('tk');
        if (!$tk) return '';


    }
}
