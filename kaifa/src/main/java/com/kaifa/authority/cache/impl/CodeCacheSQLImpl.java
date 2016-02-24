package com.kaifa.authority.cache.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.kaifa.authority.cache.CodeObject;
import com.kaifa.authority.cache.ICodeCache;

public class CodeCacheSQLImpl  implements ICodeCache {

	private static final Log log = LogFactory.getLog(CodeCacheSQLImpl.class);

	private LinkedHashMap<String, CodeObject> cache = null;
	private String executeSQL;
	private String name;

	/**
	 * 构造方法，需要传入需要执行的数据库查询语句 该查询语句最初支持三个字段的查询，并为这算个字段指明NAME,VALUE,DESCRIPTION别名.
	 * 
	 * @param executeSQL sql
	 */
	public CodeCacheSQLImpl(String executeSQL) {
		super();
		this.executeSQL = executeSQL;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.foresee.tax.code.cache.ICodeCache#clear()
	 */
	@Override
	public void clear() {
		cache = null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.foresee.portal.base.cache.ICodeCache#getCodeObjectByCode(java.lang
	 * .String)
	 */
	@Override
	public CodeObject getCodeObjectByCode(String code) {
		init();
		return cache.get(code);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.foresee.portal.base.cache.ICodeCache#getCodeObjectList()
	 */
	@Override
	public Collection<CodeObject> getCodeObjectList() {
		init();
		return cache.values();
	}

	/**
	 * 第一次调用该组件时，将触发该方法执行，及加载对应数据的数据， 加载第一次后边将数据进行缓存，以后操作将不再对数据库进行访问.
	 */
	private void init() {
		synchronized (this) {
			if (cache == null) {
				try {
					@SuppressWarnings("deprecation")
//					List<Map<String, Object>> datas = this.getSimpleJdbcTemplate().queryForList(executeSQL);
					List<Map<String, Object>> datas = null;
					List<Map<String,Object>> hasNotSetParent = new ArrayList<Map<String,Object>>();//还没设置parent的对象
					LinkedHashMap<String, CodeObject> cache = new LinkedHashMap<String, CodeObject>();
					for (Map<String, Object> data : datas) {
						CodeObject codeObject = new CodeObject();
						codeObject.setName((String) data.get("NAME"));
						data.remove("NAME");
						codeObject.setValue((String) data.get("VALUE"));
						data.remove("VALUE");
						codeObject.setEnable(!"N".equals(data.get("ENABLE")));
						data.remove("ENABLE");
						codeObject.setDescription((String) data.get("DESCRIPTIOIN"));
						data.remove("DESCRIPTIOIN");
						String parent = (String) data.get("PARENT");
						data.remove("PARENT");
						if (parent != null && cache.get(parent) != null) {
							codeObject.setParent(cache.get(parent));
							cache.get(parent).getChildren().add(codeObject);
						}else if(parent != null && cache.get(parent) == null){
							Map<String,Object> obj = new HashMap<String,Object>();
							obj.put("parent", parent);
							obj.put("obj", codeObject);
							hasNotSetParent.add(obj);
						}
						for (Map.Entry<String, Object> entry : data.entrySet()) {
							codeObject.put(entry.getKey(), entry.getValue());
						}

						cache.put(codeObject.getValue(), codeObject);
					}
					//add by Tim 处理还没有设置parent的对象
					for(Map<String,Object> obj:hasNotSetParent){
						if(cache.get(obj.get("parent"))!=null){
							cache.get(obj.get("parent")).getChildren().add((CodeObject)obj.get("obj"));
							((CodeObject)obj.get("obj")).setParent(cache.get(obj.get("parent")));
						}
					}
					this.cache = cache;
				} catch (Exception e) {
					log.error("通过SQL获取代码缓存失败", e);
				}
			}
		}
	}

	/**
	 * 返回 executeSQL.
	 * 
	 * @return executeSQL。
	 */
	public String getExecuteSQL() {
		return executeSQL;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.foresee.tax.util.code.cache.ICodeCache#clearable()
	 */
	@Override
	public boolean clearable() {
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.foresee.tax.util.code.cache.ICodeCache#getName()
	 */
	@Override
	public String getName() {
		return this.name;
	}

	/**
	 * 设置 name.
	 * 
	 * @param name name。
	 */
	public void setName(String name) {
		this.name = name;
	}
}

