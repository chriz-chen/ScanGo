package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dao.LevelDAO;
import com.example.dao.OrderDAO;
import com.example.dao.UserDAO;
import com.example.entity.Orders;
import com.example.entity.Product;
import com.example.entity.User;

@Controller
@RequestMapping("/backend")
public class BackendController {

	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private LevelDAO levelDAO;
	
	@Autowired
	private OrderDAO orderDao;
	
	
	
	// 顯示 Backend User頁面
	@GetMapping("/user")
	public String showUserBackend(Model model) {
		List<User> userList = userDAO.findAllUsers();
		model.addAttribute("userList", userList);
		
		return "backend_user";
	}
	
	@GetMapping("/historyorderByManager/{userId}")
	 public String historyorderBackendPage(@PathVariable("userId") Integer userId, Model model) {
	  
	  List<Orders> orders = orderDao.findOrderByUserId(userId);
	  model.addAttribute("orders", orders);
	  
	  return "historyorder";
	 }
	
	
}
