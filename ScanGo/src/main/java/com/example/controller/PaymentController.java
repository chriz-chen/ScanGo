package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dao.CartDAO;
import com.example.dao.OrderDAO;
import com.example.entity.Cart;
import com.example.entity.OrderItem;
import com.example.entity.Orders;
import com.example.entity.User;


@Controller
@RequestMapping
public class PaymentController {
	
	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDAO cartDao;
	
	@Autowired
	@Qualifier("orderDaoImpl")
	private OrderDAO orderDao;
	
	
	@GetMapping("/payment")
	public String showPayment(HttpSession session, Model model) {
		
		Integer discountTotalPrice = (Integer) session.getAttribute("discountTotalPrice");
		
		if (discountTotalPrice == null) {
			User user = (User) session.getAttribute("user");

		    Integer checkoutPrice = 0;
		    List<Cart> checkouts = cartDao.findCartsByUserId(user.getUserId());

		    for (Cart checkout : checkouts) {
		        checkout.getProduct().setPrice((checkout.getProduct().getPrice()) * (checkout.getProductQuantity()));
		        checkoutPrice += ((checkout.getProduct().getPrice()));
		    }
		    
		    model.addAttribute("discountTotalPrice", checkoutPrice);
			
	    }else {
	    	
	    	model.addAttribute("discountTotalPrice", discountTotalPrice);
	    }
		
		return "payment";
	}
	
	@PostMapping("addToOrder")
	public String addToOrder(HttpSession session, Model model) {
		//  先找到 user 登入者
		User user = (User)session.getAttribute("user");
		
		Integer checkoutPrice = 0;
		Orders orders = orderDao.addOrder(user.getUserId(), checkoutPrice);

		List<Cart> cart = cartDao.findCartsByUserId(user.getUserId());
		for(Cart carts : cart) {
			checkoutPrice += (carts.getProduct().getPrice() * carts.getProductQuantity());
			
			
			
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderId(orders.getOrderId());
			orderItem.setProductId(carts.getProductId());
			orderItem.setProductPrice(carts.getProduct().getPrice());
			orderItem.setItemQuantity(carts.getProductQuantity());
			orderItem.setItemPrice(carts.getProduct().getPrice() * carts.getProductQuantity());
			
			orderDao.addOrderItem(orderItem);
		}
		
		orderDao.updateOriginalTotalPrice(orders.getOrderId(), checkoutPrice);
		cartDao.cleanCartByUserId(user.getUserId());
		return "redirect:/";
	}

	
}
