package com.kaifa.mapper;

import java.util.List;

import com.kaifa.pojo.User;

public interface TestUserMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
  //hzz
    List<User> queryUser(User record);
    List<User> queryUserById(Integer id);
}