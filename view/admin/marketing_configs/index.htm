<a href="/admin/marketing_configs/new" class="modal_action">新建</a>

{% macro client_info(marketing_config) %}
    应用ID: {{ marketing_config.client_id }}</br>
    应用密钥: {{ marketing_config.client_secret }}
{% /macro %}

{% macro app_info(marketing_config) %}
    安卓应用宝id: {{ marketing_config.android_app_id }}</br>
    AppStore Id: {{ marketing_config.ios_app_id }}
{% /macro %}

{% macro user_action_info(marketing_config) %}
    android用户行为源id: {{ marketing_config.android_user_action_set_id }}</br>
    ios用户行为源id: {{ marketing_config.ios_user_action_set_id }}
{% /macro %}

{% macro refresh_token_info(marketing_config) %}
    {#refresh_token: {{ marketing_config.refresh_token }}</br>#}
    refresh_token过期: {{ marketing_config.refresh_token_expire_at_text }}</br>
    access_token过期: {{ marketing_config.access_token_expire_at_text }}
{% /macro %}

{% macro operate_lind(marketing_config) %}
    {% if _is_allowed('marketing_configs', 'edit') %}
        <a href="/admin/marketing_configs/edit/{{ marketing_config.id }}" class="modal_action">编辑</a><br/>
    {% endif %}
    {% if _is_allowed('marketing_configs', 'authorize') %}
        <a href="/admin/marketing_configs/authorize/{{ marketing_config.id }}" target="_blank">gdt账户授权</a><br/>
    {% endif %}
    {% if _is_allowed('marketing_configs', 'user_action_sets') %}
        <a href="/admin/marketing_configs/user_action_sets/{{ marketing_config.id }}&type=ANDROID" class="user_action_sets">新建android用户行为源</a><br/>
    {% endif %}
    {% if _is_allowed('marketing_configs', 'user_action_sets') %}
        <a href="/admin/marketing_configs/user_action_sets/{{ marketing_config.id }}&type=IOS" class="user_action_sets">新建ios用户行为源</a><br/>
    {% endif %}
{% /macro %}

{{ simple_table(marketing_configs, ['id': 'id','名称': 'name','广告组ID': 'gdt_account_id','marketing应用':'client_info',
'客户端ID':'app_info','用户行为源id':'user_action_info','token过期时间':'refresh_token_info',
'操作者':'operator_username', '更新时间':'updated_at_text','操作': 'operate_lind']) }}

<script type="text/template" id="marketing_config_tpl">
    <tr id="marketing_config_${marketing_config.id}">
        <td>${marketing_config.id}</td>
        <td>${marketing_config.name}</td>
        <td>${marketing_config.gdt_account_id}</td>
        <td>
            应用ID: ${ marketing_config.client_id }</br>
            应用密钥: ${ marketing_config.client_secret }
        </td>
        <td>
            安卓应用宝id: ${ marketing_config.android_app_id }</br>
            AppStore Id: ${ marketing_config.ios_app_id }
        </td>
        <td>
            android用户行为源id: ${ marketing_config.android_user_action_set_id }</br>
            ios用户行为源id: ${ marketing_config.ios_user_action_set_id }
        </td>
        <td>
            refresh_token过期: ${ marketing_config.refresh_token_expire_at_text }</br>
            access_token过期: ${ marketing_config.access_token_expire_at_text }
        </td>
        <td>${marketing_config.operator_username}</td>
        <td>${marketing_config.updated_at_text}</td>
        <td><a href="/admin/marketing_configs/edit/${marketing_config.id}" class="modal_action">编辑</a></td>
    </tr>
</script>


<script type="text/javascript">
    $(function () {

        $(document).on('click', '.user_action_sets', function (event) {
            event.preventDefault();
            if (confirm('确定创建?')) {

                var self = $(this);
                var url = self.attr("href");
                $.get(url, function (resp) {
                    alert(resp.error_reason);
                    location.reload();
                });
            }
            return false;
        });

    });
</script>
