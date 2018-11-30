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
<!-- Modal 员工新增模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">

                <%--表单--%>
                <form class="form-horizontal" id="emp_add_form" >
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName：</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email：</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender：</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName：</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>

                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<%--<h1>你好，世界liucong！</h1>--%>
<div class="container">
    <div class="raw">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="raw">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
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
<%--员工修改模态框--%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工添加</h4>
            </div>
            <div class="modal-body">

                <%--表单--%>
                <form class="form-horizontal" id="emp_add_form" >
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName：</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_updata_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email：</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender：</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName：</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">

                            </select>
                        </div>
                    </div>

                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
    var totalRecord,currentPage;
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
            var editBtn =$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            //为编辑按钮添加一个自定义属性，来表示当前员工id。
            editBtn.attr("edit-id",item.empId);
            var delBtn =$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            var btnTd =$("<td></td>").append(editBtn).append(" ").append(delBtn);



            //append方法执行完后 还会返回 <tr></tr>,所以不用加<tr></tr>就可以继续添加。
            $("<tr></tr>").append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }
    
    function build_page_info(result) {

        $("#page_info").empty();
        $("#page_info").append("当前第"+result.extend.pageInfo.pageNum+"页 , 总共"+result.extend.pageInfo.pages+"页 , 总共"+result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;

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

    //清空表单样式及内容
    function reset_form(form){
        //清空表单内容
        $(form)[0].reset();
        //清空表单样式
        $(form).find("*").removeClass("has-error has-success");
        $(form).find(".help-block").text("");
    }

    $("#emp_add_modal_btn").click(function () {
        reset_form("#empAddModal form");
        //发送ajax请求，查出部门信息
        getDepts("#empAddModal select");

        //弹出模态框
      $("#empAddModal").modal({
            backdrop:"static"
        });
    });

    $("#emp_save_btn").click(function () {

        if(!validate_add_form()){
            return false;
        }

        //用户名校验

        if($("#emp_save_btn").attr("ajax-va") == "error"){
            return false;
        }

        $.ajax({
            url:"/emp",
            type:"POST",
            data:$("#emp_add_form").serialize(),
            success:function (result) {

                if (result.code == 100) {
                   // alert("success");
                //1关闭模态框，
                $("#empAddModal").modal('hide');
                //2来到最后一页, 发送ajax请求 显示最后一页
                to_page(totalRecord);
                }else{
                    //显示错误信息
                    //alert("failed");
                    console.log(result);
                }

            }
            
        });

       // alert($("#emp_add_form").serialize());
    });

    //检验用户名是否可用
    $("#empName_add_input").change(function () {
        //发送ajax请求检测用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"/checkuser",
            data:"empName="+empName,
            type:"POST",
            success:function(result){

                if(result.code==100){

                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{

                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        });
    });
    
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url:"/depts",
            type:"GET",
            success:function (result) {
                //console.log(result);
                //显示部门信息在下拉框中
                $.each(result.extend.depts,function () {
                    var optionEle =$("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo($(ele));
                });

            }
        });
    }

    function saveEmp() {
       
        //alert($("#emp_add_form").serialize());
        /*$.ajax(function () {
            
        });*/
    }
    
    function validate_add_form() {
        //1 拿到校验的数据，用正则表达式校验
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_]{5,20}$)|(^[\u4e00-\u9fa5]{2,8}$)/;
       // alert(regName.test(empName))
        if(!regName.test(empName)){
            //alert("姓名必须是2-8位中文或者5-20位英文数字组合");
            show_validate_msg("#empName_add_input","error","姓名必须是2-8位中文或者5-20位英文数字组合");

            return false;
        }else{
            show_validate_msg("#empName_add_input","success","");
        }
        var email = $("#email_add_input").val();
        var regEmail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if(!regEmail.test(email)) {
            //alert("邮箱格式不对");
            show_validate_msg("#email_add_input","error","邮箱格式不对");
            return false;
        }else {
            show_validate_msg("#email_add_input","success","");
        }
        return true;

    }
    function show_validate_msg(ele,status,msg) {
        //清除校验元素的当前状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text("");
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

     //1 我们是按钮创建之前就绑定了click，$(".edit_btn")所以绑定不上。
    //2 1我们可以在创建按钮的时候绑定
    //2 2绑定点击 live（）
    //jquery 把live（）删除了，使用on() 替代
    $(document).on("click",".edit_btn",function () {
       // alert("hello");



        //1,查处部门信息，显示部门列表
        getDepts("#empUpdateModal select");
        //2，查处员工信息，显示员工信息
        getEmp($(this).attr("edit-id"));
        //3把员工id传递给更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        //弹出模态框
        $("#empUpdateModal").modal({
            backdrop:"static"
        });

    });
    function getEmp(id) {
        $.ajax({
            url:"/emp/"+id,
            type:"GET",
            success:function (result) {
                //console.log(result);
                //显示员工数据
                var empData = result.extend.emp;
                $("#empName_updata_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });
    }

    //点击更新，更新信息
    $("#emp_update_btn").click(function () {
        var email = $("#email_update_input").val();
        var regEmail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if(!regEmail.test(email)) {
            //alert("邮箱格式不对");
            show_validate_msg("#email_add_input","error","邮箱格式不对");
            return false;
        }else {
            show_validate_msg("#email_add_input","success","");
        }
        //发送ajax请求，保存
        $.ajax({
            url:"/emp/"+$(this).attr("edit-id"),
            type:"POST",
            data:$("#empUpdateModal form").serialize()+"&_method=PUT",
            success:function (result) {
                //alert(result.msg);
                $("#empUpdateModal").modal("hide");
                to_page(currentPage);
            }

        });
    });

    //删除
    $(document).on("click",".delete_btn",function () {
        // 弹出 是否确认删除对话框。

        var empName = $(this).parents("tr").find("td:eq(1)").text();
        var empId = $(this).parents("tr").find("td:eq(0)").text();
       
        if(confirm("确认删除 "+empName+" 吗？")) {
            //发送ajax请求 删除
            $.ajax({
                url:"/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                  //alert(result.msg);
                   to_page(currentPage);
                }
            });
        }else{

        }
    });

</script>
</body>
</html>
