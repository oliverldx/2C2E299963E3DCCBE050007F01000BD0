/**
 * 
 */
package com.kaifa.authority.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kaifa.authority.mapper.UserRoleMapper;
import com.kaifa.authority.pojo.UserRole;
import com.kaifa.authority.service.IUserRoleService;

/**
 * @author Administrator
 *
 */
@Service(IUserRoleService.BEAN_ID)
public class UserRoleServiceImpl implements IUserRoleService {
	
	@Resource
	private UserRoleMapper userRoleMapper;

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#deleteByPrimaryKey(java.lang.String)
	 */
	@Override
	public int deleteByPrimaryKey(String id) {
		return userRoleMapper.deleteByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insert(cn.edu.schoolplatform.authority.pojo.UserRole)
	 */
	@Override
	public int insert(UserRole record) {
		return userRoleMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insertSelective(cn.edu.schoolplatform.authority.pojo.UserRole)
	 */
	@Override
	public int insertSelective(UserRole record) {
		return userRoleMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectByPrimaryKey(java.lang.String)
	 */
	@Override
	public UserRole selectByPrimaryKey(String id) {
		return userRoleMapper.selectByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectBySelective(java.lang.String)
	 */
	@Override
	public List<UserRole> selectBySelective(UserRole userRole) {
		return null;
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKeySelective(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKeySelective(UserRole record) {
		return userRoleMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKey(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKey(UserRole record) {
		return userRoleMapper.updateByPrimaryKey(record);
	}

}
