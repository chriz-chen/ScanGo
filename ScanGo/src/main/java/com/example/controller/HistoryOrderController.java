package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dao.OrderDAO;
import com.example.entity.Orders;
import com.example.entity.User;

@Controller
@RequestMapping
public class HistoryOrderController {
	
	@Autowired
	@Qualifier("orderDaoImpl")
	private OrderDAO orderDao;
	

	@GetMapping("/historyorder")
	public String historyorderPage(HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		
		List<Orders> orders = orderDao.findOrderByUserId(user.getUserId());
		model.addAttribute("orders", orders);
		
		return "historyorder";
	}
	
}
