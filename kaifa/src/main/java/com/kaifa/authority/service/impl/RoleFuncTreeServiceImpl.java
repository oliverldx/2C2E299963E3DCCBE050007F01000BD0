/**
 * 
 */
package com.kaifa.authority.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kaifa.authority.mapper.RoleFunctionTreeMapper;
import com.kaifa.authority.pojo.RoleFunctionTree;
import com.kaifa.authority.service.IRoleFuncTreeService;

/**
 * @author Administrator
 *
 */
@Service(IRoleFuncTreeService.BEAN_ID)
public class RoleFuncTreeServiceImpl implements IRoleFuncTreeService {
	
	@Resource
	private RoleFunctionTreeMapper roleFunctionTreeMapper;

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#deleteByPrimaryKey(java.lang.String)
	 */
	@Override
	public int deleteByPrimaryKey(String id) {
		return roleFunctionTreeMapper.deleteByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insert(cn.edu.schoolplatform.authority.pojo.RoleFunctionTree)
	 */
	@Override
	public int insert(RoleFunctionTree record) {
		return roleFunctionTreeMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insertSelective(cn.edu.schoolplatform.authority.pojo.RoleFunctionTree)
	 */
	@Override
	public int insertSelective(RoleFunctionTree record) {
		return roleFunctionTreeMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectByPrimaryKey(java.lang.String)
	 */
	@Override
	public RoleFunctionTree selectByPrimaryKey(String id) {
		return roleFunctionTreeMapper.selectByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectBySelective(java.lang.String)
	 */
	@Override
	public List<RoleFunctionTree> selectBySelective(RoleFunctionTree roleFunctionTree) {
		return null;
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKeySelective(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKeySelective(RoleFunctionTree record) {
		return roleFunctionTreeMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKey(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKey(RoleFunctionTree record) {
		return roleFunctionTreeMapper.updateByPrimaryKey(record);
	}

}
