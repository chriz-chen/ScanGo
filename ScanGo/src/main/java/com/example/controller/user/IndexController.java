package com.example.controller.user;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.bean.LoginUser;

public class IndexController {
		// 登入首頁
		@GetMapping("/product-info")
		public String loginPage(@ModelAttribute LoginUser loginUser) {
			return "product-info";
		}
}
