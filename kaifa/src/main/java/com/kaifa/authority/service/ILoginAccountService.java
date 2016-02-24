/**
 * 
 */
package com.kaifa.authority.service;

import javax.servlet.http.HttpServletRequest;

import com.kaifa.authority.pojo.LoginAccount;

/**
 * 登陆账号接口
 * @author leidexing
 */
public interface ILoginAccountService {

	public static final String BEAN_ID = "authority_loginService";
	
	public LoginAccount getLoginAccountByNameAndPwd(String accountName,String pwd);
	
	public boolean setUserMenuToSession(HttpServletRequest request,String userName);
}
