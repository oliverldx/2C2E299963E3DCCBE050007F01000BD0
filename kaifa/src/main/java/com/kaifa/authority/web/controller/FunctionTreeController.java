package com.kaifa.authority.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.kaifa.authority.pojo.FunctionTree;
import com.kaifa.authority.service.IFuncTreeService;
import com.kaifa.authority.util.FuncTreeUtil;
import com.kaifa.authority.util.LoginUtil;
import com.kaifa.authority.vo.FuncTreeVO;

@Controller  
@RequestMapping("/functree")  
public class FunctionTreeController extends AuthorityController{   
    
	@Resource(name=IFuncTreeService.BEAN_ID) 
    private IFuncTreeService funcTreeService;  
	
	@RequestMapping(value="/functree")
	public String functree(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return "authority/functree";
	}
	
	@RequestMapping(value="/getFuncTreeChildren")
	public @ResponseBody String getFuncTreeChildren(HttpServletRequest request, HttpServletResponse response){
		String parentFuncCode = request.getParameter("id");
		FunctionTree functionTree = new FunctionTree();
		functionTree.setParentFuncCode(parentFuncCode);
		List<FunctionTree> ftList = funcTreeService.getFuncTreeChildren(functionTree);
		List ftvoList = new ArrayList();
		for(FunctionTree ft:ftList) {
			FuncTreeVO ftvo = new FuncTreeVO();
			ftvo.convertFunctionTree(ftvo, ft);
			functionTree.setParentFuncCode(ft.getFuncCode());
			List<FunctionTree> child = funcTreeService.getFuncTreeChildren(functionTree);
			if(child != null && !child.isEmpty()) {
				ftvo.setState("closed");
			}
			ftvoList.add(ftvo);
		}
		
		return JSON.toJSONString(ftvoList);
	}
	
	@RequestMapping(value="/updateFuncTree")
	public @ResponseBody String updateFuncTree(HttpServletRequest request, HttpServletResponse response,String funcTreeJsonStr){
		FuncTreeVO funcTreeVO = JSON.toJavaObject(JSON.parseObject(funcTreeJsonStr), FuncTreeVO.class);
		if(funcTreeService.updateByPrimaryKeySelective(FuncTreeUtil.convertToUpdateFunctionTree(funcTreeVO, request))>0) {
			return "{\"success\":true}";
		}else {
			return "{\"success\":false}";
		}
	}
	
	@RequestMapping(value="/saveFuncTree")
	public @ResponseBody String saveFuncTree(HttpServletRequest request, HttpServletResponse response,@ModelAttribute FunctionTree functionTree){
		if(StringUtils.isBlank(functionTree.getFuncCode())) {
			functionTree.setFuncCode(UUID.randomUUID().toString().replaceAll("-", ""));
			functionTree.setInsertDate(new Date());
			functionTree.setInsertUser(LoginUtil.getUserName(request));
			functionTree.setUpdateDate(new Date());
			functionTree.setUpdateUser(LoginUtil.getUserName(request));
			if(this.funcTreeService.insertSelective(functionTree) > 0) {
				return "{\"success\":true}";
			}else {
				return "{\"success\":false}";
			}
		}
		return "";
	}
	

	@RequestMapping(value="/deleteFuncTree")
	public @ResponseBody String deleteFuncTree(HttpServletRequest request, HttpServletResponse response,String funcTreeJsonArrayStr){
		JSONArray jsonArray = JSONArray.parseArray(funcTreeJsonArrayStr);
		for(Object obj : jsonArray) {
			String id = (String)obj;
			if(funcTreeService.deleteByPrimaryKey(id) == 0 ){
				return "{\"success\":false}";
			}
		}
		return "{\"success\":true}";
	}
	
	
 }  