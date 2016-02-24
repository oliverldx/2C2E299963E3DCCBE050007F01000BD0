package com.kaifa.authority.util;

import javax.servlet.http.HttpServletRequest;

import com.kaifa.constant.PublicConstants;

/**
 * 登录工具类
 * @author leidexiang
 *
 */
public class LoginUtil {

	public static String getUserName(HttpServletRequest request) {
		return (String)request.getSession().getAttribute(PublicConstants.LONGIN_SESSION_NAME);
	}
	
}
