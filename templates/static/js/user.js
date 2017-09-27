$(function () {
    // 基于准备好的dom，初始化echarts实例
    var statusChart = echarts.init(document.getElementById('status'));
    statusChart.showLoading();
    var tr_len = $('#status').parent().find('tr').length; //页面中table下‘tr’标签的数量
    var statusData = [];
    // 获得页面中各种status的名称和数值
    for(var i = 3; i < tr_len; i++)
    {
        var status_name = $('#status').parent().find('tr').eq(i).find('td').eq(0).text();
        var status_value = parseInt($('#status').parent().find('tr').eq(i).find('td').eq(1).text());
        statusData.push({name: status_name, value: status_value});//, label:{normal:{show:true, position:'inside'}}
    }
    var option = {
        // title:{
        //     text: ''
        // },
        tooltip:{
            trigger: 'item',
            formatter: "{b} : {c}({d}%)" //{a}{b}{c}{d}分别表示系列名，数据名，数据之，百分比
        },
        legend:{
            orient: 'horizontal',
            x: 'left',
            // y: 'bottom',
            // z: 0,
            data: statusData
            // textStyle:{
            //     // fontFamily: 'console',
            //     fontWeight: 'bold'
            // }
        },
        series:[
            {
                // roseType: true,
                itemStyle:{
                    normal: {
                        shadowColor: 'rgb(128, 128, 128)',
                        shadowBlur: 10,
                        shadowOffsetX: 1,
                        shadowOffsetY: 1
                    }
                },
                // labelLine:{
                //     normal:{
                //         // smooth: true,
                //         lineStyle:{
                //             width: 2
                //     }
                //     }
                // },
                label:{
                    normal:{
                        formatter: "{b}({d}%)"
                        // textStyle:{
                        //     // fontFamily: 'console',
                        //     fontWeight: 'bold'
                        // }
                    }
                },
                type: 'pie',
                radius: '55%',
                data: statusData
            }
        ]
    };
    // option.series[0].data[1].label.normal.show = true;
    // 使用刚指定的配置项和数据显示图表。
    statusChart.hideLoading();
    statusChart.setOption(option);
});


// $(".a_post").on("click",function(event){
//     // event.preventDefault();//使a自带的方法失效，即无法跳转到href中的URL
//     $.ajax({
//         type: "POST",
//         url: "archive",
//         contentType:"application/json",
//         data: {user_id: $.cookie('uname')},//参数列表
//         dataType:"json",
//         complete:function(){location.href ="archive"}//跳转页面
//         // success: function(result){
//         //     alert(data);
//         // },
//         // error: function(result){
//         //     alert("Can not get the archive!");
//         // }
//
//     });
// });
//
// $.ajax(function(){
//     type:"POST",
//     dataType:"json",
//     url:"default.aspx",//请求页面
//     data:"{id=1}",
//     complete:function(){location.href ="default.aspx"}//跳转页面
// });

// $(document).ready(function(){
//     $(".a_post").click(function(request){
//         location.href = "archive";
//         $.post("archive", {user_id: $.cookie('uname')});
//         // function() {
//         //   location.href = "archive";
//         // }
//         // );
//     });
// });
