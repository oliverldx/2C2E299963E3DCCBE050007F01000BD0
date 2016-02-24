package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.UserRole;

public interface UserRoleMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}