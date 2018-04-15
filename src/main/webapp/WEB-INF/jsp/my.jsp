<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/3/29
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="common/header.jsp"%>
${userinfo.username}的个人主页
<img src="${pageContext.request.contextPath}/upload/${userinfo.avatar}">
<a href="${pageContext.request.contextPath}/currentuser/edit">编辑个人信息</a>
</body>
</html>
