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

<div class="clear"></div>
<label class="string optional control-label">景区介绍（富文本）</label>
<div class="editor" id="editor">
<p>{{ business_info.scenic_content }}</p>
</div>
<div class="clear"></div><br/>

{{ f.hidden('op')}}
{{ f.hidden('scenic_content') }}

<input type="hidden" name="uid" value="{{uid}}"/>
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
editor.customConfig.uploadImgServer = '/admin/business_informations/upload_images?uid={{uid}}';
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
}
editor.create()
$('.w-e-text-container').height('100%');
$('nav').hide();
</script>
