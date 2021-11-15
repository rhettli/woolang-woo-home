<?php

namespace xcx;

class CommentArticleController extends BaseController
{

    public function newAction()
    {
        $virtual_id = $this->params('virtual_id');
        if ($virtual_id) {

        }
        // 被回复的人的id
        $reply_member_id = decodeStr($this->params('reply_member_id'));
        $content = $this->params('content');
        $article_id = decodeStr($this->params('article_id'));

        if (!$article_id)
            exit('');

        if (!$content || strlen($content) < 2) {
            return $this->withCodeError()->withReason('评论长度也太短了吧！')->out([]);
        }

        $c = new \CommentArticle();

        $parent_id = $this->params('parent_id');
        if ($parent_id) {
            $p_comment = \CommentArticle::findById($parent_id);
            if (!$p_comment || $p_comment->article_id != $article_id) {
                return $this->withCodeError()->withReason('父评论没找到！' . $article_id)->out([]);
            }

            $c->parent_id = $parent_id;
        }

        $c->member_id = $this->currentUserId();
        $c->content = $content;
        $reply_member_id && $c->reply_member_id = $reply_member_id;
        $c->created_at = time();
        $c->article_id = $article_id;
        $c->is_virtual = $virtual_id ? 1 : 0;


        if (!$c->save()) {
            return $this->renderJson(ERROR_CODE_FAIL, '保存失败！');
        }

        return $this->renderJson(ERROR_CODE_SUCCESS, 'ok');
    }


    public function listAction()
    {
        $page = $this->params('page', 1);

        $article_id = decodeStr($this->params('article_id'));

        if (!$article_id)
            exit('id err');

        $parent_comment_id = $this->params('parent_id');

        // 他的父评论id的文章id要和当前请求的文章id相同
        if ($parent_comment_id) {
            $p_comment = \CommentArticle::findById($parent_comment_id);
            if (!$p_comment || $p_comment->article_id != $article_id) {
                return $this->withCodeOk()->withReason('父评论没找到')->out([]);
            }

            /** @var \CommentArticle[] $coms */
            $coms = \CommentArticle::findPagination(['conditions' => 'parent_id=' . $parent_comment_id, 'order' => 'like_num desc'], $page);

        } else {
            // 找最外层的评论列表
            /** @var \CommentArticle[] $coms */
            $coms = \CommentArticle::findPagination(['conditions' => 'article_id=' . $article_id . ' and parent_id<1', 'order' => 'like_num desc'], $page);
        }


        $ls = [];
        foreach ($coms as $com) {
            $ls[] = $com->toCommentJson(6, $with_member = true, $with_member_virtual = true);
        }

        return $this->withCodeOk()->out(['data' => $ls]);
    }

}
