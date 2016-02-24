/**
 * 
 */
package com.kaifa.authority.service;

import java.util.List;

import com.kaifa.authority.pojo.FunctionTree;

/**
 * 公共接口
 * @author leidexiang
 *
 */
public interface IDefaultService<T> {
	
	public static final String BEAN_ID = "authority_defaultService";
	
	public int deleteByPrimaryKey(String id);

	public int insert(T record);

	public int insertSelective(T record);

	public T selectByPrimaryKey(String id);
    
	public List<T> selectBySelective(T record);

	public int updateByPrimaryKeySelective(T record);

	public int updateByPrimaryKey(T record);

}
