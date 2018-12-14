<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>修改用户</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <form action="updateUser" class="form-horizontal" role="form" method="post">
        <input type="hidden" value="${user.id}" name="id"/>
        <div class="page-header" style="text-align: center;">
            <h1>修改用户 </h1>
        </div>
        <div class="form-group">
            <label for="name2" class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-10">
                <input value="${user.uname}" name="uname" type="text" class="form-control" id="name2">
            </div>
        </div>
        <div class="form-group">
            <label for="email2" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-10">
                <input name="email" value="${user.email}" type="text" class="form-control" id="email2">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">年龄</label>
            <div class="col-sm-10">
                <input name="uage" value="${user.uage}" type="text" class="form-control" id="uage">
                <%--<select name="uage" class="form-control">
                    <c:forEach begin="1" end="100" varStatus="a">
                        <option>${a.count}</option>
                    </c:forEach>
                </select>--%>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <%--<input type="radio" name="gender" value="${user.gender}">男&nbsp
                <input type="radio" name="gender" value="${user.gender}">女--%>
                <input name="gender" class="form-control" type="text" value="${user.gender}"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button onclick="returnIndex()" type="button" class="btn btn-default">返回</button>
                <button type="submit" class="btn btn-primary">修改</button>
            </div>
        </div><!-- /.modal -->
    </form>
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
</body>
</html>
