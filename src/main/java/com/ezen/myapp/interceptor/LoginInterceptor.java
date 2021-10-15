package com.ezen.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public void postHandle(
			HttpServletRequest request,
			HttpServletResponse response, 
			Object handler,
			ModelAndView modelAndView
			) throws Exception {
		
		Object memberId = modelAndView.getModel().get("memberId");
		Object member_name = modelAndView.getModel().get("member_name");
			
		if (memberId != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberId);
			session.setAttribute("member_name", member_name);
		}		
	}
	
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response, 
			Object handler) {
		
		
		HttpSession session = request.getSession();
		if (session.getAttribute("memberId")  != null) {
			session.removeAttribute("memberId");
			session.removeAttribute("member_name");
			session.invalidate();
		}
		return true;
	}
	
	
	
}
