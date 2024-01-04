package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dao.CartDAO;

@Controller
@RequestMapping
public class CartController {

	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDAO cartDao;
	
	@GetMapping("/cart{ userId }")
	public String showCart() {
		
		return "cart";
	}
	
	@GetMapping("/checkout")
	public String showCheckout() {
		return "checkout";
	}
	
	@GetMapping("/payment")
	public String showPayment() {
		return "payment";
	}
}
