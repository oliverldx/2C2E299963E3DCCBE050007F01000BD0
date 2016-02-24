package com.kaifa.authority.vo;

import java.util.ArrayList;
import java.util.List;

import com.kaifa.authority.pojo.FunctionTree;

/**
 * easyUI TreeVO
 * 
 * @author Administrator
 * 
 */
public class EasyTreeData {

	// ID
	String id;
	// 节点名称
	String text;
	// 是否展开
	String state;
	// 图标样式
	String iconCls;
	// 父节点
	String _parentId;
	// 子节点集合
	List children;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public List getChildren() {
		return children;
	}

	public void setChildren(List children) {
		this.children = children;
	}

	public String get_parentId() {
		return _parentId;
	}

	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}

	public void convertFunctionTree(Object obj,FunctionTree functionTree) {
		EasyTreeData etd = (EasyTreeData)obj;
		etd.setId(functionTree.getFuncCode());
		etd.setIconCls(functionTree.getIcon());
		etd.setText(functionTree.getFuncName());
		etd.set_parentId(functionTree.getParentFuncCode());
	}

	public List<Object> convertFunctionTreeList(
			List<FunctionTree> functionTreeList) {
		List<Object> easyTreeDataList = new ArrayList<Object>();
		for (FunctionTree functionTree : functionTreeList) {
			EasyTreeData etd = new EasyTreeData();
			convertFunctionTree(etd,functionTree);
			easyTreeDataList.add(etd);
		}
		return easyTreeDataList;
	}

}
