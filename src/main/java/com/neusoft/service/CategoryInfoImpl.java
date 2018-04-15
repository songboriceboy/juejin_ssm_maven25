package com.neusoft.service;

import com.neusoft.domain.CategoryInfo;
import com.neusoft.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/15.
 */
@Service
public class CategoryInfoImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;
    @Override
    public List<CategoryInfo> getAllCategroies() {
        return categoryMapper.getAllCategroies();
    }
}
