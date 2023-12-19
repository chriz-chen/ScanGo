package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * http://localhost:8080/ServletToSpring/mvc/hello/spring
 */
@Controller
@RequestMapping("/hello")
public class HelloController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping("/")
	@ResponseBody
	public String spring() {
		logger.info("hello spring");
		return "Hello ! Spring!";
	}
}
