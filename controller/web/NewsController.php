<?php

namespace xcx;

class NewsController extends BaseController
{
    /** Todo 添加缓存，找到点数据就缓存，cache_key=参数字典排序后md5
     * 新闻搜索
     */
    function listAction()
    {
        $type = htmlspecialchars($this->params('type'));

        $p = trim(htmlspecialchars($this->params('p', 1)));
        $ps = trim(htmlspecialchars($this->params('ps', 3)));

        if ($type == 'news') {
            $limit = ' limit ' . ($p - 1) * $ps . ',' . $ps;
            $order = ' order by sort desc,create_time desc';
            $where = ' where status=1 and cate_id!=708  and to_url =""';
            $field = ' id,title ,thumb,create_time,views,company_id';

            $sql = 'select ' . $field . ' from hd_news ' . $where . $order . $limit . ';';

            $dt = (new \SqlModel())->exec($sql);

        } else {
            $limit = ' limit ' . ($p - 1) * $ps . ',' . $ps;
            $order = ' order by nd.create_time desc ';
            $where = ' where n.is_home=1 and to_url =""';
            $field = ' n.id id,n.thumb,n.title,n.company_id,n.to_url,n.descr,n.detail_url,nd.content,nd.create_time ';

            $sql = 'select ' . $field . ' from hd_news n join hd_news_detail nd on nd.news_id=n.id ' . $where . $order . $limit . ';';

            $dt = (new \SqlModel())->exec($sql);
        }

        return $this->renderJson(ERROR_CODE_SUCCESS, '', ['items' => $dt ?? []]);
    }


    /* Todo 这里需要审查用户是否是会员，不是会员的话 查看累计达到限额即不能够查看消息
     * 油讯detail
     */
    function detailAction()
    {
        $news = \News::findFirstById($this->params('id'));
        if ($news) {

            return $this->renderJson(ERROR_CODE_SUCCESS, '', ['news' => $news->toDetailJson()]);
        }

        return $this->renderJson(ERROR_CODE_SUCCESS, '', ['news' => []]);
    }

}