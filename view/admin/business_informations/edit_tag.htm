<h5>为商户："{{business_info.name}}" 选择标签</h5>
<span>点击选择标签(红色背景为选中状态)</span> <br/>


    {% for item in tags %}
    <h5>{{item['title']}}</h5>
<div style="padding-top:10px;display:flex;flex-wrap:wrap;">
    {% for val in item['tags'] %}
    <div style="padding-bottom:6px;">
           <span data-id="{{val.id}}" id="tag_{{val.id}}" onclick="on_tag_click(this);"
                 style="cursor:pointer;background-color:#504e75;padding:3px 8px;color: white;margin-right:8px;border-radius:3px;"> {{val.name}}
           </span>
    </div>
    {% endfor %}
</div>
    {% endfor %}



{% set f = simple_form([ 'admin', business_info ], ['class':'ajax_model_form']) %}

{{ f.hidden('tag_ids')}}
{{ f.hidden('op')}}

<input type="hidden" name="uid" value="{{uid}}"/>
<input type="hidden" id="business_information_tag_ids_old" name="business_information[tag_ids_old]">
{{ f.submit('保存') }}

{{ f.end }}

<div style="margin-top:18px;width:100%;"></div>

<script>
    let tag_ids={{business_info.tag_ids}};

    function on_tag_click(self) {
        let self_jq = $(self);
        let ele_tag = $('#business_information_tag_ids');
        let bg_color_temp = self_jq.css('background-color');

        console.log('背景色：' + bg_color_temp);
        let id = self_jq.attr('data-id');
        if (bg_color_temp != 'rgb(255, 0, 0)') {
            self_jq.css('background-color', 'red');
            ele_tag.val(ele_tag.val() + ',' + id);
        } else {
            self_jq.css('background-color', '#504e75');

            ele_tag.val((ele_tag.val()).replace(id, ''));
        }
    }
    $(function () {
        let ele_tag = $('#business_information_tag_ids');
        let val= ele_tag.val().replace('[','').replace(']','');
        ele_tag.val(val);
        $('#business_information_tag_ids_old').val(val);

        for (let i = 0; i < tag_ids.length; i++) {
            $('#tag_'+tag_ids[i]).css('background-color', 'red');
        }
    });

</script>
