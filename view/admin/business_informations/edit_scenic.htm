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

{{ f.input('spider_status',['label': '爬虫状态(-1待一 0忽略 1完成 2待二)', 'width':'33%']) }}
{{ f.input('spider_id',['label': '爬虫来源id', 'width':'33%']) }}
{{ f.input('spider_source',['label': '爬虫来源（1=携程）', 'width':'33%']) }}


{{ f.input('longitude',['label': '经度', 'width':'50%']) }}
{{ f.input('latitude',['label': '纬度', 'width':'50%']) }}

{{ f.input('mobile_string',['label': '电话号码(英文空格分割)']) }}

    {{ f.input('level',['label': '等级', 'width':'50%']) }}
    {{ f.input('website',['label': '网址', 'width':'50%']) }}
    {{ f.input('scenic_consult',['label': '景区-咨询景区']) }}
    {{ f.textarea('ticket_info',['label': '景区-门票信息']) }}
    {{ f.input('special_policy',['label': '景区-优待政策']) }}
    {{ f.input('basic_facility',['label': '景区-基础设施(wifi;shop;talk_machine;restaurant)']) }}
    {{ f.input('time_consult',['label': '景区-用时参考']) }}
    {{ f.textarea('recommend_play',['label': '景区-游玩贴士']) }}
    {{ f.textarea('most_play_time',['label': '景区-最佳游玩时间']) }}
    {{ f.textarea('price',['label': '景区-门票价格']) }}
    {{ f.textarea('traffic_info',['label': '景区-交通攻略（分号不能丢）如：(subway:轨道交通9号线到商城里下车;bus:116路)']) }}

<div class="clear"></div>
<label class="string optional control-label">景区介绍（富文本）</label>
<div class="editor" id="editor">
<p>{{ business_info.scenic_content }}</p>
</div>
<div class="clear"></div><br/>


{{ f.select('type',['label': '商户类型','collection': BusinessInformations.TYPE, 'width':'50%']) }}

{{ f.select('status',['label': '状态','collection': BusinessInformations.STATUS, 'width':'50%']) }}
{{ f.input('remark',['label': '备注']) }}

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
}
editor.create()
$('.w-e-text-container').height('100%');
</script>
