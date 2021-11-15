<?php

namespace xcx;

class AnswersController extends BaseController
{
    /*
     * 详情
     */
    function detailAction()
    {

    }

    /*
     * new
     */
    function newAction()
    {
        $question_id = $this->params('question_id');
        $answer = new Answer;
        $answer->question_id = $question_id;
        $answer->create();
        return $this->renderJson(0, '', ['answer' => $answer->toJson()]);

    }

}