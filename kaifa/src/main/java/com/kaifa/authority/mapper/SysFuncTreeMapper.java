package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.SysFuncTree;

public interface SysFuncTreeMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysFuncTree record);

    int insertSelective(SysFuncTree record);

    SysFuncTree selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysFuncTree record);

    int updateByPrimaryKey(SysFuncTree record);
}