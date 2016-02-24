/**
 * 
 */
package com.kaifa.authority.service;

import java.util.List;

import com.kaifa.authority.pojo.Role;

/**
 * 角色接口
 * @author leidexing
 */
public interface IRoleService extends IDefaultService<Role>{

	public static final String BEAN_ID = "authority_roleService";
	
	public List<Role> queryRolePage(Role role);
}
