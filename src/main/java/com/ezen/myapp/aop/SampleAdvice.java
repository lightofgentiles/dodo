package com.ezen.myapp.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAdvice {
	private static final Logger logger =LoggerFactory.getLogger(SampleAdvice.class);

	@Before("execution(* com.ezen.myapp.service.BoardService*.*(..))")//메소들 접근하게 전에 로그찍어본다.
	public void startLog(){		
		
		System.out.println("---------1---------");
		logger.info("---------------2----------");
		logger.info("----------------3---------");
	}
	
}
