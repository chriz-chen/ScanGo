package com.example.controller;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dao.CartDAO;
import com.example.entity.Cart;
import com.example.entity.User;

@Controller
@RequestMapping
public class CheckoutController {

	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDAO cartDao;
	
	@GetMapping("/checkout")
	public String checkoutPage(HttpSession session, Model model) {
		//  先找到 user 登入者
		User user = (User)session.getAttribute("user");
		
		Integer checkoutPrice = 0;
		List<Cart> checkouts = cartDao.findCartsByUserId(user.getUserId());
		
		checkouts.forEach(cartItem -> {
			byte[] picture = cartItem.getProduct().getPicture();
	        if (picture != null) {
	            // 將 BLOB 資料轉換為 base64 字串
	            String base64Image = Base64.getEncoder().encodeToString(picture);
	            cartItem.getProduct().setBase64Image(base64Image);
	        }
		});
		
		for(Cart checkout : checkouts) {
			checkout.getProduct().setPrice((checkout.getProduct().getPrice()) * (checkout.getProductQuantity()));
			checkoutPrice += ((checkout.getProduct().getPrice()));
		}
		model.addAttribute("checkouts", checkouts);
		model.addAttribute("checkoutPrice", checkoutPrice);
		return "checkout";
	}
}
