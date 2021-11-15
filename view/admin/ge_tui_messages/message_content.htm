{%- macro add_message_content(push_message) %}
    {% if push_message.selected %}
        <a href="javascript:;">已添加</a>
    {% else %}
        <a href="/admin/ge_tui_messages/add_message_content?id={{ push_message.id }}" id="add_message_content">添加</a>
    {% endif %}
{%- /macro %}

<input type="hidden" id="ge_tui_message_id" value="{{ ge_tui_message_id }}">

{%- macro image_link(push_message) %}
    <img src="{{ push_message.image_small_url }}" height="50" width="50"/>
{%- /macro %}

<a href="/admin/ge_tui_messages">返回</a>

{{ simple_table(push_messages, ['ID':'id', '排序':'rank', '标题': 'title','描述':'description','图片': 'image_link','跳转地址': 'url',
'资源名称':'material_name','状态':'status_text','跟踪标识':'tracker_no','条件':'condition_strategy_text','添加':'add_message_content'
]) }}

<script type="text/javascript">
    $('body').on('click', '#add_message_content', function (e) {
        e.preventDefault();
        var self = $(this);
        var href = self.attr('href');
        var ge_tui_message_id = $("#ge_tui_message_id").val();
        href += '&ge_tui_message_id=' + ge_tui_message_id;
        $.post(href, '', function (resp) {
            if (0 !== resp.error_code) {
                alert(resp.error_reason);
                return;
            }
            self.html('已添加');
            location.reload();
        })
    })
</script>