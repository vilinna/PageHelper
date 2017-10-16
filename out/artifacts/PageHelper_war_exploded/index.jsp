<%--
  Created by IntelliJ IDEA.
  User: nana
  Date: 2017/9/5
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>欢迎登陆</title>
    <meta name="viewport" content="width=device-width,intial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script type="text/javascript">
        var ctx = "<%=request.getContextPath()%>";
    </script>
    <link rel="stylesheet" href='<c:url value="css/bootstrap.css"></c:url>' type="text/css">
    <link rel="stylesheet" href='<c:url value="css/bootstrap.min.css"></c:url>' type="text/css">
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"></c:url>' type="text/css">
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.css"></c:url>' type="text/css">

    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>--%>
    <script src='<c:url value="/js/bootstrap.min.js"></c:url>' type="text/javascript"></script>
    <script src='<c:url value="/js/bootstrap.js"></c:url>' type="text/javascript"></script>
  </head>

  <body style="width: 600px;height: 500px">
  <form  class=" form-horizontal" method="post" action="login">
    <label for="username" class="col-sm-2 control-label">用户名：</label>
    <div class="col-sm-10">
      <input id="username"  name="username" class="form-control">
    </div>
    <label for="password" class="col-sm-2 control-label">密码：</label>
    <div class="col-sm-10">
      <input id="password" name="password" type="password" class="form-control">
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">登录</button>
      </div>
    </div>
  </form>
  </body>
</html>
