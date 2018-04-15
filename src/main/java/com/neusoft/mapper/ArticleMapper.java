package com.neusoft.mapper;

import com.neusoft.domain.ArticleInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 2018/3/19.
 */

public interface ArticleMapper {
    public int addArticle(ArticleInfo articleInfo);
    public List<Map<String,Object>> getAllArticles();
    public Map<String,Object> getArticleById(int aid);
    public int increaseViewCount(int aid);
}
