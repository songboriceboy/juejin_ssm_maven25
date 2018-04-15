<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/3/29
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.js"></script>
</head>
<body>
<%@include file="common/header.jsp"%>
我是编辑页面

<form action="${pageContext.request.contextPath}/currentuser/upload_avatar" method="post" enctype="multipart/form-data">
    <input type="file" name="avatar">
    <input type="submit" >
</form>
</body>
</html>
