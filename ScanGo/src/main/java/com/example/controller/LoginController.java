package com.example.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bean.LoginUser;

@Controller
@RequestMapping("/login")
public class LoginController {

	@GetMapping()
	public String loginPage(@ModelAttribute LoginUser loginUser) {
		return "login";
	}
	
	@PostMapping()
	public String login(@ModelAttribute @Valid LoginUser loginUser, BindingResult result) {
		
		if(result.hasErrors()) {
			return "login";
		}
		
		return "login";
	}
}
