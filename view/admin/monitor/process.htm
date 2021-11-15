<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Process Monitor</title>
    <link href="/framework/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/monitor_customer.css" rel="stylesheet">
    <link href="/css/monitor_magula.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style>
        #content_detail {
            margin-top: 20px;
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
            <a class="navbar-brand" href="javascript:;">Process Monitor</a>
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
                </div>
                <div id="content_detail">
                </div>
            </div>
        </div>
    </div>
    <div id="idServersCopy" style="display:none"></div>
</div>

<script type="text/template" id="process_detail_tpl">
    <table class="table table-bordered">
        <tr>
            <th colspan="5" style="text-align: center;color: green;">异步任务</th>
        </tr>
        <tr>
            <th>进程用户</th>
            <th>进程id</th>
            <th>开始时间</th>
            <th>状态</th>
            <th>运行时长(h)</th>
        </tr>
        {@each async_start as item, index}
        <tr>
            <td>${ item.user }</td>
            <td>${ item.pid }</td>
            <td>${ item.execute_at }</td>
            <td>${ item.status }</td>
            <td>${ item.execute_time }</td>
        </tr>
        {@/each}
    </table>
    <table class="table table-bordered">
        <tr>
            <th colspan="5" style="text-align: center;color: green;">swoole任务</th>
        </tr>
        <tr>
            <th>进程用户</th>
            <th>进程id</th>
            <th>开始时间</th>
            <th>状态</th>
            <th>运行时长(h)</th>
        </tr>
        {@each websocket_start as item, index}
        <tr>
            <td>${ item.user }</td>
            <td>${ item.pid }</td>
            <td>${ item.execute_at }</td>
            <td>${ item.status }</td>
            <td>${ item.execute_time }</td>
        </tr>
        {@/each}
    </table>
</script>

<script src='/js/jquery/1.11.2/jquery.min.js'></script>
<script src="/framework/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="/js/juicer/0.6.9/juicer-min.js"></script>
<script src="/js/admin.js"></script>

<script>
    $(function () {
        var current_index = 0;
        $(".machine btn").click(function () {
            $(this).siblings('btn').removeClass('btn-primary');
            $(this).addClass('btn-primary');
            current_name = $(this).data('name');

            var url = "/admin/monitor/process_detail?name=" + current_name;
            current_index = $(this).index();

            var tpl = $('#process_detail_tpl').html();
            $.getJSON(url, function (resp) {
                var html = juicer(tpl, resp);
                $('#content_detail').html(html);
            });
            return false;
        });
        $(".machine btn:first").click();

        setInterval(function () {
            $(".machine btn").eq(current_index).click();
        }, 10000);
    });
</script>
</body>
</html>
