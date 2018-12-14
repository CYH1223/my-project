<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>后台管理系统</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <%--模态框插件--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--表单插件--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%--<script>
        //编辑用户 先获取当前ID用户信息
        function edit(id) {
            $.ajax({
                url:"selectUserByUser",
                type:"get",
                dataType:"json",
                data:{id:id},
                success:function (data) {
                    $("#editModal").modal("show");
                    $("#name2").val(data.uname);
                    $("#email2").val(data.email);
                    $("#uage2").val(data.uage);
                    $("#gender").val(data.gender);
                    $("#id").val(data.id);
                },
                error:function () {
                    alert("获取用户数据失败！");
                }
            });
        }
    </script>--%>

</head>

<body>
<div class="container">
    <div class="page-header" style="text-align: center;">
        <h1>后台管理系统 </h1>
    </div>
    <%--导航栏--%>
    <ul id="myTab" class="nav nav-tabs nav-pills" style="font-size: 20px ">
        <li class="dropdown">
            <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">用户管理
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                <li class="active">
                    <a href="#user" tabindex="-1" data-toggle="tab">用户</a>
                </li>
                <li>
                    <a href="#manager" tabindex="-1" data-toggle="tab">管理员</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#goods" data-toggle="tab">商品管理</a>
        </li>
        <li class="disabled">
            <a href="javascript:return false;" data-toggle="tab">财务管理</a>
        </li>
    </ul>

    <%--显示的表格--%>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="user">
            <table class="table table-hover">
                <%--<caption>悬停表格布局</caption>--%>
                <thead>
                <tr>
                    <td colspan="6" align="right">
                        <form action="searchUser" method="get" class="navbar-form navbar-left" role="search">
                            <%--<span>姓名：</span>--%>
                            <button onclick="returnIndex()" type="button" class="btn btn-default">返回</button>
                            <input name="uname" type="text" class="form-control" placeholder="请输入要搜索的姓名">
                            <button type="submit" class="btn btn-default">查询</button>
                        </form>
                        <%--<a style="text-decoration: none" href="#">添加用户</a>--%>
                        <button style="font-size: 20px " class="btn btn-primary" data-toggle="modal"
                                data-target="#myModal">
                            添加用户
                        </button>
                    </td>
                </tr>
                <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.uname}</td>
                        <td>${u.uage}</td>
                        <td>${u.gender}</td>
                        <td>${u.email}</td>
                        <td>
                            <a style="text-decoration: none" href="toUpdateUser?id=${u.id}">编辑</a>
                            <a style="text-decoration: none" href="deleteUser?id=${u.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:forEach items="${userList}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.uname}</td>
                        <td>${u.uage}</td>
                        <td>${u.gender}</td>
                        <td>${u.email}</td>
                        <td>
                                <%--<button class="btn btn-success" data-toggle="modal" data-target="#editModal">
                                    编辑
                                </button>
                                <button class="btn btn-success" onclick="edit('${u.id }')">编辑</button>--%>
                            <a style="text-decoration: none" href="toUpdateUser?id=${u.id}">编辑</a>
                            <a style="text-decoration: none" href="deleteUser?id=${u.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr align="center">
                    <td colspan="6">
                        <ul class="pagination">
                            <%--上一页--%>
                            <c:if test="${userVO.currentPage==1}">
                                <li><a class="disabled">上一页</a></li>
                            </c:if>
                            <c:if test="${userVO.currentPage!=1}">
                                <li><a href="listUsers?currentPage=${userVO.currentPage-1}">上一页</a></li>
                            </c:if>
                            <%--显示页数--%>
                            <c:forEach begin="1" end="${userVO.totalPage}" var="u">
                                <c:if test="${u==userVO.currentPage }">
                                    <li><a class="disabled">${u}</a></li>
                                </c:if>
                                <c:if test="${u!=userVO.currentPage }">
                                    <li><a href="listUsers?currentPage=${u}">${u}</a></li>
                                </c:if>
                            </c:forEach>
                            <%--下一页--%>
                            <c:if test="${userVO.currentPage==userVO.totalPage}">
                                <li><a class="disabled">下一页</a></li>
                            </c:if>
                            <c:if test="${userVO.currentPage!=userVO.totalPage}">
                                <li><a href="listUsers?currentPage=${userVO.currentPage+1}">下一页</a></li>
                            </c:if>

                        </ul>
                    </td>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="tab-pane fade" id="manager">
            <p>
            <h1>暂无信息</h1></p>
        </div>
        <div class="tab-pane fade" id="goods">
            <p>
            <h1>暂无信息</h1></p>
        </div>
        <div class="tab-pane fade " id="financial">
            <p>
            <h1>暂无信息</h1></p>
        </div>
    </div>

    <!-- 添加模态框（Modal） -->
    <form role="form" action="addUser" method="post">
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">×
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            请填写以下内容
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <label for="name" class="col-sm-2 control-label">姓名</label>
                            <input name="uname" type="text" class="form-control" id="name"
                                   placeholder="请输入姓名">
                        </div>
                        <div>
                            <label for="email" class="col-sm-2 control-label">邮箱</label>
                            <input name="email" type="text" class="form-control" id="email"
                                   placeholder="请输入邮箱">
                        </div>
                        <div>
                            <label class="col-sm-2 control-label">年龄</label>
                            <select name="uage" class="form-control">
                                <c:forEach begin="1" end="100" varStatus="a">
                                    <option>${a.count}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label class="col-sm-2 control-label">性别</label>
                            <input type="radio" name="gender" value="男" checked>男&nbsp
                            <input type="radio" name="gender" value="女">女
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">返回
                        </button>
                        <button type="submit" class="btn btn-primary">添加</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </form>
    <!-- 编辑用户模态框（Modal） -->
    <%--<form role="form" action="updateUser" method="post">
        <input type="hidden" value="${user.id}" name="id"/>
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">×
                        </button>
                        <h4 class="modal-title" id="editModalLabel">
                            请修改以下内容
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <label for="name2" class="col-sm-2 control-label">姓名</label>
                            <input name="uname" type="text" class="form-control" id="name2"
                                   >
                        </div>
                        <div>
                            <label for="email2" class="col-sm-2 control-label">邮箱</label>
                            <input name="email" type="text" class="form-control" id="email2"
                                   >
                        </div>
                        <div>
                            <label class="col-sm-2 control-label">年龄</label>
                            <select name="uage" id="uage2" class="form-control">
                                <c:forEach begin="1" end="100" varStatus="a">
                                    <option>${a.count}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label class="col-sm-2 control-label">性别</label>
                            <input type="radio" name="gender" value="男">男&nbsp
                            <input type="radio" name="gender" value="女">女
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">返回
                        </button>
                        <button type="submit" class="btn btn-primary">添加</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </form>--%>
    <%--<form action="#" method="post" id="editModalForm">
        <input type="hidden" value="${user.id}" name="id"/>
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 id="mytitle1" class="modal-title" id="myModalLabel1">
                            编辑用户
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <i class="fa fa-user fa-lg"></i>
                            <input class="form-control required" type="text" id="name2" placeholder="Name" name="name" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-user fa-lg"></i>
                            <input class="form-control required" type="text" placeholder="Age" id="age2" name="age" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-user fa-lg"></i>
                            <input class="form-control required" type="text" placeholder="LoginName" id="loginName2" name="loginName" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" placeholder="Password" id="password2" name="password"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-check fa-lg"></i>
                            <input class="form-control required" placeholder="Re-type Your Password" id="rpassword2" >
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-info">
                            确认
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </form>--%>


</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<script>
    function returnIndex() {
        location.href = "listUsers";
    }

</script>
<!--<script>
    $(function() {
        $('#myTab li:eq(1) a').tab('show');
    });
</script>-->


</body>
</html>
