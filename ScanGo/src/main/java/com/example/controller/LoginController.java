package com.example.controller;

import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bean.*;
import com.example.dao.UserDAO;
import com.example.entity.User;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDAO userDAO;
	
	// 登入首頁
	@GetMapping()
	public String loginPage(@ModelAttribute LoginUser loginUser) {
		return "login";
	}
	
	// 前台登入處理
	@PostMapping()
	public String login(@ModelAttribute @Valid LoginUser loginUser, BindingResult result, Model model,HttpSession session) {
		
		if(result.hasErrors()) {
			return "login";
		}
		
		Optional<User> optUser = userDAO.findUserByUsername(loginUser.getUsername());
		if(!optUser.isPresent() ||  ! BCrypt.checkpw(loginUser.getPassword(),optUser.get().getPassword())) {
			model.addAttribute("error", "帳號或密碼錯誤");
			return "login";
		}
		
		User user = optUser.get();
		session.setMaxInactiveInterval(60 * 15); // 15分鐘：如果在指定的一段時間內，沒有任何的請求進來，session會失效。
		session.setAttribute("isLogin", true);
		session.setAttribute("user", user);
		session.setAttribute("username", user.getUsername());
		session.setAttribute("userId", user.getUserId());
		return "redirect:/";
	}
}
