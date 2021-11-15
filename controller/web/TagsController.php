<?php

namespace xcx;

class TagsController extends BaseController
{

    public function newAction()
    {
        $title = $this->params('title');

        $tag = new \Tags();
        $tag->title = $title;
        $tag->save();

        // todo 统计代码使用次数

        return $this->renderJson(0, '');
    }

    // 热门标签列表
    public function hotListAction()
    {
        /** @var \Tags[] $tags */
        $tags = \Tags::find(['conditions' => '', 'limit' => 20]);

        $ls = [];
        foreach ($tags as $tag) {
            $ls[] = $tag->toSimpleJson();
        }

        return $this->renderJson(0, '', ['data' => $ls]);
    }

    // 标签列表，写文章 写代码用的
    public function listAction()
    {
        $search_name = $this->params('title');
        /** @var \Tags[] $tags */
        $tags = \Tags::find(['conditions' => 'title like "%' . $search_name . '%"', 'limit' => 20]);

        $ls = [];
        foreach ($tags as $tag) {
            $ls[] = $tag->toSimpleJson();
        }

        return $this->renderJson(0, '', ['data' => $ls]);

    }

}
