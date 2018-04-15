<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/3/16
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<%@include file="common/header.jsp"%>
    <form method="post" action="${pageContext.request.contextPath}/do_login">
        <div>
            <label for="username">账号：</label>
            <input type="text" name="username" id="username">
        </div>
        <div>
            <label for="password">密码：</label>
            <input type="password" name="password" id="password">
        </div>
        <div>
            <input type="hidden" name="goto_url" value="${preurl}">
        </div>
        <div>
            ${error_msg}
        </div>
        <div>
            <input type="submit" value="登录">
        </div>
    </form>
</body>
</html>
