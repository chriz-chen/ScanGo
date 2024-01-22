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

//  處理使用者大頭照
//	private static final Path upPath = Paths.get("C:\\uploads\\avator");
//	static {
//		try {
//			Files.createDirectories(upPath);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private RegisterServiceImpl registerServiceImpl;

	@GetMapping()
	public String registerPage(@ModelAttribute RegisterUser registerUser, Model model) {
		return "register";
	}
	
	@PostMapping()
	public String doRegister(@ModelAttribute @Valid RegisterUser registerUser, BindingResult result, Model model) throws IntrospectionException, IOException {
		if(result.hasErrors()) {
			return "register";
		}

		RegisterStatus registerStatus = registerServiceImpl.register(registerUser);
		
		if(registerStatus == RegisterStatus.TWO_PASSWORD_ERROR) {
			result.rejectValue("confirmPassword", "error.confirmPassword", "兩次密碼不一致");
	        return "register";
		} else if(registerStatus == RegisterStatus.USER_ADD_FAILURE) {
			model.addAttribute("error","新增失敗，請通知管理員");
			return "register";
		}
		return "redirect:/";
	}
}
