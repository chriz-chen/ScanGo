package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.CartDAO;
import com.example.entity.Cart;
import com.example.entity.Product;
import com.example.entity.User;


@Controller
@RequestMapping
public class CartController {

	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDAO cartDao;
	
	@GetMapping("/cart")
	public String cartPage(HttpSession session, Model model) {
		//  先找到 user 登入者
		User user = (User)session.getAttribute("user");
			
		List<Cart> carts = cartDao.findCartsByUserId(user.getUserId());
		model.addAttribute("carts", carts);
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
	
	@GetMapping("/searchProduct/{categoryId}")
	public String showProduct(@PathVariable("categoryId") Integer categoryId,
							  Model model) {
		List<Product> products = cartDao.findProductsByCategoryId(categoryId);
		model.addAttribute("products", products);
		return "product";
	}
	
	@PostMapping("/addCartByPost")
	@ResponseBody
	public String addToCart(@RequestParam("productId") Integer productId,
							@RequestParam("productQuantity") Integer productQuantity,
							HttpSession session, Model model,
							HttpServletRequest request) {
		// 先找到 user 登入者
		User user = (User)session.getAttribute("user");
		
		// 建立購物項目
		Cart cart = new Cart();
		cart.setUserId(user.getUserId());
		cart.setProductId(productId);
		cart.setProductQuantity(productQuantity);
			
		// 新增購物車項目
		cartDao.addCart(cart);
		
		//String referer = request.getHeader("Referer");
		return "OK";
	}
	
	
	
}



