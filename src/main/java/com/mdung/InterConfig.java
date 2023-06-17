package com.mdung;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.mdung.interceptor.LoggerInterceptor;
import com.mdung.interceptor.SecurityInterceptor;

@Configuration
public class InterConfig implements WebMvcConfigurer {

	@Autowired
	LoggerInterceptor interceptor;

	@Autowired
	SecurityInterceptor auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor).addPathPatterns("/**").excludePathPatterns("/assets/**");
		registry.addInterceptor(auth).addPathPatterns("/product-management", "/account-management", "/cartManagement");
	}
}