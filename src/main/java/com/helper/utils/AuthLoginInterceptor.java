package com.helper.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthLoginInterceptor implements HandlerInterceptor{
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		System.out.println("로그인 검사 인터셉터 도착");
		// 사용자의 로그인 여부 검사
		if(request.getSession().getAttribute("loginSession") == null) {
			// 사용자 로그인이 안되어있음.
			System.out.println("로그인 안됨");
			// 로그인이 안되어있으면 /로 redirect 시켜버릴 것 
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
}
