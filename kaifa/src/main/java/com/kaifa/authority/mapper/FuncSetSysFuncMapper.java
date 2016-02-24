package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.FuncSetSysFunc;

public interface FuncSetSysFuncMapper {
    int deleteByPrimaryKey(String id);

    int insert(FuncSetSysFunc record);

    int insertSelective(FuncSetSysFunc record);

    FuncSetSysFunc selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(FuncSetSysFunc record);

    int updateByPrimaryKey(FuncSetSysFunc record);
}