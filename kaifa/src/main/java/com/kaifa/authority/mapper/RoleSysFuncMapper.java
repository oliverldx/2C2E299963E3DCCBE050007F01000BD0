package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.RoleSysFunc;

public interface RoleSysFuncMapper {
    int deleteByPrimaryKey(String id);

    int insert(RoleSysFunc record);

    int insertSelective(RoleSysFunc record);

    RoleSysFunc selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(RoleSysFunc record);

    int updateByPrimaryKey(RoleSysFunc record);
}