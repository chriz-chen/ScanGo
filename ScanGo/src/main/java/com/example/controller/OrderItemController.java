package com.example.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dao.OrderDAO;
import com.example.entity.OrderItem;
import com.example.entity.Orders;

@Controller
@RequestMapping
public class OrderItemController {

	@Autowired
	@Qualifier("orderDaoImpl")
	private OrderDAO orderDao;
	
	
	@GetMapping("/showOrderItem/{orderId}")
	public String orderItemPage(@PathVariable("orderId") Integer orderId,
			    				Model model) {
		Orders orders = orderDao.findOrderByOrderId(orderId);
		List<OrderItem> orderItems = orderDao.findOrderItemByOrderId(orderId);
		
		model.addAttribute("orders", orders);
		model.addAttribute("orderItems", orderItems);
		
		return "orderitem";
	}
}
