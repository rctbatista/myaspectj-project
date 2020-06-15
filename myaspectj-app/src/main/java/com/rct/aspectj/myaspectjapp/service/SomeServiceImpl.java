package com.rct.aspectj.myaspectjapp.service;

import java.util.Random;

import org.springframework.stereotype.Service;

import com.rct.aspectj.core.annotation.Loggable;

@Service
public class SomeServiceImpl implements SomeService {

	@Loggable
	@Override
	public String sayHello(String name) {
		
		try {
			long timeToSleep = new Random().nextInt(1000) + 1000;
			Thread.sleep(timeToSleep);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "Retorno do metodo: " + name;
	}

}
