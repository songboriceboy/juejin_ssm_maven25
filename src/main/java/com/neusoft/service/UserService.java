package com.neusoft.service;

import com.neusoft.domain.UserInfo;

/**
 * Created by ttc on 2018/4/3.
 */
public interface UserService {
    public int regUser(UserInfo user);
    public UserInfo userLogin(UserInfo userInfo);
    public int isUserNameExist(String username);

    public int updateUser(UserInfo user);
}
