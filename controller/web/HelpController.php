<?php

namespace xcx;

class HelpController extends BaseController
{

    /*
     * 版本说明
     */
    function versionTextAction()
    {
        $v = $this->params('v');

        if ($v == 'v1.23') {
            $t = [
                'Login' => 'cw login -u admin -p',
                'Run a project' => 'cw run project_id(88776) ',
                'Open chanel' => 'cw chanel open',
                'Join a chanel' => 'cw chanel join 9788  ',
                ''=>''
            ];
            return $t;
        }
    }
}
