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
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.js"></script>
    <style>
        .b100{
            height: 100px;
        }
    </style>
</head>
<body>
<%@include file="common/header.jsp"%>
<div class="b100"></div>
<div class="mb-cover">
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
                                    <a href="http://www.mooban.cn/member/login.php" class="b"><i
                                            class="uk-icon-user mb-a"></i> 用户登录</a>
                                </h1>
                                <form class="uk-form" method="post" action="${pageContext.request.contextPath}/do_login">

                                    <div class="uk-form-row">
                                        <div class="uk-form-icon">
                                            <i class="uk-icon-user"></i>
                                            <input title=""
                                                   class="uk-form-width-large uk-form-large" name="username"
                                                   type="text" id="username" value="" placeholder="请输入账号/邮箱"
                                                   >
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <div class="uk-form-icon uk-form-password">
                                            <i class="uk-icon-lock"></i>
                                            <input
                                                   maxlength="20" class="uk-form-width-large uk-form-large"
                                                   name="password" id="password" type="password" value=""
                                                   placeholder="请输入登录密码">
                                        </div>
                                    </div>
                                    <div>
                                        <input type="hidden" name="goto_url" value="${preurl}">
                                    </div>
                                    <div>
                                        ${error_msg}
                                    </div>

                                    <div class="uk-form-row uk-margin-top">
                                        <button type="submit" name="submit"
                                                class="uk-button uk-button-primary border_radius3 uk-button-large uk-width-1-1"
                                                id="loginBtn">立 即 登 录
                                        </button>
                                    </div>

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
                            <div class="b35"></div>
                            <h1 class="uk-text-center uk-margin-large-top">
                                <a href="javascript:;"
                                   class="b">没有账号？立即注册</a>
                            </h1>
                            <a href="${pageContext.request.contextPath}/register" class="uk-button uk-button-large uk-button-success uk-width-1-1">立 即 注 册
                            </a>

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
