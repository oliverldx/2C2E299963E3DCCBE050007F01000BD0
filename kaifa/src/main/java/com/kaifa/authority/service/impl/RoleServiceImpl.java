/**
 * 
 */
package com.kaifa.authority.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kaifa.authority.mapper.RoleMapper;
import com.kaifa.authority.pojo.FunctionTree;
import com.kaifa.authority.pojo.Role;
import com.kaifa.authority.service.IRoleService;

/**
 * 角色服务接口
 * @author leidexiang
 *
 */
@Service(IRoleService.BEAN_ID)
public class RoleServiceImpl implements IRoleService {
	
	@Resource
	private RoleMapper roleMapper;

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#deleteByPrimaryKey(java.lang.String)
	 */
	@Override
	public int deleteByPrimaryKey(String id) {
		return roleMapper.deleteByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insert(cn.edu.schoolplatform.authority.pojo.FunctionTree)
	 */
	@Override
	public int insert(Role record) {
		return roleMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insertSelective(cn.edu.schoolplatform.authority.pojo.FunctionTree)
	 */
	@Override
	public int insertSelective(Role record) {
		return roleMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectByPrimaryKey(java.lang.String)
	 */
	@Override
	public Role selectByPrimaryKey(String id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectBySelective(java.lang.String)
	 */
	@Override
	public List<Role> selectBySelective(Role role) {
		return null;
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKeySelective(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKeySelective(Role record) {
		return roleMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKey(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKey(Role record) {
		return roleMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Role> queryRolePage(Role role) {
		return roleMapper.queryRolePage(role);
	}

	
}
