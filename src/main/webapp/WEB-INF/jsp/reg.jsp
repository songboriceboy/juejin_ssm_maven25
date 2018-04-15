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
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css?v=0.1" rel="stylesheet">
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
<div class="b100"></div>
<div>
    <div class="b20"></div>
    <div class="uk-container uk-container-center">
        <div class="uk-panel uk-panel-box">
            <div class="uk-grid uk-grid-divider" data-uk-grid-margin="">
                <div class="uk-width-medium-1-2">
                    <div class="uk-grid">
                        <div class="uk-width-1-5"></div>
                        <div class="uk-width-3-5">
                            <div class="uk-panel">
                                <div class="b35"></div>
                                <h1>
                                    <a href="#"><i class="uk-icon-user"></i> 用户注册</a>
                                </h1>

                                <form class="uk-form jqtransformdone" action="${pageContext.request.contextPath}/reg" method="post">
                                    <span id="msg" class="uk-text-danger">

                                    </span>
                                    <div class="uk-form-row uk-margin-top">
                                        <div class="uk-form-icon">
                                            <i class="uk-icon-user" id="dusername"></i>
                                            <input class="uk-form-width-large uk-form-large"
                                                   name="username" id="username" type="text"
                                                   onblur="checkUser();"
                                                   autocomplete="off" placeholder="请输入账号">
                                        </div>
                                    </div>

                                    <div class="uk-form-row">
                                        <div class="uk-form-icon uk-form-password">
                                            <i class="uk-icon-lock" id="dpassword"></i>
                                            <input class="uk-form-width-large uk-form-large"
                                                   name="password" id="password"
                                                   type="password"
                                                   autocomplete="off" value="" placeholder="请输入密码">
                                        </div>
                                    </div>
                                    <span class="uk-text-danger">
                                        ${error_msg}
                                    </span>
                                    <div class="uk-form-row">
                                        <button type="submit" name="submit"
                                                class="uk-button uk-button-primary uk-margin-top uk-button-large uk-width-1-1"
                                                id="reg">立 即 注 册
                                        </button>
                                    </div>
                                    <div class="b35"></div>
                                </form>
                            </div>
                        </div>
                        <div class="uk-width-1-5"></div>
                    </div>
                </div>
                <div class="uk-width-medium-1-2">
                    <div class="uk-grid">
                        <div class="uk-width-1-6"></div>
                        <div class="uk-width-4-6">
                            <div class="uk-panel">
                                <div class="b35"></div>
                                <h1 class="uk-text-center">
                                    <a href="javascript:;"
                                       class="b">我已注册账号</a>
                                </h1>
                                <a href="${pageContext.request.contextPath}/login" class="uk-button uk-button-large uk-button-success uk-width-1-1"
                                >立 即 登 录
                                </a>
                            </div>
                        </div>
                        <div class="uk-width-1-6"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
