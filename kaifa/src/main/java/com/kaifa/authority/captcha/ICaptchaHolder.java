package com.kaifa.authority.captcha;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 验证码保持/共享接口.
 * 
 * @author <a href="mailto:liji@foresee.com.cn">liji</a>
 */
public interface ICaptchaHolder {
	
	public static final String BEAN_ID = "sso_captchaHolder";

	void put(HttpServletRequest request,HttpServletResponse response, String code, String type);

	String get(HttpServletRequest request, String type);
}
