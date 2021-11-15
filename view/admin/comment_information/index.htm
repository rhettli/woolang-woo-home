
<form action="/admin/comment_information" method="get" class="search_form" autocomplete="off" id="search_form">
    <label for="user_id_eq">用户id</label>
      <input name="comments[user_id_eq]" type="text" id="user_id_eq"/>

   <label for="business_information_no_eq">商户编号</label>
      <input name="comments[business_information_no_eq]" type="text" id="business_information_no_eq"/>

    <button type="submit" class="ui button">搜索</button>
</form>

{% macro username(comment) %}
用户Id:{{comment.user.id}}<br/>
用户昵称:{{comment.user.nickname}}<br/>
{% /macro %}

{% macro shopname(comment) %}
编号：{{comment.business_information.no}}<br/>
名称：{{comment.business_information.name}}<br/>
{% /macro %}

{% macro score(comment) %}
环境评分:{{comment.score_env}}<br/>
服务评分:{{comment.score_service}}<br/>
舒适度评分:{{comment.score_comfortable}}<br/>
{% /macro %}



{% macro all_photos(comment) %}
    {% for val in comment.photos %}
        <a target='_blank' href="{{val}}">
       <img style="width:80px;height:80px;border:1px solid #868686;" src="{{ val }}" />
       </a>
    {% endfor %}
{% /macro %}

{% macro edit(comment) %}
<a href="/admin/comment_information/pass?id={{comment.id}}">审核通过</a>
<a href="/admin/comment_information/edit?id={{comment.id}}" class='modal_action'">编辑</a>
<a href="#" onclick="del({{comment.id}});">删除</a>
{% /macro %}

{% macro status_ctl(comment) %}
<i id="status_ctl_{{comment.id}}">{{comment.status_text}}</i>
{% /macro %}


{{ simple_table(comments, [
'ID': 'id','用户信息':'username','商户': 'shopname','内容': 'content','评分': 'score','照片': 'all_photos',
'状态': 'status_ctl','创建时间': 'created_at_text','操作': 'edit']) }}

<script>
function del(id){
if (confirm('是否删除？')){
    $.ajax({
        url: "/admin/comment_information/delete?id=" + id, data: {}, success: function () {
            location.reload();
        }
    });
}}

  $(function () {

        {% for banner in comments %}
        {% if banner.status == 0 %}
            $("#status_ctl_{{ banner.id }}").css({"color": "red"});
        {% elseif banner.status == 1 %}
            $("#status_ctl_{{ banner.id }}").css({"color": "green"});
        {% endif %}
        {% endfor %}

    });
</script>
