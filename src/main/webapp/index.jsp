<%--
  Created by IntelliJ IDEA.
  User: maclc
  Date: 2018/11/25
  Time: 下午5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>

    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<%--<h1>你好，世界liucong！</h1>--%>
<div class="container">
    <div class="raw">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="raw">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="raw">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>


            </table>
        </div>
    </div>
    <div class="raw">
        <%--当前总共--%>
        <div class="col-md-6" id="page_info">

        </div>
        <%--分页条--%>
        <div class="col-md-6" id="page_nav">

        </div>
    </div>

</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
    //1,页面加载完成后直接发送ajax请求，要到页面数据
    $(function(){
        to_page(1);
    });

    function to_page(pn){
        $.ajax({
            url:"/emps",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //console.log(result);
                //解析并显示员工数据
                build_emp_table(result);
                //解析并显示分页信息
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }
    function build_emp_table(result){
        $("#emps_table tbody").empty();
        var emps =result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            //alert(item.empName);
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender);
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
        /*<button class="btn btn-primary btn-sm">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            编辑
            </button>
           <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
            */
            var editBtn =$("<button></button>").addClass("btn btn-primary btn-sm")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            var delBtn =$("<button></button>").addClass("btn btn-danger btn-sm")
                .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            var btnTd =$("<td></td>").append(editBtn).append(" ").append(delBtn);

            //append方法执行完后 还会返回 <tr></tr>,所以不用加<tr></tr>就可以继续添加。
            $("<tr></tr>").append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }
    
    function build_page_info(result) {

        $("#page_info").empty()
        $("#page_info").append("当前第"+result.extend.pageInfo.pageNum+"页 , 总共"+result.extend.pageInfo.pages+"页 , 总共"+result.extend.pageInfo.total+"条记录");


    }
    function build_page_nav(result){
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function () {
                to_page(1);
            });

            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));

        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });

            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }





        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums,function (index,item/*[1,2,3,4,5]*/) {

            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"))

            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);


        });

        ul.append(nextPageLi).append(lastPageLi);

        var nav = $("<nav></nacv>").append(ul);

        nav.appendTo("#page_nav");//添加到 分页条div中
    }

</script>
</body>
</html>
