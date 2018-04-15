<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/3/19
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/editor-md-master/css/editormd.css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/editor-md-master/editormd.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.js"></script>
    <style>
        /*发表文章*/
        .turnonart {
            width: 336px;
            border: 1px solid black;
        }


        .turnonart .li1 {
            color: #949CA5;
            font-size: 20px;
            font-weight: bold;
        }

        .turnonart .li2 {
            color: #949CA5;
            font-size: 18px;
        }

        .turnonart li .app-submit {
            background-color: white;
            border: 1px solid #007BFF;
            color: #007BFF;
        }

        .turnonart li ul li a {
            color: #949494;
            background-color: #FFFFFF;
        }

        .turnonart li ul li a:hover {
            color: #007BFF;
            background-color: #F7FFFF;
        }

        .turnonart li ul li .app-cate {
            color: #007BFF;
            background-color: #F7FFFF;
        }
    </style>
    <script>
        $(function () {

            var ul = document.getElementById("lis");
            var lis = ul.getElementsByTagName('li');
            var cate_id = document.getElementById('cate_id');
            for (var i = 0; i < lis.length; i++) {
                lis[i].onclick = function () {
                    cate_id.value = this.id;
                    for (var i = 0; i < lis.length; i++) {
                        lis[i].getElementsByTagName('a')[0].className = 'uk-button';
                    }
                    this.getElementsByTagName('a')[0].className = 'app-cate uk-button';

                }
            }

            var testEditor = editormd({
                id: "test-editormd",
//                height: 840,
                height:"100%",
                width: "100%",
                placeholder          : "Markdown编辑器",
                path: "${pageContext.request.contextPath}/assets/editor-md-master/lib/",
                toolbarIcons: function () {
                    // Or return editormd.toolbarModes[name]; // full, simple, mini
                    // Using "||" set icons align right.
                    return ["undo", "redo", "|", "watch", "fullscreen", "preview"]
                },
                //toolbar  : false,             // 关闭工具栏
                codeFold: true,
                searchReplace: true,
                saveHTMLToTextarea: true,      // 保存 HTML 到 Textarea
                htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                emoji: true,
                taskList: true,
                tocm: true,          // Using [TOCM]
                tex: true,                      // 开启科学公式 TeX 语言支持，默认关闭
                //previewCodeHighlight : false,  // 关闭预览窗口的代码高亮，默认开启
                flowChart: true,                // 疑似 Sea.js与 Raphael.js 有冲突，必须先加载 Raphael.js ，Editor.md 才能在 Sea.js 下正常进行；
                sequenceDiagram: true,          // 同上
                //dialogLockScreen : false,      // 设置弹出层对话框不锁屏，全局通用，默认为 true
                //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为 true
                //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为 true
                //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为 0.1
                //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为 #fff
                imageUpload: true,
                imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL: "{:url('api/uploader/uploadEditorImg?pic_type=10')}",
                onload: function () {

                    this.on('paste', function () {
                        console.log(1);
                    });

                },
                onpreviewing : function() {
                    this.watch();
                    console.log("onpreviewing =>", this, this.id, this.settings);
                    // on previewing you can custom css .editormd-preview-active
                },

                onpreviewed : function() {
                    console.log("onpreviewed =>", this, this.id, this.settings);
                    this.unwatch();
                }
            });
        });
    </script>
</head>
<body>

<form class="uk-form"  action="${pageContext.request.contextPath}/add_article" method="post"
      target="_blank" id = "article_form">

    <div class="uk-grid">
        <div class="uk-width-4-6">
            <input type="hidden" name = "topic_id" value="${topic.topic_id}" id="topic_id">
            <input type="hidden" name = "cate_id" value="1" id="cate_id">

            <input type="text" placeholder="请输入标题" class="uk-width-1-1 uk-form-large uk-form-blank" name="title" value="" id = "title">
        </div>

        <div class="uk-width-1-6 uk-text-center uk-button-dropdown" data-uk-dropdown="{pos:'bottom-right',mode:'click'}">
            <a href="#" class="uk-link-muted uk-text-large uk-text-primary" style="line-height: 40px">发布文章</a>

            <div class="turnonart uk-dropdown uk-text-left uk-dropdown-bottom">
                <ul class="uk-list uk-margin-left">
                    <li class="li1 uk-margin-top">发布文章</li>
                    <li class="li2 uk-margin-top">选择分类</li>
                    <li id="lis">
                        <ul class=" uk-margin-top">

                            <c:forEach items="${cates}" var="cate">
                                <c:choose>
                                    <c:when test="${cate.id == 1}">
                                        <li class="uk-display-inline-block uk-margin-small-top uk-margin-small-right" id="${cate.id}">
                                            <a href="#" class="app-cate uk-button">${cate.category_name}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="uk-display-inline-block uk-margin-small-top uk-margin-small-right" id="${cate.id}">
                                            <a href="#" class="uk-button">${cate.category_name}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                        </ul>
                    </li>

                    <li class="uk-text-center">
                        <input type="submit" class="app-submit uk-button uk-margin-top" value="确定并发布">
                    </li>
                </ul>
            </div>
        </div>
    </div>
    </div>

    <div class="uk-grid uk-margin-remove mk-ed">

        <div class="editormd  uk-height-viewport uk-width-1-1 markdown-editor" id="test-editormd">

            <textarea class="editormd-markdown-textarea uk-width-1-1" name="topic_markdown_content" id = "topic_markdown_content">${topic.topic_markdown_content}</textarea>

        </div>

    </div>

</form>
</body>
</html>
