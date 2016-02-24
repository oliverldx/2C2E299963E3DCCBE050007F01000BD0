package com.kaifa.authority.mapper;

import com.kaifa.authority.pojo.LoginAccount;

public interface LoginAccountMapper {
    int deleteByPrimaryKey(String accountCode);

    int insert(LoginAccount record);

    int insertSelective(LoginAccount record);

    LoginAccount selectByPrimaryKey(String accountCode);

    int updateByPrimaryKeySelective(LoginAccount record);

    int updateByPrimaryKey(LoginAccount record);
    
}