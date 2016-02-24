package com.kaifa.authority.mapper;

import java.util.List;

import com.kaifa.authority.pojo.FunctionTree;

public interface FunctionTreeMapper {
    int deleteByPrimaryKey(String funcCode);

    int insert(FunctionTree record);

    int insertSelective(FunctionTree record);

    FunctionTree selectByPrimaryKey(String funcCode);

    int updateByPrimaryKeySelective(FunctionTree record);

    int updateByPrimaryKey(FunctionTree record);
    
    List<FunctionTree> getFuncTreeChildren(FunctionTree record);
}