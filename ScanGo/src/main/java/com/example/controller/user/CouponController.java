package com.example.controller.user;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


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
