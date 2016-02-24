package com.kaifa.authority.mapper;

import java.util.List;

import com.kaifa.authority.pojo.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(String roleCode);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String roleCode);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> queryRolePage(Role record);
}