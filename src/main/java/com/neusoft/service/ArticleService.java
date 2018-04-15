package com.neusoft.service;

import com.neusoft.domain.ArticleInfo;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 2018/4/2.
 */
public interface ArticleService {
    public ModelAndView viewArticle(int aid);
    public int addArticle(ArticleInfo articleInfo);
    public List<Map<String,Object>> getAllArticles();
}
