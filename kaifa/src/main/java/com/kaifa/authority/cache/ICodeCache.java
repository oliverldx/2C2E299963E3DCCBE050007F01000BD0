/**
 * Copyright(c) Foresee Science & Technology Ltd. 
 */
package com.kaifa.authority.cache;

import java.util.Collection;

/**
 * <pre>
 * 对一般的键值对类型的对象数据进行查询，以及进行缓存，
 * 从而提高数据的利用率，以及减少数据库的访问次数.
 * </pre>
 * 
 * @author bieber hebibo@foresee.cn
 * @version 1.00.00
 * 
 *          <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容:
 * </pre>
 */
public interface ICodeCache {

	/**
	 * 获得所有数据记录.
	 * 
	 * @return 所有数据记录
	 */
	Collection<CodeObject> getCodeObjectList();

	/**
	 * 返回指定的数据对象.
	 * 
	 * @param code 代码
	 * @return 对应code的数据对象
	 */
	CodeObject getCodeObjectByCode(String code);

	/**
	 * 缓存清理.
	 */
	void clear();

	/**
	 * 判断是否可以清理缓存.
	 * 
	 * @return 是否可以清理缓存.
	 */
	boolean clearable();

	/**
	 * 缓存的名字.
	 * 
	 * @return 名字.
	 */
	String getName();
}
