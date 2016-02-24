package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.Group;

public interface GroupMapper {
    int deleteByPrimaryKey(String groupCode);

    int insert(Group record);

    int insertSelective(Group record);

    Group selectByPrimaryKey(String groupCode);

    int updateByPrimaryKeySelective(Group record);

    int updateByPrimaryKey(Group record);
}