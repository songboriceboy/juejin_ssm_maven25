package com.neusoft.service;

import com.neusoft.domain.ArticleInfo;
import com.neusoft.mapper.ArticleMapper;
import com.neusoft.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 2018/4/2.
 */

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    ArticleMapper articleMapper;
    @Autowired
    CommentMapper commentMapper;

    @Override
    @Transactional
    public ModelAndView viewArticle(int aid) {
        //增加该篇文章的阅读量
        articleMapper.increaseViewCount(aid);



        Map<String,Object> map = articleMapper.getArticleById(aid);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("article",map);

        //加载本文章全部留言信息
        List<Map<String,Object>> comments = commentMapper.getCommentsByArticleId(aid);

        modelAndView.addObject("comments",comments);


        return modelAndView;

    }

    @Override
    public int addArticle(ArticleInfo articleInfo) {
        Date now = new Date();
        Timestamp timestamp = new Timestamp(now.getTime());
        articleInfo.setCreatetime(timestamp);
        return articleMapper.addArticle(articleInfo);
    }

    @Override
    public List<Map<String, Object>> getAllArticles() {
        return articleMapper.getAllArticles();
    }
}
