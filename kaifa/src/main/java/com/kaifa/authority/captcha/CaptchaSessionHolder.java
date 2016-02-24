package com.kaifa.authority.captcha;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.kaifa.authority.service.ILoginAccountService;

/**
 * 
 * <pre>
 * 验证码以及随机数的session保存实现。
 * </pre>
 * 
 * @author maipeitian<maipeitian@foresee.com.cn>
 * @version 1.00.00
 * 
 *          <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:2012-3-20     修改内容:
 * </pre>
 */
@Service(ICaptchaHolder.BEAN_ID)
public class CaptchaSessionHolder implements ICaptchaHolder {

	private static final Log log = LogFactory.getLog(CaptchaSessionHolder.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * gov.chinatax.gt3.wwwsso.adaptors.gt3nf.ICaptchaHolder#put(javax.servlet
	 * .http.HttpServletRequest)
	 */
	@Override
	public void put(HttpServletRequest request,HttpServletResponse response, final String code, final String type) {
		request.getSession().setAttribute(type, code);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * gov.chinatax.gt3.wwwsso.adaptors.gt3nf.ICaptchaHolder#get(javax.servlet
	 * .http.HttpServletRequest)
	 */
	@Override
	public String get(HttpServletRequest request, final String type) {
		String returnVal = (String)request.getSession().getAttribute(type);
		request.getSession().removeAttribute(type);
		return returnVal;
	}
}
