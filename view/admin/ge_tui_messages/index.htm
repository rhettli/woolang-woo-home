<form action="/admin/ge_tui_messages" method="get" name="search_form">
    <label for="product_channel_id_eq">产品渠道</label>
    <select name="ge_tui_message[product_channel_id_eq]" id="product_channel_id_eq">
        {{ options(product_channels, product_channel_id, 'id', 'name') }}
    </select>
    <label for="status_eq">状态</label>
    <select name="ge_tui_message[status_eq]" id="status_eq">
        {{ options(WeixinTemplateMessages.STATUS, status) }}
    </select>
    <button type="submit" class="ui button">搜索</button>
</form>

<a href="/admin/ge_tui_messages/new" class="modal_action">新增</a>

{%- macro support_province_link(ge_tui_message) %}
    <a href="/admin/ge_tui_messages/support_province/{{ ge_tui_message.id }}"
       class="modal_action">支持的省份</a>
{%- /macro %}

{%- macro message_contnet_send(ge_tui_message) %}
    <a href="/admin/ge_tui_messages/message_content_send?id={{ ge_tui_message.id }}"
       id="send_msg">发送消息</a>
{%- /macro %}

{%- macro message_contnet_link(ge_tui_message) %}
    <a href="/admin/ge_tui_messages/message_content?id={{ ge_tui_message.id }}">添加消息</a>
{%- /macro %}

{%- macro message_contnet_list(ge_tui_message) %}
    <a href="/admin/ge_tui_messages/message_content_list?id={{ ge_tui_message.id }}">查看消息({{ ge_tui_message.push_message_id }})</a>
{%- /macro %}

{{ simple_table(ge_tui_messages, ['ID':'id', '产品渠道':'product_channel_name', '名称':'name','离线天数':'offline_day',
'状态':'status_text','发送状态':'send_status_text','发送时间':'send_at_text', '发送统计结果':'remark','查看消息':'message_contnet_list','添加消息':'message_contnet_link',
'支持的省份':'support_province_link','发送消息':'message_contnet_send', '操作者':'operator_username','编辑':'edit_link', '终止发送':'delete_link'
]) }}

<script type="text/template" id="ge_tui_message_tpl">
    <tr id="ge_tui_message_${ge_tui_message.id}">
        <td>${ge_tui_message.id}</td>
        <td>${ge_tui_message.product_channel_name}</td>
        <td>${ge_tui_message.name}</td>
        <td>${ge_tui_message.offline_day}</td>
        <td>${ge_tui_message.status_text}</td>
        <td>${ge_tui_message.send_status_text}</td>
        <td>${ge_tui_message.send_at_text}</td>
        <td>${ge_tui_message.remark}</td>
        <td>
            <a href="/admin/ge_tui_messages/message_content_list?id=${ge_tui_message.id}">查看消息(${ge_tui_message.push_message_id})</a>
        </td>
        <td>
            <a href="/admin/ge_tui_messages/message_content?id=${ge_tui_message.id}">添加消息</a>
        </td>
        <td>
            <a href="/admin/ge_tui_messages/support_province/${ge_tui_message.id}"
               class="modal_action">支持的省份</a>
        </td>
        <td>
            <a href="/admin/ge_tui_messages/message_content_send?id=${ge_tui_message.id}"
               id="send_msg">发送消息</a>
        </td>
        <td>${ge_tui_message.operator_username}</td>
        <td>
            <a href="/admin/ge_tui_messages/edit/${ge_tui_message.id}" class="modal_action">编辑</a>
        </td>
        <td>
            <a href="/admin/ge_tui_messages/delete/${ge_tui_message.id}" class="delete_action"
               data-target="#ge_tui_message_${ge_tui_message.id}">终止发送</a>
        </td>
    </tr>
</script>

<script type="text/javascript">
    $('body').on('click', '#send_msg', function (e) {
        e.preventDefault();
        if (confirm('确认发送？')) {
            var href = $(this).attr('href');
            $.post(href, '', function (resp) {
                if (0 == resp.error_code) {
                    alert('消息已发送~~');
                } else {
                    alert(resp.error_reason);
                }
            });
        }
    })
</script>