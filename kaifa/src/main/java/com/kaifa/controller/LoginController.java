package com.kaifa.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaifa.authority.captcha.ICaptchaHolder;
import com.kaifa.authority.captcha.AuthorityConstant.CaptchaType;
import com.kaifa.authority.pojo.LoginAccount;
import com.kaifa.authority.service.ILoginAccountService;
import com.kaifa.constant.PublicConstants;

@Controller  
@RequestMapping("/home")  
public class LoginController {  
    
	@Resource  
    private ILoginAccountService loginAccountService;  
	@Autowired
	private ICaptchaHolder captchaHolder;
	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("UTF-8");
		String captcha = request.getParameter("captcha");
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		String loginPage = "home/login2";
		if(StringUtils.isBlank(loginName) && StringUtils.isBlank(password) && StringUtils.isBlank(captcha)) {
			return loginPage;
		}
		if(StringUtils.isBlank(captcha) || !captcha.equals(captchaHolder.get(request, CaptchaType.NORMAL.toString()))){
			request.setAttribute("status", "fail");
			request.setAttribute("statusMsg", "验证码错误");
			return loginPage;
		}
		LoginAccount loginAccount = loginAccountService.getLoginAccountByNameAndPwd(loginName, password);
		if(loginAccount == null) {
			request.setAttribute("status", "fail");
			request.setAttribute("statusMsg", "找不到该用户");
			return loginPage;
		}
		if(!loginAccount.getPassword().equals(password)) {
			request.setAttribute("status", "fail");
			request.setAttribute("statusMsg", "用户密码错误");
			return loginPage;
		}
		loginAccountService.setUserMenuToSession(request, loginName);
		response.sendRedirect("jump.do");
		return "home/jump";
	}
	
	
	
	@RequestMapping(value="/jump")
	public String jump1(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return "home/jump";
	}
	
	@RequestMapping(value="/jumpAjax")
	public @ResponseBody Map<String,Object> jump(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("url", "index.do");
		return ret;
	}
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request, HttpServletResponse response){
		return "menu/menu";
	}
	

	@RequestMapping(value="/checkIsLogin",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> checkIsLogin(HttpServletRequest request){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("isLogin", request.getSession().getAttribute(PublicConstants.LONGIN_SESSION_NAME)!=null);
		return ret;
	}
	
	
 }  