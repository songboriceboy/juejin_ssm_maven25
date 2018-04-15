<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/3/19
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="common/header.jsp"%>

<form action="${pageContext.request.contextPath}/add_article" method="post">
    <div>
        <label for="title">标题</label>
        <input type="text" name="title" id="title" placeholder="请输入标题">
    </div>
    <div>
        <label for="content">正文</label>
        <textarea id="content" name="content" rows="20" cols="40"></textarea>
    </div>
    <input type="submit" value="发布">
</form>
</body>
</html>
