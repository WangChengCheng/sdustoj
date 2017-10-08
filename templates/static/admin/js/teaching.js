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
function clickOption() {
    $.ajax({
        url:'teaching',
        data:{
            academic_year_selected : $("select[name='academic_year_selected'] option:selected").val(),
            semester_selected : $("select[name='semester_selected'] option:selected").val(),
            course_selected : $("select[name='course_selected'] option:selected").val(),
            grade_selected : $("select[name='grade_selected'] option:selected").val(),
            major_selected : $("select[name='major_selected'] option:selected").val(),
            class_selected : $("select[name='class_selected'] option:selected").val(),
            changeOption : true //如果是通过改变select中option值来刷新表格，只需要后台传递表格数据即可
        },
        type: 'GET',
        dataType: 'json',
        success:function (data) {
            var tableElem = $("#tbody");
            var grade_selected = $("select[name='grade_selected'] option:selected").text();
            var major_selected = $("select[name='major_selected'] option:selected").text();
            var class_selected = $("select[name='class_selected'] option:selected").text();
            tableElem.html("");
            data.forEach(function (val, index, arr) {
                tableElem.append("<tr>");
                tableElem.append("<td>"+arr[index].pk+"</td>");
                tableElem.append("<td>"+arr[index].fields['student_name']+"</td>");
                tableElem.append("<td>"+grade_selected+"</td>");
                tableElem.append("<td>"+major_selected+"</td>");
                tableElem.append("<td>"+class_selected+"</td>");
                // tableElem.append("<td><div class='ownbtngroup'><a href='javascript:void(0);' id='delete'>删除</a></div> </td>");
                tableElem.append("</tr>");
            })
        },
        error:function (XMLHttpRequest) {
            $("#tbody").html("");
            alert("请求出错,状态码："+XMLHttpRequest.readyState);
        }


    });
}