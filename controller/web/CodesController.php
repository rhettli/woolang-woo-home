<?php

namespace xcx;

class CodesController extends BaseController
{

    public function newAction()
    {
        $title = $this->params('title');
        $content = $this->params('content');
        $tag_ids = explode(',', $this->params('tags'), '');
        $is_private = $this->params('is_private');
        $c = new \Codes();
        $c->content = $content;
        $c->title = $title;
        $c->is_private = $is_private;
        if (!$c->save()) {
            return $this->renderJson(ERROR_CODE_FAIL, '保存失败！');
        }

        if ($r = \TagsMapCode::find(['conditions' => 'code_id=' . $c->id])) {
            foreach ($r as $tag_map) {
                if (!in_array($tag_map->tag_id, $tag_ids)) {
                    $tag_map->delete();
                }
            }
        } else {
            foreach ($tag_ids as $item) {
                if ($item) {
                    $t = new \TagsMapCode();
                    $t->tag_id = $item;
                    $t->code_id = $c->id;
                    $t->save();
                }
            }
        }

        return $this->renderJson(ERROR_CODE_SUCCESS, 'ok');
    }


    public function listAction()
    {

    }

}
