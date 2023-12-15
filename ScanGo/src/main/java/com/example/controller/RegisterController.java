package com.example.controller;



import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bean.RegisterUser;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@GetMapping()
	public String registerPage(@ModelAttribute RegisterUser registerUser, Model model) {
		
		registerUser.setFirstName("阿");
		registerUser.setLastName("偉特");
		
		return "register";
	}
	
	@PostMapping()
	public String doRegister(@ModelAttribute @Valid RegisterUser registerUser, BindingResult result) {
		System.out.println(result.getAllErrors());
		if(result.hasErrors()) {
			return "register";
		}
		
		return "redirect:/";
	}
}
