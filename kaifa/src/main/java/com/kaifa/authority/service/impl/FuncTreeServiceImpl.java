/**
 * 
 */
package com.kaifa.authority.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kaifa.authority.mapper.FunctionTreeMapper;
import com.kaifa.authority.pojo.FunctionTree;
import com.kaifa.authority.service.IFuncTreeService;

/**
 * @author Administrator
 *
 */
@Service(IFuncTreeService.BEAN_ID)
public class FuncTreeServiceImpl implements IFuncTreeService {
	
	@Resource
	private FunctionTreeMapper functionTreeMapper;

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#deleteByPrimaryKey(java.lang.String)
	 */
	@Override
	public int deleteByPrimaryKey(String id) {
		return functionTreeMapper.deleteByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insert(cn.edu.schoolplatform.authority.pojo.FunctionTree)
	 */
	@Override
	public int insert(FunctionTree record) {
		return functionTreeMapper.insert(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#insertSelective(cn.edu.schoolplatform.authority.pojo.FunctionTree)
	 */
	@Override
	public int insertSelective(FunctionTree record) {
		return functionTreeMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectByPrimaryKey(java.lang.String)
	 */
	@Override
	public FunctionTree selectByPrimaryKey(String id) {
		return functionTreeMapper.selectByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#selectBySelective(java.lang.String)
	 */
	@Override
	public List<FunctionTree> selectBySelective(FunctionTree functionTree) {
		return null;
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKeySelective(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKeySelective(FunctionTree record) {
		return functionTreeMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IDefaultService#updateByPrimaryKey(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKey(FunctionTree record) {
		return functionTreeMapper.updateByPrimaryKey(record);
	}

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.IFuncTreeService#getFuncTreeChildren(cn.edu.schoolplatform.authority.pojo.FunctionTree)
	 */
	@Override
	public List<FunctionTree> getFuncTreeChildren(FunctionTree functionTree) {
		return functionTreeMapper.getFuncTreeChildren(functionTree);
	}
}
