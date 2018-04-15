<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/3/19
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/assets/wangEditor/wangEditor.js"></script>
    <style>
        /*评论*/
        .uk-comment-header{
            background: 0;
            border: 0;
            border-top:1px solid #ddd;
        }
    </style>
    <script>
        var E = window.wangEditor;
        var editor = null;
        $(function () {
            editor = new E('#editor')
            editor.create()
        })
        function addComment() {
            var hidden = document.getElementById('aid');


            var req = new XMLHttpRequest();
            req.open('post','${pageContext.request.contextPath}/add_comment',true);
            req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            req.send('articleid='+hidden.value+'&content='+editor.txt.text());

            req.onload = function () {


                var jsonStr = req.responseText;//json字符串，并非json对象
                var comment = JSON.parse(jsonStr);
                comment.username = '${userinfo.username}';
                var date = new Date();
                date.setTime(comment.createtime);
                comment.createtime = date.toLocaleString();
//                    alert(comment.content);

                    var html = template('comment',comment);
                    console.info(html);

                    var ul = document.getElementById('comment_list');
                    var oldChild = ul.innerHTML;
                    ul.innerHTML = html + oldChild;


            }
        }
    </script>
</head>
<body>

<%@include file="common/header.jsp"%>


<script type="text/html" id="comment">
    <li class="reply-item">
        <article class="uk-comment">
            <header class="uk-comment-header">
                <img class="uk-comment-avatar" src="#" width="50" height="50" alt="">
                <h4 class="uk-comment-title">${userinfo.username}</h4>
                <div class="uk-comment-meta">{{createtime}}</div>
            </header>
            <div class="uk-comment-body">
                <p>{{content}}</p>
            </div>
        </article>
    </li>
    <hr>
</script>
<div class="app-height-58">

</div>
<div class="app-cover uk-height-1-1">
    <div class="app-20">

    </div>
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-medium-3-4">

                <div class="uk-panel uk-panel-box uk-padding-remove">
                    <div class="topic-content">
                        <div class="topic-author">
                            <img class="uk-align-left uk-border-circle"
                                 src="#" width="40" height="40">
                            <div>${article.username}</div>
                            <div>${article.createtime}</div>
                        </div>
                        <h2 class="article-title uk-margin-large-left">
                            ${article.title}
                        </h2>
                        阅读量：<div>${article.viewcount}</div>
                        <div class="topic-detail">
                            ${article.html_content}
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${userinfo == null}">
                            要留言请先<a href="${pageContext.request.contextPath}/login">登录</a>
                        </c:when>
                        <c:otherwise>
                            <div>评论</div>

                            <div class="reply" id="final-reply">
                                <form class="uk-form" action="#" method="post" id="reply-form">
                                    <div class="uk-form-row">
                                        <input type="hidden" name="aid" value="${article.id}" id="aid">
                                        <div id="editor" class="uk-margin-large-left uk-margin-large-right">

                                        </div>
                                        <input type="button" value="评论" onclick="addComment();">
                                    </div>
                                </form>
                            </div>

                        </c:otherwise>
                    </c:choose>

                    <%--留言列表--%>
                    全部留言
                    <hr>
                    <ul class="uk-comment-list" id="comment_list">
                        <c:forEach items="${comments}" var="comment">
                            <li class="reply-item">
                                <article class="uk-comment">
                                    <header class="uk-comment-header">
                                        <img class="uk-comment-avatar" src="#" width="50" height="50" alt="">
                                        <h4 class="uk-comment-title">${comment.username}</h4>
                                        <div class="uk-comment-meta">${comment.createtime}</div>
                                    </header>
                                    <div class="uk-comment-body">
                                        <p>${comment.content}</p>
                                    </div>
                                </article>
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

</body>
</html>
