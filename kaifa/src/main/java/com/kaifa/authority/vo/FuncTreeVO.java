package com.kaifa.authority.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.kaifa.authority.pojo.FunctionTree;

public class FuncTreeVO extends EasyTreeData{

	private String menuType;
	private String menu;
	private Integer menuSerial;
	private String isEnable;
	
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public Integer getMenuSerial() {
		return menuSerial;
	}
	public void setMenuSerial(Integer menuSerial) {
		this.menuSerial = menuSerial;
	}
	public String getIsEnable() {
		return isEnable;
	}
	public void setIsEnable(String isEnable) {
		this.isEnable = isEnable;
	}


	@Override
	public void convertFunctionTree(Object children,FunctionTree functionTree) {
		super.convertFunctionTree(children,functionTree);
		FuncTreeVO ft = (FuncTreeVO)children;
		ft.setMenuType(functionTree.getMenuType());
		ft.setMenu(functionTree.getMenu());
		ft.setMenuSerial(functionTree.getMenuSerial());
		ft.setChildren(new ArrayList<FuncTreeVO>());
		ft.setIsEnable(functionTree.getIsEnable());
	}
	
	@Override
	public List<Object> convertFunctionTreeList(
			List<FunctionTree> functionTreeList) {
		List<Object> easyTreeDataList = new ArrayList<Object>();
		for (FunctionTree functionTree : functionTreeList) {
			FuncTreeVO etd = new FuncTreeVO();
			convertFunctionTree(etd,functionTree);
			easyTreeDataList.add(etd);
		}
		return easyTreeDataList;
	}
	
	
	
	
	
}
