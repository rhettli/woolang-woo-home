<?php

namespace xcx;

/**
 * Class CompanyController
 * @package xcx
 */
class QuestionsController extends BaseController
{
    function newAction()
    {
        $company_id = $this->params('company_id');
        $viewer = $this->params('viewer');
        if (!$company_id) {
            return 'no com_id';
        }

        $com = \Company::findFirstById($company_id);

        if ($com && $viewer) {
            $com->watch_times++;
            $com->update();
        }

        $ls = $com->toDetailJson();
        if ($this->currentUser()) {
            $ls['sign_status'] = $com->isUserSign($this->currentUser());
            $ls['is_followed'] = $com->hasUserFollowed($this->currentUserId());

        }

        $this->renderJSON(ERROR_CODE_SUCCESS, '', ['company' => !$com ? [] : $ls]);

    }

}