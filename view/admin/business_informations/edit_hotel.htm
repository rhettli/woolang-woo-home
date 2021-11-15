<style>
    .document{
        display: flex;
        margin: 0 auto;
        padding: 0;
    }
    .editor{
        width: 100%;
    }
    .ajax_model_form{
        width: 100%;
    }
    .error_reason{
        margin-top: 20px ;
        color: red;
    }
    .clear{
        overflow: hidden;
        clear: both;
    }
    .textarea.form-control{
        height:200px;
    }
    .modal-dialog {
        width: 780px;
    }

</style>

{% set f = simple_form([ 'admin', business_info ], ['class':'ajax_model_form']) %}

{{ f.input('name',['label': '商户名称', 'width':'50%']) }}
{{ f.input('point_name',['label': '寄存点名称', 'width':'50%']) }}
{{ f.input('city',['label': '城市', 'width':'50%']) }}
{{ f.input('detailed_address',['label': '详细地址', 'width':'50%']) }}
{{ f.input('no',['label': '商户编号', 'width':'50%']) }}

{{ f.input('open_time_data',['label':'营业时间(周一-周二 8:00-20:30;周日 07:30-23:00)', 'width':'50%']) }}

{{ f.input('longitude',['label': '经度', 'width':'50%']) }}
{{ f.input('latitude',['label': '纬度', 'width':'50%']) }}

{{ f.input('mobile_string',['label': '电话号码(英文空格分割)']) }}

    {{ f.input('h_subtitle',['label': '子标题描述']) }}

    {{ f.textarea('h_order_notice',['label': '预定须知', 'height':'60px']) }}
    {{ f.input('h_in_time',['label': '入住时间']) }}
    {{ f.input('h_out_time',['label': '退房时间']) }}
    {{ f.input('h_wechat',['label': '微信号']) }}

        {{ f.select('h_have_breakfast', ['label': '是否含有早餐', 'collection': Banners.STATUS, 'width':'50%']) }}
        {{ f.select('h_can_pets', ['label': '是否携带宠物', 'collection': Banners.STATUS, 'width':'50%']) }}

<div class="clear"></div>
<label class="string optional control-label">酒店介绍（富文本）</label>
<div class="editor" id="editor">
<p>{{ business_info.scenic_content }}</p>
</div>
<div class="clear"></div><br/>


{{ f.select('type',['label': '商户类型','collection': BusinessInformations.TYPE, 'width':'50%']) }}

{{ f.select('status',['label': '状态','collection': BusinessInformations.STATUS, 'width':'50%']) }}
{{ f.input('remark',['label': '备注']) }}

{{ f.hidden('op')}}
{{ f.hidden('scenic_content') }}

{{ f.submit('保存') }}

{{ f.end }}



<script type="text/javascript">
/**
 *  富文本编辑器
 *  图片上传
 *  uploadImgMaxSize 尺寸设置
 *  uploadImgMaxLength 上传图片个数
 *  uploadFileName 上传图片接收名称
 *  uploadImgHeaders 设置上传请求头
 *  uploadImgServer 上传服务器图片地址
 *  uploadImgHooks 上传图片监听状态
 */
var E = window.wangEditor;
var editor = new E('#editor');
var $text = $('#business_information_scenic_content');
// $('#document_article_action').val("{{ action }}");
editor.customConfig.onchange = function (html) {
    $text.val(html);
};

editor.customConfig.uploadImgMaxSize = 5 * 1024 * 1024;
editor.customConfig.uploadImgMaxLength = 9;
editor.customConfig.uploadFileName = 'document_file[]';
editor.customConfig.uploadImgHeaders = {'Accept': 'text/x-json'};
editor.customConfig.uploadImgServer = '/admin/business_informations/upload_images';
editor.customConfig.uploadImgHooks = {
    before: function (xhr, editor, files) {
    },
    success: function (xhr, editor, result) {
        console.log("成功！",result);
    },
    fail: function (xhr, editor, result) {
        console.log("失败！",result);
    },
    error: function (xhr, editor) {
        console.log("错误！",result);
    },
    timeout: function (xhr, editor) {
        console.log("超时！",result);
    },
};
editor.create();
$('.w-e-text-container').height('100%');
</script>
