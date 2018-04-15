package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.constants.Member;





public class SessionInterceptor extends HandlerInterceptorAdapter{
	
	private final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if ( request.getSession().getAttribute(Member.USER) == null ) {
			
			System.out.println("interceptor~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!");
			
			response.sendRedirect("/");
			
			return false;
		}
		
		return true;
	}
	

}
