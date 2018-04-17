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
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css?ver=2.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/components/form-file.almost-flat.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/assets/css/style.css?ver=2.0" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.js"></script>
    <script>
        $(function () {
            $('.uk-tab').on('change.uk.tab',function (event, item) {
                alert(item.text());
            })
        })
    </script>
    <script>
        function upfile() {
            var pic = document.getElementsByTagName('input')[0].files[0];
            var fd = new FormData();
            var xhr = new XMLHttpRequest();
            xhr.open('post', '${pageContext.request.contextPath}/currentuser/upload_avatar', true);
            xhr.onreadystatechange = function () {
                if (this.readyState == 4) {
                    var res = JSON.parse(this.responseText);
                    document.getElementById('avatar').src = '${pageContext.request.contextPath}/upload/' + res.src;
                }
            }

            fd.append('avatar', pic);
            xhr.send(fd);
        }
    </script>
</head>
<body>
<%@include file="common/header.jsp"%>
<%--${userinfo.username}的个人主页--%>
<%--<img src="${pageContext.request.contextPath}/upload/${userinfo.avatar}">--%>
<%--<a href="${pageContext.request.contextPath}/currentuser/edit">编辑个人信息</a>--%>
<div class="app-height-75">

</div>
<div class="mb-cover">
    <div class="b20"></div>
    <!--固定宽度，居中对齐-->
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-medium-3-4">
                <div id="mb_member_left">
                    <div class="uk-panel uk-panel-box uk-text-center">
                        <div class="uk-grid user-info">
                            <div class="uk-width-medium-1-5">
                                <div class="uk-form-row uk-margin-large-bottom">
                                    <div class="uk-form-file">
                                        <img id="avatar"
                                             src="https://user-gold-cdn.xitu.io/2018/2/22/161bc4cd96f02929?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1">
                                        <input type="file" name="pic" onchange="upfile();"/>
                                    </div>
                                </div>
                            </div>
                            <div class="uk-width-medium-3-5">
                                <h2>__豆约翰__</h2>
                                <div>
                                    <span>teacher</span>
                                    <span>|</span>
                                    <span>neu</span>
                                </div>
                                <div class="uk-margin">
                                    闲看庭前花开花落 漫随天外云卷云舒
                                </div>
                            </div>
                            <div class="uk-width-medium-1-5">
                                <div>
                                    <a href="${pageContext.request.contextPath}/user/edit/${user_info.user_id}">编辑个人资料</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="uk-panel uk-panel-box uk-margin">
                        <div data-v-815abe10="" data-v-4cdfa676="" class="detail-list detail-list sticky-box"
                             data-v-3f216172="">
                            <ul class="uk-tab" data-uk-tab="">
                                <li class="uk-active"><a href="#">动态</a></li>
                                <li><a href="#">文章<span>2</span></a></li>
                                <li><a href="#">动态</a></li>
                                <li><a href="#">文章</a></li>
                                <li><a href="#">话题</a></li>
                                <li><a href="#">文章</a></li>
                                <li><a href="#">话题</a></li>
                                <li><a href="#">关注</a></li>
                            </ul>

                            <div id="list-body" class="list-body">
                                <ul class="bookshelf">
                                    <li class="uk-list uk-list-line uk-clearfix topic uk-margin-top">
                                        <div class="content">
                                            <div class="uk-grid">
                                                <div class="uk-width-5-6">
                                                    <a href="/topic/show/1">电风扇的说法</a>
                                                    <a href="/topic/modify/1">修改</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="uk-width-medium-1-4" id="mb_list_right">
                <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                    <div class="uk-grid">
                        <div class="uk-width-1-2 uk-text-center uk-text-large">
                            <a href="/user/59693b86518825490d1dd04f/following">
                                <div data-v-4cdfa676="" class="item-title uk-text-muted">关注了</div>
                                <div data-v-4cdfa676="" class="item-count uk-text-muted">8</div>
                            </a>
                        </div>
                        <div class="uk-width-1-2 uk-text-center uk-text-large">
                            <a href="/user/59693b86518825490d1dd04f/followers">
                                <div data-v-4cdfa676="" class="item-title uk-text-muted">关注者</div>
                                <div data-v-4cdfa676="" class="item-count uk-text-muted">0</div>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="b20"></div>
                <!--页脚部分-->

            </div>
        </div>
    </div>
</div>
</body>
</html>
