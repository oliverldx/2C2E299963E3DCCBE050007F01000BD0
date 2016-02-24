/**
 * 
 */
package com.kaifa.authority.service;

import java.util.List;

import com.kaifa.authority.pojo.FunctionTree;

/**
 * 功能树接口
 * @author leidexing
 */
public interface IFuncTreeService extends IDefaultService<FunctionTree>{

	public static final String BEAN_ID = "authority_funcTreeService";
	
	public List<FunctionTree> getFuncTreeChildren(FunctionTree functionTree);
	
}
