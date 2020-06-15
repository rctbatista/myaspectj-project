package com.rct.aspectj.myaspectjapp.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rct.aspectj.core.annotation.LogStart;
import com.rct.aspectj.myaspectjapp.service.SomeService;

@RestController
@RequestMapping(path = "/aspect")
public class MyAspectResource {
	
	@Autowired
	private SomeService service;

	@LogStart
	@GetMapping(path = "/sayhello/{name}")
	public ResponseEntity<String> teste(@PathVariable String name){
		return ResponseEntity.ok(service.sayHello(name));
	}
}
