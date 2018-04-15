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

  </head>
  <body>
   
  <%@include file="common/header.jsp"%>


  <div class="uk-container uk-container-center">
      <div class="uk-panel uk-panel-box uk-text-center app-cate">
          <ul class="uk-subnav uk-position-relative">

              <li><a href="#">问与答</a></li>

              <li><a href="#">技术分享</a></li>

              <li><a href="#">程序员</a></li>

              <li><a href="#">分享创造</a></li>

              <li><a href="#">分享发现</a></li>

              <li><a href="#">java</a></li>

              <li><a href="#">htmlcss</a></li>

              <li><a href="#">javascript</a></li>

              <li class="app-all-tag uk-position-absolute"><a href="#">标签管理</a></li>
          </ul>

      </div>
  </div>

  <div class="app-cover">
      <div class="b20"></div>
      <!--固定宽度，居中对齐-->
      <div class="uk-container uk-container-center">
          <div class="uk-grid" data-uk-grid-margin="">
              <div class="uk-width-medium-3-4 uk-row-first">

                  <div class="uk-panel uk-panel-box uk-padding-remove">
                      <ul class="uk-list" id="topic-list">




                          <li class="app-blog-item" id="5">

                              <div class="title uk-text-truncate">
                                  <a href="/topic/show/5">ds都是</a>
                              </div>
                              <div>
                                  <a href="javascript:;" section_id="8">
                                    <span class="topic-cate">
                                        javascript
                                    </span>
                                  </a>
                                  <span>
                      <a href="/user/show/1">aaa</a>
              </span>
                                  <span>
                   2018-2-19
              </span>
                                  <span>
                   908次阅读
               </span>
                              </div>
                          </li>


                          <li class="app-blog-item" id="4">

                              <div class="title uk-text-truncate">
                                  <a href="/topic/show/4">科技好好干科技好好干科技好好干科技好好干科技好好干</a>
                              </div>
                              <div>
                                  <a href="javascript:;" section_id="3">
                                    <span class="topic-cate">
                                        程序员
                                    </span>
                                  </a>
                                  <span>
                      <a href="/user/show/1">aaa</a>
              </span>
                                  <span>
                   2018-2-21
              </span>
                                  <span>
                   908次阅读
               </span>
                              </div>
                          </li>


                          <li class="app-blog-item" id="3">

                              <div class="title uk-text-truncate">
                                  <a href="/topic/show/3">范德萨</a>
                              </div>
                              <div>
                                  <a href="javascript:;" section_id="8">
                                    <span class="topic-cate">
                                        javascript
                                    </span>
                                  </a>
                                  <span>
                      <a href="/user/show/1">aaa</a>
              </span>
                                  <span>
                   2018-2-19
              </span>
                                  <span>
                   908次阅读
               </span>
                              </div>
                          </li>


                          <li class="app-blog-item" id="2">

                              <div class="title uk-text-truncate">
                                  <a href="/topic/show/2">很反感</a>
                              </div>
                              <div>
                                  <a href="javascript:;" section_id="3">
                                    <span class="topic-cate">
                                        程序员
                                    </span>
                                  </a>
                                  <span>
                      <a href="/user/show/1">aaa</a>
              </span>
                                  <span>
                   2018-2-19
              </span>
                                  <span>
                   908次阅读
               </span>
                              </div>
                          </li>


                          <li class="app-blog-item" id="1">

                              <div class="title uk-text-truncate">
                                  <a href="/topic/show/1">电风扇的说法</a>
                              </div>
                              <div>
                                  <a href="javascript:;" section_id="3">
                                    <span class="topic-cate">
                                        程序员
                                    </span>
                                  </a>
                                  <span>
                      <a href="/user/show/1">aaa</a>
              </span>
                                  <span>
                   2018-2-19
              </span>
                                  <span>
                   908次阅读
               </span>
                              </div>
                          </li>
                      </ul>

                  </div>

              </div>

              <div class="uk-width-medium-1-4 uk-hidden-small">

                  <div id="ulogin" class="login uk-panel uk-panel-box uk-panel-box-secondary">

                      <div class="uk-text-bold uk-margin-bottom">juejin</div>
                      <form class="uk-form  uk-margin-small-top">
                          <div class="uk-form-row ">
                              <input type="text" placeholder="昵称" class="uk-form-blank uk-form-width-medium ">
                          </div>
                          <div class="uk-form-row">
                              <input type="text" placeholder="邮箱/手机" class="uk-form-blank uk-form-width-medium">
                          </div>
                          <div class="uk-form-row">
                              <input type="password" placeholder="密码（不少于6位）" class="uk-form-blank uk-form-width-medium">
                          </div>

                          <button id="login" class="uk-margin-top uk-button uk-button-primary uk-width-1-1">立即注册</button>

                      </form>

                  </div>
                  <div class="b20"></div>
                  <div class="tag uk-panel uk-panel-box uk-panel-box-secondary">
                      <div>
                          <div class="uk-text-bold uk-text-middle uk-float-left uk-margin-left uk-margin-top">热门标签</div>
                          <div class="uk-float-right uk-margin-right uk-margin-top"><a href="#">查看全部</a></div>
                      </div>
                      <div class="uk-margin-large-top"><hr></div>

                      <div class="uk-margin-top">
                          <div class="tag-item uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">架构</a></div>
                          <div class="tag-item uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">开源</a></div>
                      </div>
                      <div class="uk-margin-top">
                          <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">算法</a></div>
                          <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">GitHub</a></div>
                      </div>
                      <div class="uk-margin-top">
                          <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">面试</a></div>
                          <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">代码规范</a></div>
                      </div>
                      <div class="uk-margin-top">
                          <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">产品</a></div>
                          <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">铸剑翻译</a></div>
                      </div>
                  </div>



                  <!--页脚部分-->
                  <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                      <h3 class="uk-panel-title">你可能感兴趣的人</h3>
                      <ul class="uk-list">
                          <li>
                              <img class="uk-align-left uk-border-circle" src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                              <div>zhangsan</div>
                              <div>前端学徒</div>
                          </li>
                          <li>
                              <img class="uk-align-left uk-border-circle" src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                              <div>zhangsan</div>
                              <div>前端学徒</div>
                          </li>
                          <li>
                              <img class="uk-align-left uk-border-circle" src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                              <div>zhangsan</div>
                              <div>前端学徒</div>
                          </li>
                          <li>
                              <img class="uk-align-left uk-border-circle" src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                              <div>zhangsan</div>
                              <div>前端学徒</div>
                          </li>
                          <li>
                              <img class="uk-align-left uk-border-circle" src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                              <div>zhangsan</div>
                              <div>前端学徒</div>
                          </li>
                      </ul>

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
