package com.neusoft.controller;

import com.neusoft.domain.CategoryInfo;
import com.neusoft.mapper.ArticleMapper;
import com.neusoft.service.ArticleService;
import com.neusoft.service.CategoryService;
import com.neusoft.util.SqlSessionFactoryUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 2018/3/27.
 */
@Controller
public class HomeController {

    @Autowired
    ArticleService articleService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping("/")
    public ModelAndView home()
    {
        List<Map<String,Object>> mapList = articleService.getAllArticles();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("article_infos",mapList);

        List<CategoryInfo> categoryInfoList = categoryService.getAllCategroies();
        modelAndView.addObject("cates",categoryInfoList);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/error")
    public String error()
    {
        return "404";
    }
}
