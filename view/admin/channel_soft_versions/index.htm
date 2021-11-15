<a href="/admin/channel_soft_versions/new" class="modal_action">添加新版本</a>
<form name="search_form" action="/admin/channel_soft_versions" method="get" autocomplete="off">
    <label for="id_eq">ID</label>
    <input name="soft_version[id_eq]" type="text" id="id_eq"/>
    <label for="soft_version_platform_eq">手机平台</label>
    <select name="soft_version[platform_eq]" id="platform_eq">
        {{ options(SoftVersions.PLATFORM) }}
    </select>

    <label for="product_channel_id_eq">产品渠道</label>
    <select name="soft_version[product_channel_id_eq]" id="product_channel_id_eq" class="selectpicker" data-live-search="true">
        {{ options(product_channels,'','id','name') }}
    </select>

    <label for="name_eq">内置FR</label>
    <select name="soft_version[built_in_fr_eq]" id="built_in_fr_eq" class="selectpicker" data-live-search="true">
        {{ options(partners, '', 'fr', 'name') }}
    </select>

    <button type="submit" class="ui button">搜索</button>
</form>


{% macro down_url(soft_version) %}
    <a target="_blank" href="{{ soft_version.file_url }}">点击下载</a>
{% /macro %}
{% macro info(soft_version) %}
    渠道: {{ soft_version.product_channel_name }} 平台: {{ soft_version.platform_text }}<br/>
    版本号: {{ soft_version.version_code }}  版本名称: {{ soft_version.version_name }}<br/>
    安装包内置fr: {{ soft_version.built_in_fr }}
{% /macro %}

{% macro edit_link(soft_version) %}
    <a href="/admin/channel_soft_versions/edit/{{ soft_version.id }}" class="modal_action">编辑</a>
{% /macro %}

{{
simple_table(soft_versions, [
'ID': 'id', '创建时间': 'created_at_text', '软件信息': 'info',
'更新简介': 'feature', '下载次数': 'download_num', '升级次数': 'updated_num', '更新时间':'updated_at_text','备注': 'remark',
'下载地址': 'down_url', '操作者':'operator_username','编辑': 'edit_link'])
}}


<script type="text/template" id="soft_version_tpl">
    <tr id="soft_version_${soft_version.id}">
        <td>${soft_version.id}</td>
        <td>${soft_version.created_at_text}</td>
        <td>渠道: ${ soft_version.product_channel_name } 平台: ${ soft_version.platform_text }<br/>
            版本号: ${ soft_version.version_code } 版本名称: ${ soft_version.version_name }<br/>
            安装包内置fr: ${ soft_version.built_in_fr }
        </td>
        <td>${soft_version.feature}</td>
        <td>${soft_version.download_num}</td>
        <td>${soft_version.updated_num}</td>
        <td>${soft_version.updated_at_text}</td>
        <td>${soft_version.remark}</td>
        <td>
            <a target="_blank" href="${ soft_version.file_url}">点击下载</a>
        </td>
        <td>${soft_version.operator_username}</td>
        <td>
            <a href="/admin/channel_soft_versions/edit/${soft_version.id}" class="modal_action">编辑</a>
        </td>
    </tr>
</script>