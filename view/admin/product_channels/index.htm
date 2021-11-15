<form action="/admin/product_channels" method="get" class="search_form" autocomplete="off">
    <a href="/admin/product_channels/new" class="modal_action">新建</a>

    <label for="id_eq">ID</label>
    <input name="product_channel[id_eq]" type="text" id="id_eq"/>

    <label for="name_eq">产品渠道名称</label>
    <select name="product_channel[name_eq]" id="name_eq" class="selectpicker" data-live-search="true">
        {{ options(all_product_channels, '', 'name', 'name') }}
    </select>

    <button type="submit" class="ui button">搜索</button>
</form>

{%- macro avatar_link(product_channel) %}
    <img src="{{ product_channel.avatar_small_url }}" height="50" width="50"/>
{%- /macro %}

{%- macro weixin_link(product_channel) %}
    {% if _is_allowed('product_channels','xcx_config') %}
        <a href="/admin/product_channels/xcx_config/{{ product_channel.id }}" class="modal_action">wx小程序配置</a><br/>
    {% endif %}
    {% if _is_allowed('product_channels','ali_config') %}
        <a href="/admin/product_channels/ali_config/{{ product_channel.id }}" class="modal_action">阿里小程序配置</a><br/>
    {% endif %}
    {% if _is_allowed('product_channels','weixin_config') %}
        <a href="/admin/product_channels/weixin_config/{{ product_channel.id }}" class="modal_action">公众号配置</a><br/>
    {% endif %}
    {% if _is_allowed('product_channels','touch_config') %}
        <a href="/admin/product_channels/touch_config/{{ product_channel.id }}" class="modal_action">手机H5配置</a><br/>
    {% endif %}
    {% if _is_allowed('product_channels','web_config') %}
        <a href="/admin/product_channels/web_config/{{ product_channel.id }}" class="modal_action">电脑web配置</a><br/>
    {% endif %}
    {% if _is_allowed('product_channels','ttxcx_config') %}
        <a href="/admin/product_channels/ttxcx_config/{{ product_channel.id }}" class="modal_action">头条小程序配置</a><br/>
    {% endif %}
{%- /macro %}

{%- macro weixin_tools_link(product_channel) %}
    {% if _is_allowed('product_channels','weixin_menu') %}
        <a href="/admin/product_channels/weixin_menu/{{ product_channel.id }}" class="modal_action">微信菜单</a><br/>
    {% endif %}
    {% if _is_allowed('product_channels','generate_weixin_qrcode') %}
        <a href="/admin/product_channels/generate_weixin_qrcode/{{ product_channel.id }}"
           class="modal_action">生成微信二维码</a>
        <br/>
    {% endif %}
    {% if _is_allowed('weixin_share_domains','index') %}
        <a href="/admin/weixin_share_domains?product_channel_id={{ product_channel.id }}">公众号分享域名配置</a><br>
    {% endif %}
{%- /macro %}

{% macro oper_link(product_channel) %}
    {% if _is_allowed('product_channels','edit') %}
        <a href="/admin/product_channels/edit/{{ product_channel.id }}" class="modal_action">编辑</a><br/>
    {% endif %}
    {% if _is_allowed('product_channels','push') %}
        <a href="/admin/product_channels/push/{{ product_channel.id }}" class="modal_action">个推配置</a><br/>
    {% endif %}
    {% if _is_allowed('product_channels','notice') %}
        <a href="/admin/product_channels/notice/{{ product_channel.id }}" class="modal_action">设置消息通知</a><br/>
    {% endif %}
{% /macro %}

{%- macro company_info(product_channel) %}
    公司名称: {{ product_channel.company_name }} <br/>
    客服电话: {{ product_channel.service_phone }}<br/>
    ICP备案: {{ product_channel.icp }}
{%- /macro %}

{%- macro client_info(product_channel) %}
    ios客户端稳定版本号: {{ product_channel.apple_stable_version }} <br/>
    安卓客户端稳定版本号: {{ product_channel.android_stable_version }} <br/>
    小程序稳定版本号: {{ product_channel.xcx_stable_version }} <br/>
{%- /macro %}

{%- macro base_info(product_channel) %}
    code: {{ product_channel.code }} <br/>
    产品渠道名称: {{ product_channel.name }} <br/>
    状态: {{ product_channel.status_text }} <br/>
{%- /macro %}

{% macro sku_link(product_channel) %}
    {% if _is_allowed('product_channel_products','index') %}
        <a href="/admin/product_channel_products?product_channel_product[product_channel_id_eq]={{ product_channel.id }}">商品列表</a><br>
    {% endif %}
    {% if _is_allowed('floor_styles','index') %}
        <a href="/admin/floor_styles?floor_style[product_channel_id_eq]={{ product_channel.id }}">楼层样式配置</a><br>
    {% endif %}
{% /macro %}

{{ simple_table(product_channels, ['ID': 'id', '基础配置': 'base_info', 'Icon':'avatar_link', '商品列表':'sku_link',
    '公司信息':'company_info', '版本信息': 'client_info', '微信配置':'weixin_link','微信工具':'weixin_tools_link','操作':'oper_link' ]) }}

<script type="text/javascript">
    $(function () {
        $('.selectpicker').selectpicker();
    });

    {% for product_channel in product_channels %}
    {% if product_channel.status != 1 %}
    $("#product_channel_{{ product_channel.id }}").css({"background-color": "grey"});
    {% endif %}
    {% endfor %}

</script>
