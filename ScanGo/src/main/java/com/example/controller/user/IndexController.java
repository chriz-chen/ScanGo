package com.example.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bean.LoginUser;

@Controller
@RequestMapping("/ScanGo")
public class IndexController {
	
		// 登入首頁
		@GetMapping("/index")
		public String homePage() {
			return "index";
		}
	
	
		
		@GetMapping("/product-info")
		public String loginPage(@ModelAttribute LoginUser loginUser) {
			return "product-info";
		}
}
