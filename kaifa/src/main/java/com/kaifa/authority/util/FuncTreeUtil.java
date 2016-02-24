package com.kaifa.authority.util;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.kaifa.authority.pojo.FunctionTree;
import com.kaifa.authority.vo.FuncTreeVO;

public class FuncTreeUtil {

	public static FunctionTree convertToSaveFunctionTree(FuncTreeVO funcTreeVO,HttpServletRequest request) {
		FunctionTree ft = new FunctionTree();
		ft.setFuncCode(UUID.randomUUID().toString().replaceAll("-", ""));
		if(StringUtils.isNotBlank(funcTreeVO.getText()))ft.setFuncName(funcTreeVO.getText());
		if(StringUtils.isNotBlank(funcTreeVO.getIconCls()))ft.setIcon(funcTreeVO.getIconCls());
		if(StringUtils.isNotBlank(funcTreeVO.getIsEnable()))ft.setIsEnable(funcTreeVO.getIsEnable());
		if(StringUtils.isNotBlank(funcTreeVO.getMenu()))ft.setMenu(funcTreeVO.getMenu());
		if(StringUtils.isNotBlank(funcTreeVO.getMenuType()))ft.setMenuType(funcTreeVO.getMenuType());
		if(StringUtils.isNotBlank(funcTreeVO.get_parentId()))ft.setParentFuncCode(funcTreeVO.get_parentId());
		ft.setInsertUser(LoginUtil.getUserName(request));
		ft.setInsertDate(new Date());
		ft.setUpdateDate(new Date());
		ft.setUpdateUser(LoginUtil.getUserName(request));
		return ft;
	}
	
	public static FunctionTree convertToUpdateFunctionTree(FuncTreeVO funcTreeVO,HttpServletRequest request) {
		FunctionTree ft = new FunctionTree();
		ft.setFuncCode(funcTreeVO.getId());
		ft.setFuncName(funcTreeVO.getText());
		ft.setIcon(funcTreeVO.getIconCls());
		ft.setIsEnable(funcTreeVO.getIsEnable());
		ft.setMenu(funcTreeVO.getMenu());
		ft.setMenuType(funcTreeVO.getMenuType());
		ft.setParentFuncCode(funcTreeVO.get_parentId());
		ft.setUpdateDate(new Date());
		ft.setUpdateUser(LoginUtil.getUserName(request));
		return ft;
	}
}
