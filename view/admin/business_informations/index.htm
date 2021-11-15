<style>
    .img_photo {
        position: absolute;
        right: 2px;
        text-align: center;
        top: 2px;
        width: 10px;
        color: #e8dede;
        background: rebeccapurple;
        border-radius: 3px;
        /* padding: 2px; */
        cursor: pointer;
        font-size: .5rem;
    }

</style>

<form action="/admin/business_informations" method="get" class="search_form" autocomplete="off" id="search_form">
    <label for="type_eq">商户类型</label>
    <select name="city_position[type_eq]" id="type_eq">
        {{ options(BusinessInformations.TYPE) }}
    </select>


    <label for="id_eq">商户id</label>
    <input name="city_position[id_eq]" type="text" id="id_eq"/>

    <label for="no_eq">商户编号</label>
    <input name="city_position[no_eq]" type="text" id="no_eq"/>

    <label for="name_eq">商户名称</label>
    <input name="city_position[name_eq]" type="text" id="name_eq"/>

    <label for="point_name_eq">寄存点名称</label>
    <input name="city_position[point_name_eq]" type="text" id="point_name_eq"/>

    <label for="city_eq">城市名</label>
    <input name="city_position[city_eq]" type="text" id="city_eq"/>

    <button type="submit" class="ui button">搜索</button>
</form>


<a href="/admin/business_informations/import_csv" class='modal_action'>批量csv文件导入</a>

<hr/>
<div style="padding: 12px;border-radius: 5px;background-color: #efefef;">

    <a href="/admin/tags/add_tags" class='modal_action'>添加标签</a>
    <br/>

    {% for it in tags %}
        <span>{{it['title']}}</span> <br/>
        <div style="padding-top:10px;display:flex;flex-wrap: wrap;">

            {% for val in it['tags'] %}
            <div style="padding-bottom:6px;">
                <img style="width:20px;height:20px;" src="{{val.icon_addr}}"/>
               <span style="background-color:#504e75;padding:3px 8px;color: white;margin-right:8px;border-radius:3px;"> {{val.name}}
               <span><a href="/admin/tags/edit_tags?id={{val.id}}" class='modal_action' style="color:#89f1b3;">编辑</a></span>
                   <!--<span style="color:#d3e44d;cursor: pointer;">X</span>-->
               </span>
            </div>
            {% endfor %}
        </div>
    <br/>
    {% endfor %}

</div>


{% macro edit(bus_info) %}

        {% if bus_info.type == 2 %}
<a href="/admin/business_informations/edit_scenic?id={{bus_info.id}}" class='modal_action'>编辑景点内容</a>
        {% elseif bus_info.type == 1 %}
<a href="/admin/business_informations/edit_hotel?id={{bus_info.id}}" class='modal_action'>编辑酒店内容</a>
        {% else %}
<a href="/admin/business_informations/edit?id={{bus_info.id}}" class='modal_action'>编辑</a>
        {% endif %}

<a href="/admin/business_informations/edit_tag?id={{bus_info.id}}" class='modal_action'>标签编辑</a>
<!--<a href="/admin/business_informations/delete?id={{bus_info.id}}">删除</a>-->
<a href="/admin/business_informations/add_photo?id={{bus_info.id}}" class='modal_action'>添加图片</a>

{% /macro %}

{% macro all_photos(bus_info) %}
{% for val in bus_info.photos %}
<div style="position:relative;width:70px;height:70px;">
    <a href="{{val}}" target='_blank'>
        <img style="position:absolute;width:70px;border: 1px solid #868686;" src="{{ val }}"/>
    </a>
    <span onclick="delete_photo('{{val}}',{{bus_info.id}})" class="img_photo">x</span>
</div>
{% endfor %}
{% /macro %}

{% macro all_mobiles(bus_info) %}
{% for val in bus_info.mobiles %}
{{val}},
{% endfor %}
{% /macro %}

{% macro cityto(bus_info) %}
<a href="/admin/city_positions?city_position[name_eq]={{bus_info.city}}">{{bus_info.city}}</a>
{% /macro %}

{% macro bags_amount_v1(bus_info) %}
{{bus_info.bags_amount}}￥
{% /macro %}

{% macro rucksack_amount_v1(bus_info) %}
{{bus_info.rucksack_amount}}￥
{% /macro %}

{% macro infos(bus_info) %}
编号:{{bus_info.no}}<br/>
寄存点类型:
{% if bus_info.type == 1 %}
<span style="color:rgb(223, 170, 24)">酒店寄存点</span>
{% elseif bus_info.type == 0 %}
<span style="color:rgb(148, 28, 88)">普通寄存点</span>
{% else %}
<span style="color:rgb(17, 136, 110)">景点</span>
{% endif %}
<br/>
商铺名称:{{bus_info.name}}<br/>
寄存点名称:{{bus_info.point_name}}<br/>
电话号码:{{bus_info.mobile_string}}<br/>
详细地址:{{bus_info.detailed_address}}<br/>
爬虫来源:{{bus_info.spider_source}}<br/>
爬虫来源id:{{bus_info.spider_id}}<br/>
爬虫状态:{{bus_info.spider_status_text}}<br/>
{% /macro %}

<div>
<a href="/admin/business_informations/add_normal" class='modal_action'>添加寄存点</a>
<a href="/admin/business_informations/add_hotel" class='modal_action'>添加酒店</a>
<a href="/admin/business_informations/add_scenic" class='modal_action'>添加景点</a>
</div>
{{ simple_table(bus_infos, [
'ID': 'id', '店铺信息': 'infos',
'城市': 'cityto','经度': 'longitude','纬度': 'latitude',
'营业时间':'open_time_data','行李箱收费': 'bags_amount_v1','背包收费': 'rucksack_amount_v1',
'创建时间': 'created_at_text','图片': 'all_photos','备注': 'remark','察看次数': 'watch_times','状态': 'status_text','操作': 'edit']) }}

<script>

    // todo
    function delete_tag(img, id) {


    }

    function delete_photo(img, id) {
        //利用对话框返回的值 （true 或者 false）
        if (confirm("你确定提交删除吗？")) {

        } else {
            return;
        }


        console.log(img, id);
        $.ajax({
            url: "/admin/business_informations/delete_photo?id=" + id, data: {"img": img}, success: function () {
                location.reload();
            }
        });
    }
</script>
