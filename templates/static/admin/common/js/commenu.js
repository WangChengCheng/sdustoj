


    power = getCookie("power");


    document.writeln(" <div class=\"sidebar\">");
document.writeln("        <!--快捷按钮组-->");
document.writeln("        <!--<div class=\"sidebarshorcuts\">");
document.writeln("            <button class=\"btn btn-success\"><i class=\"fa fa-signal\"></i></button>");
document.writeln("            <button class=\"btn btn-info\"><i class=\"fa fa-pencil\"></i></button>");
document.writeln("            <button class=\"btn btn-warning\"><i class=\"fa fa-group\"></i></button>");
document.writeln("            <button class=\"btn btn-danger\"><i class=\"fa fa-cogs\"></i></button>");
document.writeln("        </div>-->");
document.writeln("        <!--列表导航-->");
document.writeln("        <ul class=\"navlist\" id=\"navlistId\">");
document.writeln("            <li class=\"menuli\"><a href=\"javascript:void(0);\"><i class=\"fa fa-dashboard fatest\"></i>Home</a></li>");
document.writeln("            <li class=\"menuli\">");
document.writeln("                <a href=\"\"  target=\"_Blank\"><i class=\"fa fa-desktop fatest\"></i>See SDUSTOJ</a>");
document.writeln("            </li>");
    if(power=='A') {
        document.writeln("            <li class=\"menuli\"><a href=\"javascript:void(0); name=1\"><i class=\"fa fa-file-code-o fatest\"></i>Problem<i class=\"fa fa-angle-down\"></i></a>");
        document.writeln("                <ul class=\"submenu\">");
        document.writeln("                    <li class=\"menuli\"><a href=\"addproblem\">AddProblem</a></li>   <!--添加题目-->");
        document.writeln("                    <li class=\"menuli\"><a href=\"addproblemfile\">AddProblemFile</a></li>   <!--添加题目-->");
        document.writeln("                    <li class=\"menuli\"><a href=\"problemlist\">ProblemList</a></li>  <!--OJ题目列表-->");
        document.writeln("                    <li class=\"menuli\"><a href=\"javascript:;\">FreeProblemSet</a></li> <!--设置公开题目-->");
        document.writeln("                </ul>");
        document.writeln("            </li>");
    }
document.writeln("            <li class=\"menuli\"><a href=\"javascript:void(0); name=3\"><i class=\"fa fa-graduation-cap fatest\"></i>Contest<i class=\"fa fa-angle-down\"></i></a>");
document.writeln("                <ul class=\"submenu\">");
document.writeln("                    <li class=\"menuli\"><a href=\"addcontest\">AddContest</a></li>       <!--添加比赛-->");
document.writeln("                    <li class=\"menuli\"><a href=\"contestlist\">ContestList</a></li>      <!--比赛列表-->");
document.writeln("                </ul>");
document.writeln("            </li>");
    if(power=='A') {
        document.writeln("            <li class=\"menuli\"><a href=\"javascript:void(0); name=2\"><i class=\"fa fa-newspaper-o fatest\"></i>News<i class=\"fa fa-angle-down\"></i></a>");
        document.writeln("                <ul class=\"submenu\">");
        document.writeln("                    <li class=\"menuli\"><a href=\"addnews\" >AddNews</a></li>            <!--添加OJ帖子-->");
        document.writeln("                    <li class=\"menuli\"><a href=\"newslist\" >NewsList</a></li>            <!--查看OJ帖子列表-->");
        document.writeln("                </ul>");
        document.writeln("            </li>");
        document.writeln("            <li class=\"menuli\"><a href=\"javascript:void(0);\"><i class=\"fa fa-user-plus fatest\"></i>User<i class=\"fa fa-angle-down\"></i></a>");
        document.writeln("                <ul class=\"submenu\">");
        document.writeln("                    <li class=\"menuli\"><a href=\"adduser\">AddUser</a></li> <!--设置管理员-->");
        document.writeln("                    <li class=\"menuli\"><a href=\"userlist\">UserList</a></li>    <!--管理员列表-->");
        document.writeln("                </ul>");
        document.writeln("            </li>");
        document.writeln("            <li class=\"menuli\"><a href=\"javascript:void(0);\"><i class=\"fa fa-cog fatest\"></i>Other<i class=\"fa fa-angle-down\"></i></a>");
        document.writeln("                <ul class=\"submenu\">");
        document.writeln("                    <li class=\"menuli\"><a href=\"javascript:;\">ExportProblem</a></li>    <!--导出题目-->");
        document.writeln("                    <li class=\"menuli\"><a href=\"javascript:;\">ImportProblem</a></li> <!--导入题目-->");
        document.writeln("                    <li class=\"menuli\"><a href=\"userloginlog\">UserLoginLog</a></li>    <!--导出题目-->");
        document.writeln("                    <li class=\"menuli\"><a href=\"javascript:;\">UpdateDatabase</a></li> <!--更新数据库-->");
        document.writeln("                    <li class=\"menuli\"><a href=\"rejudge\">Rejudge</a></li> <!--将某一场比赛或者某一个题的代码全部rejudge-->");
        document.writeln("                </ul>");
        document.writeln("            </li>");

    }
    document.writeln("            <li class=\"menuli\">");
    document.writeln("                <a href=\"teaching\"  target=\"_Blank\"><i class=\"fa fa-users fatest\"></i>教学关系</a>");
    document.writeln("            </li>");
    document.writeln("        </ul>");
    document.writeln("    </div>");
function getCookie(name)
{
var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
if(arr=document.cookie.match(reg))
return unescape(arr[2]);
else
return null;
}