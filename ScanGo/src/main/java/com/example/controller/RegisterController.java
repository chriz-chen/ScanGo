package com.example.controller;

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
	@Qualifier("userDaoImpl")
	private UserDAO userDAO;

	@GetMapping()
	public String registerPage(@ModelAttribute RegisterUser registerUser, Model model) {
		return "register";
	}
	
	@PostMapping()
	public String doRegister(@ModelAttribute @Valid RegisterUser registerUser, BindingResult result, Model model) throws IntrospectionException, IOException {
		
		if(result.hasErrors()) {
			return "register";
		}
		
// 		處理大頭照
//		MultipartFile multipartFile = registerUser.getAvator();
//		String avator = registerUser.getEmail()+"-"+multipartFile.getOriginalFilename();
//		Path picPath = upPath.resolve(avator);
//		Files.copy(multipartFile.getInputStream(), picPath, StandardCopyOption.REPLACE_EXISTING);
		
		// 新增用戶資訊至資料庫
		User user = new User();
		user.setUsername(registerUser.getUsername());
		user.setPassword(BCrypt.hashpw(registerUser.getPassword(), BCrypt.gensalt()));
		user.setEmail(registerUser.getEmail());
		user.setPhone(registerUser.getPhone());
		user.setBirthday(registerUser.getBirthday());
		//user.setAvator(avator);

		int rowCount = userDAO.addUser(user);
		
		if(rowCount == 0) {
			model.addAttribute("error","新增失敗，請通知管理員");
			return "register";
		}
		
		return "redirect:/";
	}
}
