<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/3/16
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.js"></script>
    <script>
        function checkUser() {
            var input = document.getElementById('username');
            var req = new XMLHttpRequest();
            req.open('get','${pageContext.request.contextPath}/checkuser/' + input.value, true);
            req.send();
            req.onload =function () {
                var msg = document.getElementById('msg');
                var btn = document.getElementById('reg');
                if(req.responseText == 1)
                {
                    msg.innerHTML='用户名已存在'
                    btn.setAttribute('disabled','0')

                }
                else
                {
                    msg.innerHTML='可以注册'
                    btn.removeAttribute('disabled')
                }
            }
        }
    </script>
</head>
<body>
<%@include file="common/header.jsp"%>
    <form method="post" action="${pageContext.request.contextPath}/reg">
        <div id="msg">

        </div>
        <div>
            <label for="username">账号：</label>
            <input type="text" id="username" name="username" onblur="checkUser();">
        </div>
        <div>
            <label for="password">密码：</label>
            <input type="password" name="password" id="password">
        </div>
        <div>
            ${error_msg}
        </div>
        <div>
            <input type="submit" value="注册" id="reg">
        </div>
    </form>
</body>
</html>
