<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/4/9
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--网站头部导航--%>
<header class="app-header">
    <div class="uk-container uk-container-center">
        <nav class="uk-navbar app-navbar">
            <a href="#" class="uk-navbar-brand">
                <img src="https://gold-cdn.xitu.io/v3/static/img/logo.a7995ad.svg" width="60" height="60">
            </a>
            <ul class="uk-navbar-nav">
                <li>
                    <a href="#">
                        首页
                    </a>
                </li>
                <li>
                    <a href="#">
                        开源库
                    </a>
                </li>
                <li>
                    <a href="#">
                        标签
                    </a>
                </li>
            </ul>

            <div class="uk-navbar-content uk-navbar-flip uk-button-dropdown" data-uk-dropdown="{mode:'click'}">


                <c:choose>
                    <c:when test="${userinfo == null}">
                        <div class="uk-button-group">
                            <a href="${pageContext.request.contextPath}/register" class="uk-button uk-button-primary uk-margin-right">免费注册</a>
                            <a href="${pageContext.request.contextPath}/login" class="uk-button uk-button-primary uk-margin-right">立即登录</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/currentuser/me" >
                            <img class="uk-border-circle" src="${pageContext.request.contextPath}/upload/${userinfo.avatar}" width="32" height="32">
                        </a>

                        <div class="uk-dropdown uk-dropdown-bottom">
                            <ul class="uk-nav uk-nav-dropdown">
                                <li><a href="${pageContext.request.contextPath}/currentuser/go_article_page"><i class="uk-icon-pencil uk-icon-justify "></i>写文章</a></li>
                                <li class="uk-nav-divider"></li>
                                <li><a href="${pageContext.request.contextPath}/currentuser/me"><i class="uk-icon-home uk-icon-justify "></i>我的主页</a></li>
                                <li><a href="#"><i class="uk-icon-heartbeat uk-icon-justify "></i>我喜欢的</a></li>
                                <li><a href="#"><i class="uk-icon-book uk-icon-justify "></i>我的收藏集</a></li>
                                <li><a href="#"><i class="uk-icon-film uk-icon-justify "></i>标签管理</a></li>
                                <li class="uk-nav-divider"></li>
                                <li><a href="#"><i class="uk-icon-cog uk-icon-justify "></i>设置</a></li>
                                <li><a href="${pageContext.request.contextPath}/logout"><i class="uk-icon-leaf uk-icon-justify "></i>登出</a></li>
                            </ul>
                        </div>
                        <%--<a href="${pageContext.request.contextPath}/currentuser/go_article_page">写文章</a>--%>
                        <%--<a href="${pageContext.request.contextPath}/logout">注销</a>--%>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </div>
</header>

<%--<div class="app-height-65">--%>

<%--</div>--%>

