package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.GroupRoleUserDegree;

public interface GroupRoleUserDegreeMapper {
    int deleteByPrimaryKey(String id);

    int insert(GroupRoleUserDegree record);

    int insertSelective(GroupRoleUserDegree record);

    GroupRoleUserDegree selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(GroupRoleUserDegree record);

    int updateByPrimaryKey(GroupRoleUserDegree record);
}