package com.neusoft.service;

import com.neusoft.domain.UserInfo;
import com.neusoft.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ttc on 2018/4/3.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public int regUser(UserInfo user) {
        return userMapper.regUser(user);
    }

    @Override
    public UserInfo userLogin(UserInfo userInfo) {
        return userMapper.userLogin(userInfo);
    }

    @Override
    public int isUserNameExist(String username) {
        return userMapper.isUserNameExist(username);
    }

    @Override
    public int updateUser(UserInfo user) {
        return userMapper.updateUser(user);
    }
}
