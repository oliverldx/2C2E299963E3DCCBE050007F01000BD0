/**
 * 
 */
package com.kaifa.authority.service;

import java.util.List;

import com.kaifa.authority.pojo.User;

/**
 * 用户接口
 * @author leidexing
 */
public interface IUserService extends IDefaultService<User>{

	public static final String BEAN_ID = "authority_userService";
	
	public List<User> queryUserPage(User role);
}
