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
import com.kaifa.authority.pojo.User;
import com.kaifa.authority.pojo.UserRole;
import com.kaifa.authority.service.IUserRoleService;
import com.kaifa.authority.service.IUserService;
import com.kaifa.authority.util.LoginUtil;
import com.kaifa.pojo.Page;

@Controller  
@RequestMapping("/user")  
public class UserController extends AuthorityController{   
    
	@Resource(name=IUserService.BEAN_ID) 
	private IUserService userService;  
	@Resource(name=IUserRoleService.BEAN_ID) 
	private IUserRoleService userRoleService;  
	
	@RequestMapping(value="/user")
	public String user(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return "authority/user";
	}
	
	
	@RequestMapping(value="/updateUser")
	public @ResponseBody String updateUser(HttpServletRequest request, HttpServletResponse response,String userJsonStr){
		User user = JSON.toJavaObject(JSON.parseObject(userJsonStr), User.class);
		if(userService.updateByPrimaryKeySelective(user) > 0) {
			return "{\"success\":true}";
		}else {
			return "{\"success\":false}";
		}
	}
	
	@RequestMapping(value="/loadUser")
	public @ResponseBody String loadUser(HttpServletRequest request, HttpServletResponse response,String funcTreeJsonStr){
		User user = new User();
		String userName = request.getParameter("userName");
    	String page = request.getParameter("page");
    	String rows = request.getParameter("rows");
    	Integer pageNow =Integer.parseInt(page);
    	Integer pageSize =Integer.parseInt(rows);
    	pageNow =(pageNow-1)*pageSize;
    	pageSize = pageNow+pageSize;
    	user.setPageNow(pageNow);
    	user.setPageSize(pageSize);
    	user.setUserName(userName);
		/*FuncTreeVO funcTreeVO = JSON.toJavaObject(JSON.parseObject(funcTreeJsonStr), FuncTreeVO.class);
		if(funcTreeService.updateByPrimaryKeySelective(FuncTreeUtil.convertToUpdateFunctionTree(funcTreeVO, request))>0) {
			return "{\"success\":true}";
		}else {
			return "{\"success\":false}";
		}*/
    	List<User> userList = this.userService.queryUserPage(user);
    	if (userList != null && !userList.isEmpty()) {
            Page result=new Page();
            result.setRows(userList);
            result.setTotal(100);
            return JSON.toJSONString(result);
        }
		return null;
	}
	
	@RequestMapping(value="/saveUser")
	public @ResponseBody String saveUser(HttpServletRequest request, HttpServletResponse response,@ModelAttribute User user){
		if(StringUtils.isBlank(user.getUserCode())) {
			user.setUserCode(UUID.randomUUID().toString().replaceAll("-", ""));
			user.setInsertDate(new Date());
			user.setInsertUser(LoginUtil.getUserName(request));
			user.setUpdateDate(new Date());
			user.setUpdateUser(LoginUtil.getUserName(request));
			if(this.userService.insertSelective(user) > 0) {
				return "{\"success\":true}";
			}else {
				return "{\"success\":false}";
			}
		}
		return "";
	}
	

	@RequestMapping(value="/deleteUser")
	public @ResponseBody String deleteUser(HttpServletRequest request, HttpServletResponse response,String userArrayStr){
		JSONArray jsonArray = JSONArray.parseArray(userArrayStr);
		for(Object obj : jsonArray) {
			String id = (String)obj;
			if(userService.deleteByPrimaryKey(id) == 0 ){
				return "{\"success\":false}";
			}
		}
		return "{\"success\":true}";
	}
	
	@RequestMapping(value="/saveUserRole")
	public @ResponseBody String saveUserFunctree(HttpServletRequest request, HttpServletResponse response,String userRoleStr){
		JSONObject jsonObj = JSON.parseObject(userRoleStr);
		String userCode = jsonObj.getString("userCode");
		JSONArray jsonArray = jsonObj.getJSONArray("roleCodes");
		for(Object obj : jsonArray) {
			String roleCode = (String)obj;
			UserRole userRole = new UserRole();
			userRole.setUuid(UUID.randomUUID().toString().replaceAll("-", ""));
			userRole.setRoleCode(roleCode);
			userRole.setUserCode(userCode);
			System.out.println(JSON.toJSONString(userRole));
			if(this.userRoleService.insertSelective(userRole) == 0) {
				return "{\"success\":false}";
			}
		}
		return "{\"success\":true}";
	}
	
	
 }  