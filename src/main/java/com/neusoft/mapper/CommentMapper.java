package com.neusoft.mapper;

import com.neusoft.domain.CommentInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 2018/3/20.
 */
public interface CommentMapper {
   public int add_comment(CommentInfo commentInfo);
   public List<Map<String,Object>> getCommentsByArticleId(int aid);
}
