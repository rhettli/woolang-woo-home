{%- macro attrs(operating_record) %}
    {% if operating_record.data %}
        {% for value in operating_record.data | json_decode %}
            {% set strs = _str_split(value, 160) %}
            {% for v in strs %}
                {{ v }}<br/>
            {% endfor %}
        {% endfor %}
    {% endif %}
{%- /macro %}

<form action="/admin/operating_records" method="get" class="search_form" autocomplete="off" id="search_form">

    <label for="operator_id_eq">操作者</label>
    <select name="operating_record[operator_id_eq]" id="operator_id" class="selectpicker" data-live-search="true">
        {{ options(operators, '', 'id', 'username') }}
    </select>

    <label for="table_name_eq">table_name</label>
    <select name="operating_record[table_name_eq]" id="table_name_eq" class="selectpicker" data-live-search="true">
        {{ options(table_names) }}
    </select>

    <button type="submit" class="ui button">搜索</button>
</form>

{{ simple_table(operating_records,[
'id': 'id','操作者':'operator_username', '操作':'action_type_text', 'table_name':'table_name','target_id':'target_id',
'属性':'attrs','创建时间': 'created_at_text']) }}