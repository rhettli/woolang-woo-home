<input type="hidden" name="product_channel_id" id="product_channel_id" value="{{ product_channel_id }} ">

<label for="fr_eq">请输入FR</label>
<input name="fr" type="text" id="fr_eq"/>

<button id="generate_btn">生成</button>

<br/>

<div id="qr_code"></div>


<script type="text/javascript">
    $(function () {
        $('#generate_btn').click(function () {
            $.get('/admin/product_channels/get_limit_qrcode_url',
                {'product_channel_id': $('#product_channel_id').val(), 'fr': $('#fr_eq').val()}, function (resp) {
                    var tpl = $('#qr_code_tpl').html();
                    var html = juicer(tpl, resp);
                    $('#qr_code').html(html);
                });
        });
    });
</script>


<script type="text/template" id="qr_code_tpl">
    <span>右键下载二维码</span></br>
    <img src="${img_url}" />
    <br>
</script>