<a href="/admin/payment_channels/new" class="modal_action">新增</a>

{%- macro edit_link(object) %}
    <a href="/admin/payment_channels/edit/{{ object.id }}" class="modal_action">编辑</a>
{%- /macro  %}

{%- macro product_channel_link(object) %}
    <a href="/admin/payment_channels/product_channels?payment_channel_id={{ object.id }}" class="modal_action">产品渠道</a>
{%- /macro %}

{%- macro platforms_link(object) %}
    <a href="/admin/payment_channels/platforms?id={{ object.id }}" class="modal_action">支持平台</a>
{%- /macro %}

{{ simple_table(payment_channels, [
    'ID': 'id', '名称': 'name', '商户名称': 'mer_name', 'payment_type':'payment_type_text','产品渠道': 'product_channel_link','支持平台':'platforms_link','状态': 'status_text',
    '排序':'rank','编辑': 'edit_link'
]) }}

<script type="text/template" id="payment_channel_tpl">
<tr id="payment_channel_${payment_channel.id}">
    <td>${payment_channel.id}</td>
    <td>${payment_channel.name}</td>
    <td>${payment_channel.mer_name}</td>
    <td>${payment_channel.payment_type_text}</td>
    <td><a href="/admin/payment_channels/product_channels?payment_channel_id=${payment_channel.id}" class="modal_action">产品渠道</a></td>
    <td><a href=/admin/payment_channels/platforms?id=${payment_channel.id}" class="modal_action">支持平台</a></td>
    <td>${payment_channel.status_text}</td>
    <td>${payment_channel.rank}</td>
    <td><a href="/admin/payment_channels/edit/${payment_channel.id}" class="modal_action">编辑</a></td>
</tr>
</script>

<script type="text/javascript">
    $(function () {

        {% for payment_channel in payment_channels %}
        {% if payment_channel.status != 1 %}
        $("#payment_channel_{{ payment_channel.id }}").css({"background-color": "grey"});
        {% endif %}
        {% endfor %}
    });
</script>
