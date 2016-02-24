package com.kaifa.authority.vo;

import java.io.Serializable;

/**
 * 
 * <pre>
 * 功能树VO
 * </pre>
 */
public class Tree  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4121630956207391046L;
	String treeId;
	String name;
	String simpleName;
	String description;
	String code;
	String parentCode;
	int sortIndex;
	boolean isEnable;
	boolean hasChildTree;
	String action;
	
	/**
	 * @return 返回 simpleName。
	 */
	public String getSimpleName() {
		return simpleName;
	}
	/**
	 * @param simpleName 设置 simpleName。
	 */
	public void setSimpleName(String simpleName) {
		this.simpleName = simpleName;
	}
	/**
	 * @return 返回 parentCode。
	 */
	public String getParentCode() {
		return parentCode;
	}
	/**
	 * @param parentCode 设置 parentCode。
	 */
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	/**
	 * @return 返回 treeId。
	 */
	public String getTreeId() {
		return treeId;
	}
	/**
	 * @param treeId 设置 treeId。
	 */
	public void setTreeId(String treeId) {
		this.treeId = treeId;
	}
	/**
	 * @return 返回 name。
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name 设置 name。
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return 返回 description。
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description 设置 description。
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return 返回 code。
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code 设置 code。
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * @return 返回 sortIndex。
	 */
	public int getSortIndex() {
		return sortIndex;
	}
	/**
	 * @param sortIndex 设置 sortIndex。
	 */
	public void setSortIndex(int sortIndex) {
		this.sortIndex = sortIndex;
	}
	/**
	 * @return 返回 isEnable。
	 */
	public boolean isEnable() {
		return isEnable;
	}
	/**
	 * @param isEnable 设置 isEnable。
	 */
	public void setEnable(boolean isEnable) {
		this.isEnable = isEnable;
	}
	/**
	 * @return 返回 hasChildTree。
	 */
	public boolean isHasChildTree() {
		return hasChildTree;
	}
	/**
	 * @param hasChildTree 设置 hasChildTree。
	 */
	public void setHasChildTree(boolean hasChildTree) {
		this.hasChildTree = hasChildTree;
	}
	/**
	 * @return 返回 action。
	 */
	public String getAction() {
		return action;
	}
	/**
	 * @param action 设置 action。
	 */
	public void setAction(String action) {
		this.action = action;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj ==null)return false;
		Tree t = (Tree)obj;
		if(t.getTreeId().equals(this.treeId)) {
			return true;
		}else {
			return false;
		}
	}
	
}
