package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.CartDAO;
import com.example.entity.Cart;

@Controller
@RequestMapping
public class CartController {

	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDAO cartDao;
	
	@GetMapping("/cart")
	public String cartPage() {
		
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
	
	@GetMapping("/product")
	public String showProduct() {
		return "product";
	}
	
	@PostMapping("/showCart")
    public String showCart(@RequestParam Integer userId, Model model) {
        List<Cart> carts = cartDao.findCartsByUserId(userId);
        model.addAttribute("carts", carts);
        return "cart";
    }
}
