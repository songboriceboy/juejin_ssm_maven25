<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/3/16
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>小掘金</title>
      <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
      <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.js"></script>
  </head>
  <body>
   
  <%@include file="common/header.jsp"%>
  <div class="app-height-65">

  </div>
  <%--分类导航--%>
    <div class="uk-container uk-container-center">
        <div class="uk-panel uk-panel-box app-cate">
            <ul class="uk-subnav uk-position-relative">
                <c:forEach items="${cates}" var="cate">
                    <li><a href="#">${cate.category_name}</a></li>
                </c:forEach>
                <li class="uk-position-absolute app-all-tag"><a href="#">标签管理</a></li>
            </ul>
        </div>
    </div>

<%--网页主体--%>

  <div class="app-cover">

      <div class="app-35">

      </div>

      <div  class="uk-container uk-container-center">
          <div class="uk-grid">
              <%--左边的4分之3宽度，用来放文章列表--%>
              <div class="uk-width-medium-3-4">
                  <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                      <ul class="uk-list">
                          <c:forEach items="${article_infos}" var="articleinfo">
                              <li class="app-blog-item">
                                  <div class="uk-text-truncate title">
                                      <a href="${pageContext.request.contextPath}/view_article/${articleinfo.id}">${articleinfo.title}</a>
                                  </div>
                                  <div>
                                      <a href="#">
                                    <span class="topic-cate">
                                        javascript
                                    </span>
                                      </a>
                                      <span>
                                    <a href="/user/show/1">${userinfo.username}</a>
                                  </span>
                                      <span>
                                    ${articleinfo.createtime}
                                  </span>
                                      <span>
                                   ${articleinfo.viewcount}次阅读
                                  </span>
                                  </div>
                              </li>
                          </c:forEach>
                      </ul>
                  </div>

              </div>

              <%--右边侧边栏 占1/4宽度--%>
              <div class="uk-width-medium-1-4">
                  <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                      注册
                  </div>
                  <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                      热门标签
                  </div>
              </div>
          </div>

      </div>



  </div>


  <%--<ul>--%>
      <%--<c:forEach items="${article_infos}" var="article">--%>
          <%--<li>--%>
              <%--<img class="avatar" src="${pageContext.request.contextPath}/upload/${article.avatar}" width="32" height="32">--%>
              <%--<div>--%>
                  <%--<a href="#">${article.username}</a>--%>
                  <%--<span>${article.createtime}</span>--%>
                 <%--阅读量 <span>${article.viewcount}</span>--%>
              <%--</div>--%>
              <%--<div>--%>
                  <%--<a href="${pageContext.request.contextPath}/view_article/${article.id}">${article.title}</a>--%>
              <%--</div>--%>
          <%--</li>--%>
      <%--</c:forEach>--%>
  <%--</ul>--%>

  </body>
</html>
