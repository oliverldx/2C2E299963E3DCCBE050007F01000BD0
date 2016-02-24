package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.SystemFunction;

public interface SystemFunctionMapper {
    int deleteByPrimaryKey(String sysFuncCode);

    int insert(SystemFunction record);

    int insertSelective(SystemFunction record);

    SystemFunction selectByPrimaryKey(String sysFuncCode);

    int updateByPrimaryKeySelective(SystemFunction record);

    int updateByPrimaryKey(SystemFunction record);
}