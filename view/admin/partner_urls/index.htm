<a href="/admin/partner_urls/new" class="modal_action">新建规则</a>

<form method="post" action="/admin/partner_urls/generate_url" name="search_form" autocomplete="off">
    <label for="product_channel_id">
        产品
    </label>
    <select name="product_channel_id" id="product_channel_id" class="selectpicker" data-live-search="true">
        {{ options(product_channels, product_channel_id, 'id', 'name') }}
    </select>

    <label for="partner_url_id">
        链接规则
    </label>
    <select name="partner_url_id" id="partner_url_id" class="selectpicker" data-live-search="true">
        {{ options(partner_urls, partner_url_id, 'id', 'name') }}
    </select>

    <label for="partner_id">
        推广渠道(ios必选)
    </label>
    <select name="partner_id" id="partner_id" class="selectpicker" data-live-search="true">
        {{ options(partners, partner_id, 'id', 'name') }}
    </select>

    <button class="ui button" type="button" id="generate">生成链接</button>
</form>
<br/>
<ol class="breadcrumb">
    <li class="active">链接: <a href="#" id="url"></a></li>
</ol>

{% macro edit_link(partner_url) %}
    <a href="/admin/partner_urls/edit/{{ partner_url.id }}" class="modal_action">编辑</a>
{% /macro %}

{{ simple_table(partner_urls,['ID': 'id','名称': 'name','类型': 'type_text','平台':'platform',
'域名':'domain','操作者':'operator_username','编辑':'edit_link']) }}

<script type="text/template" id="partner_url_tpl">
    <tr id="partner_url_${partner_url.id}">
        <td>${partner_url.id}</td>
        <td>${partner_url.name}</td>
        <td>${partner_url.type_text}</td>
        <td>${partner_url.platform}</td>
        <td>${partner_url.domain}</td>
        <td>${partner_url.operator_username}</td>
        <td>
            <a href="/admin/partner_urls/edit/${partner_url.id}" class="modal_action">编辑</a>
        </td>
    </tr>
</script>

<script>
    $(function () {
        $("#generate").click(function () {
            var product_channel_id = $("#product_channel_id").val();
            var partner_id = $("#partner_id").val();
            var partner_url_id = $("#partner_url_id").val();
            if (!product_channel_id) {
                alert('请选择产品');
                return;
            }
            if (!partner_url_id) {
                alert('请选择规则');
                return;
            }
            $.post('/admin/partner_urls/generate_url', {
                product_channel_id: product_channel_id,
                partner_id: partner_id,
                partner_url_id: partner_url_id
            }, function (resp) {

                if (resp.error_code == 0) {
                    $("#url").html(resp.url);
                }else {
                    alert(resp.error_reason);
                }
            });
        })

    });

</script>