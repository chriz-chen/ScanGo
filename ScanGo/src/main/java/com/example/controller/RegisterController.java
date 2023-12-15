package com.example.controller;



import java.beans.IntrospectionException;
import java.util.Optional;

import javax.enterprise.inject.New;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bean.RegisterUser;
import com.example.dao.User;
import com.example.dao.UserDAO;
import com.mchange.v2.beans.BeansUtils;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDAO userDAO;
	
	@GetMapping()
	public String registerPage(@ModelAttribute RegisterUser registerUser, Model model) {
		return "register";
	}
	
	@PostMapping()
	public String doRegister(@ModelAttribute @Valid RegisterUser registerUser, BindingResult result, Model model) throws IntrospectionException {
		
		if(result.hasErrors()) {
			return "register";
		}
		
		User user = new User();
		user.setFirstName(registerUser.getFirstName());
		user.setLastName(registerUser.getLastName());
		user.setEmail(registerUser.getEmail());
		user.setPassword(BCrypt.hashpw(registerUser.getPassword(), BCrypt.gensalt()));

		int rowCount = userDAO.save(user);
		
		if(rowCount == 0) {
			model.addAttribute("error","新增失敗，請通知管理員");
			return "register";
		}
		
		return "redirect:/";
	}
}
