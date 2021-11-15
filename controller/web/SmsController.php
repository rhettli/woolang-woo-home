<?php

namespace xcx;

class SmsController extends BaseController
{

    /*
     * 发送验证码
     */
    function sendAction()
    {
        /** @var $mobile $captcha $ls */

        $ls = ['mobile'];
        $arr = $this->getArrayParams($ls);

        extract($arr);

        info('send mobile before:==', $ls);

        if (!$mobile || !$captcha) {

        }
    }
}
