package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.RoleFuncSet;

public interface RoleFuncSetMapper {
    int deleteByPrimaryKey(String id);

    int insert(RoleFuncSet record);

    int insertSelective(RoleFuncSet record);

    RoleFuncSet selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(RoleFuncSet record);

    int updateByPrimaryKey(RoleFuncSet record);
}