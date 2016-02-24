package com.kaifa.authority.mapper;

import java.util.List;

import com.kaifa.authority.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(String userCode);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userCode);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> queryUserPage(User record);
}