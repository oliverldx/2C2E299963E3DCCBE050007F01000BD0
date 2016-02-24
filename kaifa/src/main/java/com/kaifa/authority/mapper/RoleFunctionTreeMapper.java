package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.RoleFunctionTree;

public interface RoleFunctionTreeMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(RoleFunctionTree record);

    int insertSelective(RoleFunctionTree record);

    RoleFunctionTree selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(RoleFunctionTree record);

    int updateByPrimaryKey(RoleFunctionTree record);
}