<style>
    .modal-dialog {
        width: 900px;
    }

    .controller_group {
        border: 1px solid #ccc;
        margin: 4px 0;
        font-size: 14px;
        border-radius: 4px;
    }

    .controller_group div.controller {
        color: #6f9fd5;
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }

    .controller_group div.actions {

        overflow: hidden;
        padding: 10px 0;
    }

    .controller_group div.actions span {
        margin-left: 8px
    }
</style>

<div class="role-authrize">
    <form method="post" action="/admin/operator_roles/update_permissions?id={{ operator_role.id }}"
          class="ajax_model_form"
          data-model="operator_role">
        {% for permission_group_key,permission_group in permission_groups %}
            <div class="controller_group">
                <div class="controller">
                    {% if permission_group['description'] %}
                        {{ permission_group['description'] }}
                    {% else %}
                        {{ permission_group['ctrl_name'] }}
                    {% endif %}
                    <input type="checkbox"/>
                </div>
                <div class="actions">
                    {% for permission_item_key,permission_item in permission_group['actions'] %}
                        <span>
                            {% if permission_item['description'] %}
                                {{ permission_item['description'] }}
                            {% else %}
                                {{ permission_item['action_name'] }}
                            {% endif %}
                    <input name="permission_items[]" type="checkbox"
                           value="{{ permission_item['name'] }}" {% if operator_role.contain(permission_item['name']) %} checked="checked" {% endif %}>
                    </span>
                    {% endfor %}
                </div>
            </div>
        {% endfor %}
        <input type="hidden" name="module" value="{{ module }}">
        <div class="form-group">
            <div class="form-group clear submit">
                <button type="submit" class="btn btn-primary">保存</button>
            </div>
        </div>
    </form>
</div>

<script>
    $(function () {
        var controller_checks = $(".controller").find('input[type="checkbox"]');
        controller_checks.click(function () {
            var checked = this.checked;
            $(this).parents('.controller').siblings('.actions').find('input[type="checkbox"]').each(function () {
                this.checked = checked;
            });
        });
    })
</script>
