<ol class="breadcrumb">
    测试联调:
    <br/>
    <br/>
    <form method="post" action="/admin/gdt_configs/test_gdt" name="search_form" autocomplete="off">
        <label for="product_channel_id">
            产品
        </label>
        <select name="product_channel_id" id="product_channel_id" class="selectpicker" data-live-search="true">
            {{ options(product_channels, product_channel_id, 'id', 'name') }}
        </select>

        <label for="platform">
            平台
        </label>
        <select name="platform" id="platform">
            {{ options(platforms, platform) }}
        </select>

        <label for="partner_id">
            推广渠道(ios必选)
        </label>
        <select name="partner_id" id="partner_id" class="selectpicker" data-live-search="true">
            {{ options(partners, partner_id, 'id', 'name') }}
        </select>

        <label for="imei">IMEI</label>
        <input type="text" name="imei" id="imei">

        <label for="idfa">IDFA</label>
        <input type="text" name="idfa" id="idfa">

        <button class="ui button" type="button" id="generate">联调</button>
    </form>
    <br/>
    结果:
    <li class="active" id="res"></li>

</ol>

<a href="/admin/gdt_configs/new" class="modal_action">新建</a>


{% macro edit_link(gdt_config) %}
    <a href="/admin/gdt_configs/edit/{{ gdt_config.id }}" class="modal_action">编辑</a>
{% /macro %}

{{ simple_table(gdt_configs,['ID': 'id','名称': 'name','广告组ID': 'advertiser_id','签名密钥': 'sign_key','加密密钥':'encrypt_key',
'操作者':'operator_username','创建时间':'created_at_text','更新时间':'updated_at_text','备注':'remark','编辑':'edit_link']) }}

<script type="text/template" id="gdt_config_tpl">
    <tr id="gdt_config_${gdt_config.id}">
        <td>${gdt_config.id}</td>
        <td>${gdt_config.name}</td>
        <td>${gdt_config.advertiser_id}</td>
        <td>${gdt_config.sign_key}</td>
        <td>${gdt_config.encrypt_key}</td>
        <td>${gdt_config.operator_username}</td>
        <td>${gdt_config.created_at_text}</td>
        <td>${gdt_config.updated_at_text}</td>
        <td>${gdt_config.remark}</td>
        <td>
            <a href="/admin/gdt_configs/edit/${gdt_config.id}" class="modal_action">编辑</a>
        </td>
    </tr>
</script>

<script>
    $(function () {
        $("#generate").click(function () {
            var product_channel_id = $("#product_channel_id").val();
            var partner_id = $("#partner_id").val();
            var platform = $("#platform").val();
            var imei = $("#imei").val();
            var idfa = $("#idfa").val();
            if (!product_channel_id) {
                alert('请选择产品');
                return;
            }
            if (!platform) {
                alert('请选择平台');
                return;
            }
            if (!partner_id) {
                alert('请选择推广渠道');
                return;
            }
            if (!imei && !idfa) {
                alert('填写设备标识');
                return;
            }

            $.post('/admin/gdt_configs/test_gdt', {
                product_channel_id: product_channel_id,
                partner_id: partner_id,
                platform: platform,
                imei: imei,
                idfa: idfa
            }, function (resp) {
                $("#res").html(resp.error_reason);
            });
        })

    });

</script>
