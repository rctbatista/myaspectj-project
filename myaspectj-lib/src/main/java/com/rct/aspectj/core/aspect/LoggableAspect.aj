package com.rct.aspectj.core.aspect;

import java.time.ZonedDateTime;

import org.springframework.web.bind.annotation.GetMapping;

import com.rct.aspectj.core.annotation.Loggable;

public aspect LoggableAspect perthis(atFirstLoggableAnnotation()) {

	private ZonedDateTime startedAt;

	private ZonedDateTime endedAt;

	pointcut atFirstLoggableAnnotation() : execution(* com.rct.aspectj..*(..)) && @annotation(GetMapping);

	pointcut loggableMethods() : execution(* com.rct.aspectj..*(..)) && @annotation(Loggable);

	before() : atFirstLoggableAnnotation() {

		startedAt = ZonedDateTime.now();

	}

	after() returning(Object obj) : atFirstLoggableAnnotation() {

		endedAt = ZonedDateTime.now();

		long execTime = endedAt.toInstant().toEpochMilli() - startedAt.toInstant().toEpochMilli();

		System.out.println("Execution time: " + execTime + "ms");

	}

	Object around() : loggableMethods() {
		
		Object obj = null;
		
		try {
			obj = proceed();
			System.out.println("Logged at " + thisJoinPoint.getTarget().getClass().toString() + "." + thisJoinPoint.getStaticPart().getSignature().getName() + "(" + thisJoinPoint.getSourceLocation().toString() + ")");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return obj; 
	}

}
