<?php

namespace xcx;

class ArticlesController extends BaseController
{

    // 获取页面详情
    function pageDetailAction()
    {
        $this->paramsId($id);

        info('review article before:==', $id, $this->params('id'));

        if (!$id || !$article = \Articles::findById($id)) {
            exit('id err');
        }

        $this->withCodeOk()->out(['data' => $article->toSimpleJson()]);
    }

    function newAction()
    {
        $this->paramsId($id);
        if (!$id) exit('no id');

        $is_publish = $this->params('is_publish');
        $content = $this->params('content'); // 替换规则 {#CODE_INDEX_1#}
        $title = $this->params('title'); // 必须
        // [{"{$CODE_INDEX:133#}":****}, ...}]
        $descr = $this->params('descr');

        $codes = $this->params('codes');

        // 虚拟用户id解密失败直接返回
        $virtual_id = $this->params('virtual_id');
        if ($virtual_id) {
            $virtual_id = decodeStr($virtual_id);
            if (!$virtual_id) {
                error('new article decode virtual_id err:==', $this->currentUserId(), $this->params('virtual_id'));
                return;
            }
        }

        if (!$content) {
            exit('err');
        }

        // 保存文章
        $article = \Articles::findById($id);
        if (!$article || ($article->member_id != $this->currentUserId() && $article->real_member_id != $this->currentUserId())) {

            exit('err:not fond' . $id . $article->member_id . ':' . $this->currentUserId());
        }


        // 这里的所有的代码段替换```php(等等)
        $codes = json_decode($codes, true);
        $db_content = '';
        if (count($codes) > 0) {
            foreach ($codes as $code_index => $code) { // 新增的话不需要查询数据库修改，直接全部加入
                if (strpos($code['lan'], ':ref:') > -1) {
                    $replace_content = "```" . $code['lan'] . "\n" . $code['content'] . "```";
                    $sc_id = explode(':', $code['lan'])[2] ?? '';
                    if (!$sc_id) {
                        return $this->withCodeOk()->withReason('引用代码片段id不能为空！')->out();
                    }

                    // 更新sc中的代码
                    if (($sc = \SliceCodes::findById($sc_id))) {
                        if ($sc->member_id = $this->currentUserId()) {
                            $sc->content = $code['content'];
                            $sc->update();
                        } else {
                            return $this->withCodeOk()->withReason('暂不支持引用他人代码片段，若引用他人的码文请使用语法：$C(oshine/wooyri)或$C(代码id)')->out();
                        }
                    }

                    $db_content = strReplace('_$(_STATIC_CODE_ID_REPLACE_)$_', '_$(_STATIC_CODE_ID_REPLACE_' . $sc_id . ')$_', $db_content ?: $content, 1);
                    $content = strReplace('_$(_STATIC_CODE_ID_REPLACE_)$_', $replace_content, $content, 1);
                    continue;
                }

                $sc = \SliceCodes::new($this->currentUserId(), $article->id, $code['content'], $code['lan']);
                $replace_content = "```" . $sc->lan . ':ref:' . $sc->id . "\n" . $sc->content . "```";

                $db_content = strReplace('_$(_STATIC_CODE_ID_REPLACE_)$_', '_$(_STATIC_CODE_ID_REPLACE_' . $sc->id . ')$_', $db_content ?: $content, 1);
                $content = strReplace('_$(_STATIC_CODE_ID_REPLACE_)$_', $replace_content, $content, 1);

            }
        } else {
            $db_content = $content;
        }


        if ($virtual_id && $this->currentUser()->can_virtual) {
            $article->is_virtual = 1;
            $article->real_member_id = $this->currentUserId();
            $article->member_id = $virtual_id;
        } else {
            $article->member_id = $this->currentUserId();
        }

        $article->title = $title;
        if (strlen($descr) < strlen($title)) {
            $article->descr = $title;
        } else {
            $article->descr = $descr;
        }

        $article->status = $is_publish ? 1 : 0;

        $article->created_at = $article->refresh_at = time();
        $article->content = $db_content;

        $article->save();

        // 临时输出还不变
        $article->temp_content = $content;

        // todo 统计代码使用次数


        $tag_ids = explode(',', $this->params('tag_ids', ''));
        $tag_old_ids = explode(',', $this->params('tag_old_ids', ''));


        // 标签处理
        // 先加入新的tag
        foreach ($tag_ids as $item) {
            // 插入tag前先查询，否则会重复提交重复插入
            if ($item && !in_array($item, $tag_old_ids) &&
                !\TagsMapArticle::findFirst(['conditions' => 'tag_id=' . $item . ' and article_id=' . $article->id])) {

                $t = new \TagsMapArticle();
                $t->tag_id = $item;
                $t->article_id = $article->id;
                $t->save();
            }
        }
        // 删除老的不存在的tag
        foreach ($tag_old_ids as $item) {
            if ($item && !in_array($item, $tag_ids)) {
                $ts = \TagsMapArticle::find(['conditions' => 'tag_id=' . $item . ' and article_id=' . $article->id]);
                info('tag delete:===', $t);
                foreach ($ts as $t) {
                    $t && $t->delete();
                }

            }
        }

        return $this->withCodeOk()->out(['data' => $article->toSimpleJson()]);
    }

    // 查找最近正在编辑的文章,没有则新建一个
    function recentlyAction()
    {
        $ar = \Articles::findFirst(['conditions' => 'status=0 and (member_id=' . $this->currentUserId() . ' or real_member_id=' . $this->currentUserId() . ')', 'order' => 'created_at desc']);
        if (!$ar) {
            $a = new \Articles();
            $a->content = '';
            $a->member_id = $this->currentUserId();
            $a->save();
            return $this->withCodeOk()->out(['data' => ['id' => encodeStr($a->id)]]);

        }

        return $this->withCodeOk()->out(['data' => ['id' => encodeStr($ar->id)]]);
    }

    function listAction()
    {
        $p = $this->params('p');

        info('article list before:==', $p);

        /** @var \Articles[] $as */
        $as = \Articles::findPagination([], $p);
        $ls = [];
        foreach ($as as $a) {
            $ls[] = $a->toSimpleJson(false);
        }
        info('article list end:==', $ls);
        $this->withCodeOk()->out(['data' => $ls]);
    }
}
