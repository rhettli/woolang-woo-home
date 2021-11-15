<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Log Monitor</title>
    <link href="/framework/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/monitor_customer.css" rel="stylesheet">
    <link href="/css/monitor_magula.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style>
        #content {
            margin-top: 20px;
            border: 1px solid #CCCCCC;
            border-radius: 4px;
            height: 600px;
            overflow: scroll;
            padding: 6px;
        }
    </style>
</head>

<body>

<div class="navbar navbar-fixed-top navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:;">Logs Monitor</a>
        </div>
    </div>
</div>

<div class="container">
    <div id="idServers">
        <div class="row">
            <div class="col-sm-12">
                <div class="btn-group machine" role="group">
                    {% for name,ip in names %}
                        <btn data-name="{{ name }}" class="btn btn-default">{{ name }}</btn>
                    {% endfor %}
                </div><br>

                <div class="btn-group log" role="group">
                    <btn data-type="nginx" class="btn btn-default">nginx_error</btn>
                    <btn data-type="php" class="btn btn-default">php_errors</btn>
                    <btn data-type="fpm_slow" class="btn btn-default">fpm_slow</btn>
                    <btn data-type="async" class="btn btn-default">async.log</btn>
                    <btn data-type="websocket" class="btn btn-default">websocket.log</btn>
                </div>
                <br>
                <pre id="content">
                </pre>
            </div>
        </div>
    </div>
</div>
<script src='/js/jquery/1.11.2/jquery.min.js'></script>
<script src="/framework/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="/js/juicer/0.6.9/juicer-min.js"></script>
<script src="/js/admin.js"></script>
<script>
    $(function () {
        var current_name = '';
        var current_index = -1;
        var current_type = '';
        $(".btn-group btn").click(function () {
            $(this).siblings('btn').removeClass('btn-primary');
            $(this).addClass('btn-primary');
        });

        $(".machine btn").click(function () {
            current_name = $(this).data('name');
            if (current_index > -1) {
                $(".log btn").eq(current_index).click();
            }
        });

        $(".log btn").click(function () {
            current_type = $(this).data('type');
            current_index = $(this).index();
            var url = '/admin/monitor/log_detail?type=' + current_type + '&name=' + current_name;
            $.get(url, function (resp) {
                var content = $("#content");
                content.html(resp);
                content.scrollTop(content.scrollHeight);
            });
        });

        $(".machine btn:first").click();
        $(".log btn:first").click();

        setInterval(function () {
            $(".log btn").eq(current_index).click();
        }, 10000);
    });
</script>
</body>
</html>
