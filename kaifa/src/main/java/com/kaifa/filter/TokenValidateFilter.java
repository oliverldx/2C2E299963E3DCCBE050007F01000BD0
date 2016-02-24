package com.kaifa.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.kaifa.constant.PublicConstants;

public class TokenValidateFilter implements Filter  {
	
	public static final Log log = LogFactory.getLog(TokenValidateFilter.class);
	
	public FilterConfig config;


	public void destroy() {
	}

	public void doFilter(final ServletRequest servletRequest, final ServletResponse servletResponse,
			final FilterChain filterChain) throws IOException, ServletException {
		final HttpServletRequest request = (HttpServletRequest) servletRequest;
		final HttpServletResponse response = (HttpServletResponse) servletResponse;
		String loginName = (String)request.getSession().getAttribute(PublicConstants.LONGIN_SESSION_NAME);
		String loginUrl = config.getInitParameter("loginUrl");
		String excludeUrl = config.getInitParameter("excludeUrl");
		String servletPath = request.getServletPath();
		if(StringUtils.isNotBlank(excludeUrl)) {
			String[] excludeUrls = excludeUrl.split(",", 0);
			for(String s : excludeUrls) {
				if(s.equals(servletPath)) {
					filterChain.doFilter(servletRequest, servletResponse);
					return;
				}
			}
		}
		if("/home/login.do".equals(servletPath) || "/home/loginValidate.do".equals(servletPath)) {
			filterChain.doFilter(servletRequest, servletResponse);
			return;
		}
		if(StringUtils.isBlank(loginName)) {
			response.sendRedirect(loginUrl);
			return;
		}
		filterChain.doFilter(servletRequest, servletResponse);
		return;
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
	}

	
}
