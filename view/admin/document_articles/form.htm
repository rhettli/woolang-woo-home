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

</style>
<p>{{ action_name }} -> {{ document_article.title }}</p>
<div class="document">
        {% set f = simple_form(['admin',document_article],['method':'post', 'class':'ajax_model_form','data-model':'document_articles','width':'100%']) %}
        {{ f.hidden('action') }}
        {{ f.hidden('content') }}
        {{ f.input('title', ['label': '功能名称：', 'width':'50%']) }}
        <div class="clear"></div>
        {{ f.textarea('describe',['label': '摘要描述']) }}
        <div class="clear"></div>
        <label class="string optional control-label">操作步骤</label>
        <div class="editor" id="editor">
            <p>{{ document_article.content }}</p>
        </div>
        <div class="clear"></div><br/>
        {{ f.textarea('tips',['label': '注意事项','row':'50','height':'400px']) }}
        <div class="error_reason"></div>
        {{ f.submit('保存') }}
        {{ f.end }}
</div>


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
    var $text = $('#document_article_content');
    $('#document_article_action').val("{{ action }}");
    editor.customConfig.onchange = function (html) {
        $text.val(html);
    };

    editor.customConfig.uploadImgMaxSize = 5 * 1024 * 1024;
    editor.customConfig.uploadImgMaxLength = 9;
    editor.customConfig.uploadFileName = 'document_file[]';
    editor.customConfig.uploadImgHeaders = {'Accept': 'text/x-json'};
    editor.customConfig.uploadImgServer = '/admin/document_articles/upload_images';
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
</script>