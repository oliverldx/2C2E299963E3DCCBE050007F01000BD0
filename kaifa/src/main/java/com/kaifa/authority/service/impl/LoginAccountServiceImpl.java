/**
 * 
 */
package com.kaifa.authority.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kaifa.authority.mapper.LoginAccountMapper;
import com.kaifa.authority.pojo.LoginAccount;
import com.kaifa.authority.service.ILoginAccountService;
import com.kaifa.constant.PublicConstants;

/**
 * @author Administrator
 *
 */
@Service(ILoginAccountService.BEAN_ID)
public class LoginAccountServiceImpl implements ILoginAccountService {
	
	@Resource  
	private LoginAccountMapper loginAccountMapper;

	/* (non-Javadoc)
	 * @see cn.edu.schoolplatform.authority.service.ILoginAccountService#getLoginAccountByNameAndPwd(java.lang.String, java.lang.String)
	 */
	@Override
	public LoginAccount getLoginAccountByNameAndPwd(String accountName,
			String pwd) {
		
		return loginAccountMapper.selectByPrimaryKey(accountName);
	}

	@Override
	public boolean setUserMenuToSession(HttpServletRequest request,String userName) {
		if(request.getSession().getAttribute(PublicConstants.LONGIN_SESSION_NAME) == null) {
			request.getSession().setAttribute(PublicConstants.LONGIN_SESSION_NAME, userName);
		}
		/*if(request.getSession().getAttribute(SchoolPlatformConstant.SESSION_MENU) == null) {
			
		}*/
		
		return true;
	}
	
	

}
