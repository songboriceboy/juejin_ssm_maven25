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

    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <script>
        function addComment() {
            var hidden = document.getElementById('aid');
            var textarea = document.getElementById('comment_content');
            var req = new XMLHttpRequest();
            req.open('post','${pageContext.request.contextPath}/add_comment',true);
            req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            req.send('articleid='+hidden.value+'&content='+textarea.value);

            req.onload = function () {

//                    alert('ok');
                    <%--var comment = {};--%>
                    <%--comment.content = textarea.value;--%>
                    <%--comment.username = '${userinfo.username}';--%>
                    <%--comment.createtime = new Date().toLocaleDateString();--%>
//                    alert(req.responseText);
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
    <li>
        <div>
            {{content}}
        </div>
        <div>
            <span>{{username}}</span>
            <span>{{createtime}}</span>
        </div>
    </li>
    <hr>
</script>


    <h2>${article.title}</h2>
    <p>${article.username}</p>
    <div>${article.createtime}</div>
    <div>${article.html_content}</div>
    阅读量：<div>${article.viewcount}</div>
    <hr>

    <c:choose>
        <c:when test="${userinfo == null}">
            要留言请先<a href="${pageContext.request.contextPath}/login">登录</a>
        </c:when>
        <c:otherwise>
            <div>评论</div>
            <form action="#">
                <input type="hidden" name="aid" value="${article.id}" id="aid">
                <textarea rows="6" cols="30" name="content" id="comment_content"></textarea>
                <input type="button" value="评论" onclick="addComment();">
            </form>
        </c:otherwise>
    </c:choose>

    <%--留言列表--%>
    全部留言
    <hr>
    <ul id="comment_list">
        <c:forEach items="${comments}" var="comment">
            <li>
                <div>
                        ${comment.content}
                </div>
                <div>
                    <span>${comment.username}</span>
                    <span>${comment.createtime}</span>
                </div>
            </li>
            <hr>
        </c:forEach>

    </ul>


</body>
</html>
