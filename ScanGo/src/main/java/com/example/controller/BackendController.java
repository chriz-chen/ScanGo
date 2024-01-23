package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dao.LevelDAO;
import com.example.dao.UserDAO;
import com.example.entity.Product;
import com.example.entity.User;

@Controller
@RequestMapping("/backend")
public class BackendController {

	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private LevelDAO levelDAO;
	
	
	
	// 顯示 UserBackend 頁面
	@GetMapping("/user")
	public String showUserBackend(Model model) {
		List<User> userList = userDAO.findAllUsers();
		model.addAttribute("userList", userList);
		
		return "backend-user";
	}
	
	
	
	
}
