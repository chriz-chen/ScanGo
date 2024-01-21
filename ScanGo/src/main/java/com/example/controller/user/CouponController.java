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
@RequestMapping("/coupon")
public class CouponController {

	@GetMapping
	public String coupon() {
		return "coupon";
	}
	
	// 得到目前所有 session attribute names
	@GetMapping("/findAllSessionNames")
	@ResponseBody
	public String findAllSessionNames(HttpSession session) {
		StringBuilder names = new StringBuilder();
		// 目前系統中在使用的
		Enumeration<String> sessionAttrNames = session.getAttributeNames();
		while (sessionAttrNames.hasMoreElements()) {
			String name = (String) sessionAttrNames.nextElement();
			names.append(name + "\n");
		}
		return names.toString();
	}

}
