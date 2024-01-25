package com.example.controller.user;


import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * /ScanGo/mvc/coupon
 */
@Controller
@RequestMapping
public class CouponController {

	@GetMapping("/coupon")
	public String coupon() {
		
		
		
		return "coupon";
	}
}
