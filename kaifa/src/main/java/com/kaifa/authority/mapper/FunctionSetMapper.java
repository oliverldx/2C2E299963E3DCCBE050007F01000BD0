package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.FunctionSet;

public interface FunctionSetMapper {
    int deleteByPrimaryKey(String funcSetCode);

    int insert(FunctionSet record);

    int insertSelective(FunctionSet record);

    FunctionSet selectByPrimaryKey(String funcSetCode);

    int updateByPrimaryKeySelective(FunctionSet record);

    int updateByPrimaryKey(FunctionSet record);
}