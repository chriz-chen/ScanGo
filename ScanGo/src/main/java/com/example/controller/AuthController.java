package com.example.controller;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bean.LoginUser;
import com.example.dao.UserDAO;
import com.example.entity.User;

public class AuthController {
	
	@Autowired
	private UserDAO userDAO;
	
	/**
	 * POST 請求，忘記密碼發送電子信件。
	 * 
	 * @param email  使用者提供的電子信箱
	 * @param model Spring MVC 模型
	 * @return 成功：發送電子信件；失敗：錯誤頁面
	 * @throws NoSuchAlgorithmException 
	 * @throws InvalidKeyException 
	 */
	@PostMapping("/password")
	public String forgottenPassword(@RequestParam("email") String email, HttpSession session, Model model) 
									throws InvalidKeyException, NoSuchAlgorithmException {
		// 根據電子信箱查詢使用者
		Optional<User> userOpt = userDAO.getUserByEmail(email);
		if (userOpt.isPresent()) {
			// 取得 TOTP 密碼 (使用 HMACSHA256 作為加密算法)
			String totp = userDAO.getTotp();
			// 寄送 TOTP 驗證信件
			System.out.println("controller(/password) totp: " + totp);
			userDAO.sentEamil(email, totp);
			session.setAttribute("totp", totp);
			session.setAttribute("email", email);
			return "redirect:/mvc/auth/password/verifyAndReset?email=" + email;
		}
		model.addAttribute("message", "查無此信箱");
		model.addAttribute("togobtn", "返回登入");
		model.addAttribute("togourl", "/auth/login" );
		return "dialogFail";
	}
	
	@GetMapping("/password/verifyAndReset")
	public String verifyAndResetPage(@RequestParam("email") String email,
									 HttpSession session) throws InvalidKeyException, NoSuchAlgorithmException {
		String totp = (String) session.getAttribute("totp");
		session.setAttribute("email", email);
		System.out.println("controller(Get/verifyAndReset) totp: " + totp);
		return "frontend/verifyAndReset";
	}
	
	@PostMapping("/password/verifyAndReset")
	public String verifyAndReset(@RequestParam("totp")String totp,
								 @RequestParam("password")String password,
								 @RequestParam("confirmPassword")String confirmPassword,
								 HttpSession session, Model model) {
		
		String sessionTotp = (String) session.getAttribute("totp");
		System.out.println("totp: " + totp);
		System.out.println("(Post/verifyAndReset) sessionTotp: " + sessionTotp);
		
		// 比對 TOTP 驗證碼
        if (!totp.equals(sessionTotp)) {
        	model.addAttribute("message", "驗證碼錯誤");
    		model.addAttribute("togobtn", "返回登入頁面");
    		model.addAttribute("togourl", "/auth/login" );
            return "dialogFail";
        }
		
		// 比對兩次密碼是否相同
        if (!password.equals(confirmPassword)) {
        	model.addAttribute("message", "兩次新密碼不一致");
    		model.addAttribute("togobtn", "返回登入頁面");
    		model.addAttribute("togourl", "/auth/login" );
            return "dialogFail";
        }
        
		String email = (String) session.getAttribute("email");
		User user = userDAO.getUserByEmail(email).get();
        
        // 將新密碼進行加密
	    String encryptedNewPassword = BCrypt.hashpw(password, BCrypt.gensalt());
	    // 進行密碼變更
	    user.setPassword(encryptedNewPassword);
	    userDAO.updateUserPassword(user.getUserId(), encryptedNewPassword);
        
        System.out.println("update User password sucess!");
		model.addAttribute("message", "密碼修改成功");
		model.addAttribute("togobtn", "請重新登入");
		model.addAttribute("togourl", "/auth/login");
		
		//return "dialog";
		return "redirect:/logout";
	}

}
