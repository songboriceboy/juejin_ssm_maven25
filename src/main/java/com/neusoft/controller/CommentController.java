package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.CommentInfo;
import com.neusoft.domain.UserInfo;
import com.neusoft.mapper.ArticleMapper;
import com.neusoft.mapper.CommentMapper;
import com.neusoft.service.CommentService;
import com.neusoft.util.SqlSessionFactoryUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by ttc on 2018/3/28.
 */
@Controller
public class CommentController {

    @Autowired
    CommentService commentService;

    @RequestMapping("add_comment")
    public void addComment(HttpServletRequest request, HttpServletResponse response, CommentInfo commentInfo) throws IOException {

        //获取用户id
        HttpSession httpSession = request.getSession();
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userinfo");
        commentInfo.setUserid(userInfo.getId());


        int result = commentService.add_comment(commentInfo);

        String strJson = JSON.toJSONString(commentInfo);
        response.getWriter().println(strJson);
    }
}
