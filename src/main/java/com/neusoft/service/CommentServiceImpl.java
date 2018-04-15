package com.neusoft.service;

import com.neusoft.domain.CommentInfo;
import com.neusoft.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by ttc on 2018/4/3.
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentMapper commentMapper;

    @Override
    public int add_comment(CommentInfo commentInfo) {
        Date now = new Date();
        Timestamp timestamp = new Timestamp(now.getTime());
        commentInfo.setCreatetime(timestamp);
        return commentMapper.add_comment(commentInfo);
    }
}
