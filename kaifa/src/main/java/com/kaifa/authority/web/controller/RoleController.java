package com.kaifa.authority.web.controller;

import java.io.IOException;
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
import com.alibaba.fastjson.JSONObject;
import com.kaifa.authority.pojo.Role;
import com.kaifa.authority.pojo.RoleFunctionTree;
import com.kaifa.authority.service.IRoleFuncTreeService;
import com.kaifa.authority.service.IRoleService;
import com.kaifa.authority.util.LoginUtil;
import com.kaifa.pojo.Page;

@Controller  
@RequestMapping("/role")  
public class RoleController extends AuthorityController{   
    
	@Resource(name=IRoleService.BEAN_ID) 
    private IRoleService roleService;  
	@Resource(name=IRoleFuncTreeService.BEAN_ID) 
	private IRoleFuncTreeService roleFuncTreeService;  
	
	@RequestMapping(value="/role")
	public String role(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return "authority/role";
	}
	
	
	@RequestMapping(value="/updateRole")
	public @ResponseBody String updateRole(HttpServletRequest request, HttpServletResponse response,String roleJsonStr){
		Role role = JSON.toJavaObject(JSON.parseObject(roleJsonStr), Role.class);
		role.setUpdateUser(LoginUtil.getUserName(request));
		role.setUpdateDate(new Date());
		if(this.roleService.updateByPrimaryKeySelective(role) > 0) {
			return "{\"success\":true}";
		}else {
			return "{\"success\":false}";
		}
	}
	
	@RequestMapping(value="/loadRole")
	public @ResponseBody String loadRole(HttpServletRequest request, HttpServletResponse response,String funcTreeJsonStr){
		Role role = new Role();
		String roleName = request.getParameter("roleName");
    	String page = request.getParameter("page");
    	String rows = request.getParameter("rows");
    	Integer pageNow =Integer.parseInt(page);
    	Integer pageSize =Integer.parseInt(rows);
    	pageNow =(pageNow-1)*pageSize;
    	pageSize = pageNow+pageSize;
    	role.setPageNow(pageNow);
    	role.setPageSize(pageSize);
    	role.setRoleName(roleName);
		/*FuncTreeVO funcTreeVO = JSON.toJavaObject(JSON.parseObject(funcTreeJsonStr), FuncTreeVO.class);
		if(funcTreeService.updateByPrimaryKeySelective(FuncTreeUtil.convertToUpdateFunctionTree(funcTreeVO, request))>0) {
			return "{\"success\":true}";
		}else {
			return "{\"success\":false}";
		}*/
    	List<Role> roleList = this.roleService.queryRolePage(role);
    	if (roleList != null && !roleList.isEmpty()) {
            Page result=new Page();
            result.setRows(roleList);
            result.setTotal(100);
            return JSON.toJSONString(result);
        }
		return null;
	}
	
	@RequestMapping(value="/saveRole")
	public @ResponseBody String saveRole(HttpServletRequest request, HttpServletResponse response,@ModelAttribute Role role){
		if(StringUtils.isBlank(role.getRoleCode())) {
			role.setRoleCode(UUID.randomUUID().toString().replaceAll("-", ""));
			role.setInsertDate(new Date());
			role.setInsertUser(LoginUtil.getUserName(request));
			role.setUpdateDate(new Date());
			role.setUpdateUser(LoginUtil.getUserName(request));
			if(this.roleService.insertSelective(role) > 0) {
				return "{\"success\":true}";
			}else {
				return "{\"success\":false}";
			}
		}
		return "";
	}
	

	@RequestMapping(value="/deleteRole")
	public @ResponseBody String deleteRole(HttpServletRequest request, HttpServletResponse response,String roleArrayStr){
		JSONArray jsonArray = JSONArray.parseArray(roleArrayStr);
		for(Object obj : jsonArray) {
			String id = (String)obj;
			if(roleService.deleteByPrimaryKey(id) == 0 ){
				return "{\"success\":false}";
			}
		}
		return "{\"success\":true}";
	}
	
	@RequestMapping(value="/saveRoleFunctree")
	public @ResponseBody String saveRoleFunctree(HttpServletRequest request, HttpServletResponse response,String roleFunctreeStr){
		JSONObject jsonObj = JSON.parseObject(roleFunctreeStr);
		String roleCode = jsonObj.getString("roleCode");
		JSONArray jsonArray = jsonObj.getJSONArray("funcTreeCodes");
		for(Object obj : jsonArray) {
			String funcCode = (String)obj;
			RoleFunctionTree rft = new RoleFunctionTree();
			rft.setUuid(UUID.randomUUID().toString().replaceAll("-", ""));
			rft.setRoleCode(roleCode);
			rft.setFuncCode(funcCode);
			System.out.println(JSON.toJSONString(rft));
			if(this.roleFuncTreeService.insertSelective(rft) == 0) {
				return "{\"success\":false}";
			}
		}
		return "{\"success\":true}";
	}
	
	
 }  