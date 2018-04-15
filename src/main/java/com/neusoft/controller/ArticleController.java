package com.neusoft.controller;

import com.neusoft.domain.ArticleInfo;
import com.neusoft.domain.UserInfo;
import com.neusoft.mapper.ArticleMapper;
import com.neusoft.mapper.CommentMapper;
import com.neusoft.service.ArticleService;
import com.neusoft.util.SqlSessionFactoryUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 2018/3/28.
 */
@Controller
public class ArticleController {


    @Autowired
    ArticleService articleService;

    @RequestMapping("add_article")
    public String addArtcile(ArticleInfo articleInfo, HttpServletRequest request)
    {
        //获取用户id
        HttpSession httpSession = request.getSession();
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userinfo");
        articleInfo.setUserid(userInfo.getId());

        articleService.addArticle(articleInfo);

        return "redirect:/";

    }

    @RequestMapping("view_article/{aid}")
    public ModelAndView viewArticle(@PathVariable Integer aid)
    {
        ModelAndView modelAndView = articleService.viewArticle(aid);
        modelAndView.setViewName("view_article");
        return modelAndView;
    }

}
