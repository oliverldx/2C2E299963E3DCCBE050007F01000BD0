/**
 * 
 */
package com.kaifa.authority.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kaifa.authority.mapper.UserMapper;
import com.kaifa.authority.pojo.FunctionTree;
import com.kaifa.authority.pojo.User;
import com.kaifa.authority.service.IUserService;

/**
 * 用户服务接口
 * @author leidexiang
 *
 */
@Service(IUserService.BEAN_ID)
public class UserServiceImpl implements IUserService {
	
	@Resource
	private UserMapper userMapper;

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#deleteByPrimaryKey(java.lang.String)
	 */
	@Override
	public int deleteByPrimaryKey(String id) {
		return userMapper.deleteByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insert(cn.edu.schoolplatform.authority.pojo.FunctionTree)
	 */
	@Override
	public int insert(User record) {
		return userMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insertSelective(cn.edu.schoolplatform.authority.pojo.FunctionTree)
	 */
	@Override
	public int insertSelective(User record) {
		return userMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectByPrimaryKey(java.lang.String)
	 */
	@Override
	public User selectByPrimaryKey(String id) {
		return userMapper.selectByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectBySelective(java.lang.String)
	 */
	@Override
	public List<User> selectBySelective(User user) {
		return null;
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKeySelective(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKeySelective(User record) {
		return userMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKey(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKey(User record) {
		return userMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<User> queryUserPage(User user) {
		return userMapper.queryUserPage(user);
	}

	
}
