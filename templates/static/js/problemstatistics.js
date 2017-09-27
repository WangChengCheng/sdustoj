/**
 * Created by root on 5/22/16.
 */
$(function () {
    // 基于准备好的dom，初始化echarts实例
    var langChart = echarts.init(document.getElementById('lang_status'));
    langChart.showLoading();
    var lang_C = parseInt(document.getElementById('lang_C').value);
    var lang_CPP = parseInt(document.getElementById('lang_CPP').value);
    var lang_Java = parseInt(document.getElementById('lang_Java').value);
    var langData = [];
    lang_C != 0 ? langData.push({name:'C', value: lang_C}) : true;
    lang_CPP != 0 ? langData.push({name:'C++', value: lang_CPP}) : true;
    lang_Java != 0 ? langData.push({name:'Java', value: lang_Java}) : true;

    var option = {
        title:{
            text: 'Language Used'
        },
        tooltip:{
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c}({d}%)" //{a}{b}{c}{d}分别表示系列名，数据名，数据之，百分比
        },
        toolbox:{
            show: true,
            z: 6,
            x: 'right',
            y: 'bottom',
            feature: {
                // dataZoom: {},
                dataView: {readOnly: false},
                // magicType:{
                //     type: ['pie','bar']
                // },
                saveAsImage:{}
            }
        },
        legend:{
            orient: 'vertical',
            x: 'right',
            data: langData,
            textStyle:{
                // fontFamily: 'console',
                fontWeight: 'bold'
            }
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
                labelLine:{
                    normal:{
                        // smooth: true,
                        lineStyle:{
                            width: 2
                    }
                    }
                },
                label:{
                    normal:{
                        formatter: "{b}({d}%)",
                        textStyle:{
                            // fontFamily: 'console',
                            fontWeight: 'bold'
                        }
                    }
                },
                name:'Language',
                type: 'pie',
                radius: '55%',
                data: langData
            }
        ]
    };
    // option.series[0].data[1].label.normal.show = true;
    // 使用刚指定的配置项和数据显示图表。
    langChart.hideLoading();
    langChart.setOption(option);
});


$(function () {
    // 基于准备好的dom，初始化echarts实例
    var submitChart = echarts.init(document.getElementById('submit_status'));
    var AC = parseInt(parseInt(document.getElementById('AC').value));
    var sim = parseInt(document.getElementById('sim').value);
    var WA = parseInt(document.getElementById('WA').value);
    var Waiting = parseInt(document.getElementById('Waiting').value);
    var TLE = parseInt(document.getElementById('TLE').value);
    var MLE = parseInt(document.getElementById('MLE').value);
    var RE = parseInt(document.getElementById('RE').value);
    var OL = parseInt(document.getElementById('OL').value);
    var CE = parseInt(document.getElementById('CE').value);
    var PE = parseInt(document.getElementById('PE').value);
    var SE = parseInt(document.getElementById('SE').value);
    var Judging = parseInt(document.getElementById('Judging').value);
    var submitData_out = [];
    var submitData_in = [];

    sim != 0 ? submitData_out.push({name:'*AC', value: sim}) : true; // 具有相似度的AC
    AC - sim != 0 ? submitData_out.push({name:'AC', value: AC - sim}) : true; // 不具有相似度的AC
    WA != 0 ? submitData_out.push({name:'WA', value: WA}) : true;
    Waiting != 0 ? submitData_out.push({name:'Waiting', value: Waiting}) : true;
    TLE != 0 ? submitData_out.push({name:'TLE', value: TLE}) : true;
    MLE != 0 ? submitData_out.push({name:'MLE', value: MLE}) : true;
    RE != 0 ? submitData_out.push({name:'RE', value: RE}) : true;
    OL != 0 ? submitData_out.push({name:'OL', value: OL}) : true;
    CE != 0 ? submitData_out.push({name:'CE', value: CE}) : true;
    PE != 0 ? submitData_out.push({name:'PE', value: PE}) : true;
    SE != 0 ? submitData_out.push({name:'SE', value: SE}) : true;
    Judging != 0 ? submitData_out.push({name:'Judging', value: Judging}) : true;

    AC != 0 ? submitData_in.push({name:'Accepted', value: AC}) : true; // 所有AC数目
    WA + PE != 0 ? submitData_in.push({name:'WA', value: WA+PE}) : true;
    var other = Waiting + TLE + MLE + RE + OL + CE + SE + Judging;
    other != 0 ? submitData_in.push({name:'OTHER', value: other}) : true;

    var option = {
        title:{
            text: 'Submissions'
        },
        tooltip:{
            trigger: 'item',
            formatter: "{b} : {c}({d}%)"
        },
        legend:{
            orient: 'vertical',
            x: 'right',
            data: submitData_out,
            textStyle:{
                // fontFamily: 'console',
                fontWeight: 'bold'
            }
        },
        toolbox:{
            show: true,
            z: 6,
            x: 'right',
            y: 'bottom',
            feature: {
                // dataZoom: {},
                dataView: {readOnly: false},
                // magicType:{
                //     type: ['pie','bar']
                // },
                saveAsImage:{}
            }
        },
        series:[
            {
                itemStyle:{
                    normal: {
                        shadowColor: 'rgb(128, 128, 128)',
                        shadowBlur: 10,
                        shadowOffsetX: 2,
                        shadowOffsetY: 2
                    }
                },
                type: 'pie',
                selectedMode: 'single',
                radius: [0, '30%'],
                label:{
                    normal:{
                        position: 'inner' //显示文字在图内
                    }
                },
                labelLine:{
                    normal:{
                        show: false
                    }
                },
                name: 'Rough Data',
                data: submitData_in
            },
            {
                itemStyle:{
                    normal: {
                        shadowColor: 'rgb(128, 128, 128)',
                        shadowBlur: 10,
                        shadowOffsetX: 2,
                        shadowOffsetY: 2
                    }
                },
                labelLine:{
                    normal:{
                        // smooth: true,
                        lineStyle:{
                            width: 2
                        }
                    }
                },
                label:{
                    normal:{
                        formatter: "{b}({d}%)",
                        textStyle:{
                            // fontFamily: 'console',
                            fontWeight: 'bold'
                        }
                    }
                },
                name: 'Retailed Data',
                type: 'pie',
                radius: ['40%', '55%'],
                data: submitData_out,
                formatter: "{b}({d}%)"
            }
        ]
    };
    submitChart.setOption(option);
});
