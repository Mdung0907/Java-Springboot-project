package com.mdung.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.mdung.entities.Account;

@Service
public class SecurityInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("accountlogin") == null || ((Account) session.getAttribute("accountlogin")).getRole() == false) {
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		return true;
	}
}
