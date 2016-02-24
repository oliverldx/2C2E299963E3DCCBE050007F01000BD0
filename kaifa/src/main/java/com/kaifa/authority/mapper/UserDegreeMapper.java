package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.UserDegree;

public interface UserDegreeMapper {
    int deleteByPrimaryKey(String degreeCode);

    int insert(UserDegree record);

    int insertSelective(UserDegree record);

    UserDegree selectByPrimaryKey(String degreeCode);

    int updateByPrimaryKeySelective(UserDegree record);

    int updateByPrimaryKey(UserDegree record);
}