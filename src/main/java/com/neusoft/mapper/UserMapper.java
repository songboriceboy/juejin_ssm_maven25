package com.neusoft.mapper;

import com.neusoft.domain.UserInfo;

/**
 * Created by ttc on 2018/3/16.
 */
public interface UserMapper {
    public int regUser(UserInfo user);
    public UserInfo userLogin(UserInfo userInfo);
    public int isUserNameExist(String username);

    public int updateUser(UserInfo user);
}
