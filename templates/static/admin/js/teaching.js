$(function () {
    // 全局变量
    $.ajaxSetup({
        beforeSend: function (xhr, settings) {
            var csrftoken = $.cookie('csrftoken');
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
        }
    });
    $(document).ready(function(){
        $.ajax({
            url:'teaching',
            data:{
                academic_year_selected : $("select[name='academic_year_selected'] option:selected").val(),
                semester_selected : $("select[name='semester_selected'] option:selected").val(),
                course_selected : $("select[name='course_selected'] option:selected").val(),
                grade_selected : $("select[name='grade_selected'] option:selected").val(),
                major_selected : $("select[name='major_selected'] option:selected").val(),
                class_selected : $("select[name='class_selected'] option:selected").val()
            },
            type: 'GET',
            // dataType: 'json',
            // success:function (data) {
            //     alert("success"+data.student_list);
            //     $("#tbody").html("");
            // },
            // error:function (XMLHttpRequest, data) {
            //     // $("#tbody").html("");
            //     alert(data);
            // }
        });
    });

});
function clickOption(obj) {
    var oper = '';
    var pagenum = '';
    if(obj.id === 'nextpage') {
        oper = 'add';
        pagenum = $("#nowprenum").text();
    }
    else if(obj.id === 'prepage'){
        oper = 'sub';
        pagenum = $("#nowprenum").text();
    }
    else if(obj.id === 'firstpage'){
        pagenum = 1;
    }
    else if(obj.id === 'lastpage'){
        pagenum = $("#nownextnum").text();
    }
    $.ajax({
        url:'teaching',
        data:{
            academic_year_selected : $("select[name='academic_year_selected'] option:selected").val(),
            semester_selected : $("select[name='semester_selected'] option:selected").val(),
            course_selected : $("select[name='course_selected'] option:selected").val(),
            grade_selected : $("select[name='grade_selected'] option:selected").val(),
            major_selected : $("select[name='major_selected'] option:selected").val(),
            class_selected : $("select[name='class_selected'] option:selected").val(),
            changeOption : true, //如果是通过改变select中option值来刷新表格，只需要后台传递表格数据即可
            op : oper,
            page_num : pagenum
        },
        type: 'GET',
        dataType: 'json',
        success:function (data) {
            $("select[name='academic_year_selected']").val(data.academic_year_selected);
            $("select[name='semester_selected']").val(data.semester_selected);
            $("select[name='course_selected']").val(data.course_selected);
            $("select[name='grade_selected']").val(data.grade_selected);
            $("select[name='major_selected']").val(data.major_selected);
            $("select[name='class_selected']").val(data.class_selected);

            var tableElem = $("#tbody");
            var grade_selected = $("select[name='grade_selected'] option:selected").text();
            var major_selected = $("select[name='major_selected'] option:selected").text();
            var class_selected = $("select[name='class_selected'] option:selected").text();
            tableElem.html("");
            if($.isEmptyObject(data.student_list)){
                tableElem.append("<tr><td colspan=\"5\" style=\"text-align: center; font-size: larger\">无记录</td></tr>");
            }
            else{
                //alert(data.cur_page+" "+ data.totalpage +" " + data.total);
                for(var i = 0; i < data.student_list_size; i++) {
                    // tableElem.append("<tr>");
                    // tableElem.append("<td>"+data.student_list[i].student_num+"</td>");
                    // tableElem.append("<td>"+data.student_list[i].student_name+"</td>");
                    // tableElem.append("<td>"+grade_selected+"</td>");
                    // tableElem.append("<td>"+major_selected+"</td>");
                    // tableElem.append("<td>"+class_selected+"</td>");
                    // // tableElem.append("<td><div class='ownbtngroup'><a href='javascript:void(0);' id='delete'>删除</a></div> </td>");
                    // tableElem.append("</tr>");
                    var row = document.createElement('tr');
                    var numCell = document.createElement('td');
                    var nameCell = document.createElement('td');
                    var gradeCell = document.createElement('td');
                    var majorCell = document.createElement('td');
                    var classCell = document.createElement('td');
                    numCell.innerHTML = data.student_list[i].student_num;
                    row.appendChild(numCell);
                    nameCell.innerHTML = data.student_list[i].student_name;
                    row.appendChild(nameCell);
                    gradeCell.innerHTML = grade_selected;
                    row.appendChild(gradeCell);
                    majorCell.innerHTML = major_selected;
                    row.appendChild(majorCell);
                    classCell.innerHTML = class_selected;
                    row.appendChild(classCell);
                    tableElem.append(row);
                    // alert(row);
                }

            }

            $("#nowprenum").html(data.cur_page);
            $("#nownextnum").html(data.totalpage);
            $("#allnum").html(data.total);
        },
        error:function (XMLHttpRequest) {
            $("#tbody").html("");
            alert("请求出错,状态码："+XMLHttpRequest.readyState);
        }


    });
}

$(document).ready(function()
{
     $("#student_file").each(function () {
         $(this).qtip({
            content: {
                text:"请上传.csv文件，每行信息格式为:<br>学号,姓名,邮箱,class_id",
                title:{
                    text: '提示',
                    button:' '
                }
            },
            position: {
//                viewport: $(window)
                my: 'left center',
                at: 'right center'
//                target: $('.sim')
            },
            hide:{
//                event: true,
//                target: $('.sim'),
//                delay: 1000
                fixed: true,
                delay: 300
            },
            style: {
                classes: 'qtip-bootstrap qtip-shadow'

            }//'qtip-wiki'
        });
    });

});