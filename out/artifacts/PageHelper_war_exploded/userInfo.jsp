<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width,intial-scale=1.0">                `
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
    <style type="text/css">
        body {
            margin: 50px;
        }
    </style>
</head>
<body>
<div id="listDiv">
    <div class="row">
        姓名：<input id="cxname">
        <button id="cxBtn" onclick="cx()">查询</button>
    </div>
   <%-- <jsp:include page="userList.jsp"></jsp:include>--%>
    <div class="row">

        <c:if test="${userList.size() ne 0}">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>姓名</th>
                        <th>状态</th>
                    </tr>
                </thead>
                <c:forEach var="user" items="${userList}" varStatus="status">
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <c:if test="${user.status eq 'active'}">激活</c:if>
                            <c:if test="${user.status ne 'active'}">未激活</c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </c:if>
    </div>

    <div class="row">
        <div class="col-md-6">
       <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="getUserPage?pageNum=1">首页</a></li>
                <c:if test="${page.hasPreviousPage }">
                    <li><a href="getUserPage?pageNum=${page.pageNum-1}"
                           aria-label="Previous"> <span >前一页</span>
                    </a></li>
                </c:if>

                <c:forEach items="${page.navigatepageNums }" var="pageNum">
                    <c:if test="${pageNum == page.pageNum }">
                        <li class="active"><a href="#">${pageNum }</a></li>
                    </c:if>
                    <c:if test="${pageNum != page.pageNum }">
                        <li><a href="getUserPage?pageNum=${pageNum }">${pageNum }</a></li>
                    </c:if>

                </c:forEach>
                <c:if test="${page.hasNextPage }">
                    <li><a href="getUserPage?pageNum=${page.pageNum+1 }"
                           aria-label="Next"> <span >下一页</span>
                    </a></li>
                </c:if>
                <li><a href="getUserPage?pageNum=${page.pages}">末页</a></li>
            </ul>
        </nav>
        </div>
    </div>
</div>
<script type="text/javascript">
    function cx() {
        var name = $("#cxname").val();
        var url = ctx + "/getUserPage?pageNum=1&username=" + name;
        $("#listDiv").load(url);
    }
</script>

</body>
</html>
