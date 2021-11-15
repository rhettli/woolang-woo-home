<form action="/admin/active_users/day_rank_list" method="get" class="search_form" autocomplete="off" id="search_form">

    <label for="start_at_eq">开始时间</label>
    <input name="start_at" type="text" id="start_at_eq" class="form_datetime" value="{{ start_at }}"/>

    <button type="submit" class="ui button">搜索</button>
</form>

<div style="height: 400px;background: white;width:100%;" class="col-sm-6">
    <div id="active_user_stat" style="height:600px;width:1200px"></div>
</div>

<script type="text/javascript">
    // $('.selectpicker').selectpicker();

    $(".form_datetime").datetimepicker({
        language: "zh-CN",
        format: 'yyyy-mm-dd ',
        autoclose: 1,
        todayBtn: 1,
        todayHighlight: 1,
        minView: 2,
        startView: 2
    });
    var active_result_datas = {{ active_user_number }};
    //    console.log(active_result_datas);
    $(function () {
        active_user_stat();
    });

    function active_user_stat() {
        var active_user_stat = echarts.init(document.getElementById('active_user_stat'), 'chalk');
        var time_index = Object.keys(active_result_datas);
        var number_value = Object.values(active_result_datas);

        var date = time_index;
        var data = number_value;

        var option = {
            tooltip: {
                trigger: 'axis',
                position: function (pt) {
                    return [pt[0], '10%'];
                }
            },
            title: {
                left: 'center',
                text: '在线用户'
            },
            toolbox: {
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    restore: {},
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: date
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'人数',
                    type:'line',
                    smooth:true,
                    symbol: 'none',
                    sampling: 'average',
                    itemStyle: {
                        normal: {
                            color: 'rgb(255, 70, 131)'
                        }
                    },
                    areaStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgb(255, 158, 68)'
                            }, {
                                offset: 1,
                                color: 'rgb(255, 70, 131)'
                            }])
                        }
                    },
                    data: data
                }
            ]
        };


        active_user_stat.setOption(option);
    }


</script>