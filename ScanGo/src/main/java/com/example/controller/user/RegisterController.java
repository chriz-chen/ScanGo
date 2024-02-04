package com.example.controller.user;

import java.beans.IntrospectionException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

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
import org.springframework.web.multipart.MultipartFile;

import com.example.bean.RegisterUser;
import com.example.dao.UserDAO;
import com.example.entity.User;
import com.example.service.RegisterServiceImpl;
import com.example.service.RegisterStatus;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private RegisterServiceImpl registerServiceImpl;

	// GET請求處理註冊頁面
	@GetMapping()
	public String registerPage(@ModelAttribute RegisterUser registerUser, Model model) {
		return "register";
	}
	
	// POST請求處理註冊操作
	@PostMapping()
	public String doRegister(@ModelAttribute @Valid RegisterUser registerUser, BindingResult result, Model model) throws IntrospectionException, IOException {
		// 如果表單驗證有誤，返回註冊頁面
		if(result.hasErrors()) {
			return "register";
		}

		// 呼叫註冊服務進行註冊操作
		RegisterStatus registerStatus = registerServiceImpl.register(registerUser);
		
		// 如果兩次密碼不一致，返回註冊頁面並顯示錯誤訊息
		if(registerStatus == RegisterStatus.TWO_PASSWORD_ERROR) {
			result.rejectValue("confirmPassword", "error.confirmPassword", "兩次密碼不一致");
	        return "register";
		} 
		// 如果新增使用者失敗，返回註冊頁面並顯示錯誤訊息
		else if(registerStatus == RegisterStatus.USER_ADD_FAILURE) {
			model.addAttribute("error","新增失敗，請通知管理員");
			return "register";
		}
		// 註冊成功，重導到登錄頁面
		return "redirect:/mvc/login";
	}
}
