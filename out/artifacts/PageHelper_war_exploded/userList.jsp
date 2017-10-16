<%--
  Created by IntelliJ IDEA.
  User: nana
  Date: 2017/9/7
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <c:if test="${userList.size() ne 0}">
        <table>
            <tr>
                <th>姓名</th>
                <th>状态</th>
            </tr>
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

<div id="pageTool">
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
</body>
</html>
