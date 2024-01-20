package com.example.controller;

import java.util.Base64;
import java.util.Enumeration;
import java.util.List;
import java.util.Optional;

import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bean.ChangePassword;
import com.example.bean.LoginUser;
import com.example.dao.UserDAO;
import com.example.entity.User;

/**
 * /ScanGo/mvc/member
 */
@Controller
@RequestMapping
public class MemberController {
	
	@Autowired
	private UserDAO userDAO;

	@GetMapping("/member")
	public String member() {
		return "member";
	}
	
	/**
     * GET 請求，顯示重設密碼頁面。
     * @return resetPassword 頁面
     */
	@GetMapping("/password")
	public String resetPasswordPage() {
		return "./resetPassword";
	}

	// 密碼變更
	@PostMapping("/member/change_password")
	public String resetPassword(//@ModelAttribute @Valid ChangePassword changePassword,
								 //BindingResult result,
								 @RequestParam("oldPassword") String oldPassword,
	                             @RequestParam("newPasswords") List<String> newPasswords,
	                             HttpSession session,
	                             Model model) {

	    // 從 Session 中獲取當前登入用戶的資訊
	    User user = (User) session.getAttribute("user");

	    // 從資料庫中查詢使用者資料
	    Optional<User> optUser = userDAO.findUserByUsername(user.getUsername());

	    // 如果使用者不存在或密碼錯誤，返回登入頁面
	    if (!BCrypt.checkpw(oldPassword, optUser.get().getPassword())) {
	        model.addAttribute("errorMessage", "原密碼錯誤");
	        return "member";
	    }

	    // 檢查新密碼是否一致
	    if (!newPasswords.get(0).equals(newPasswords.get(1))) {
	        model.addAttribute("errorMessage", "二次新密碼不一致");
	        return "member";
	    }
	    
	    // 將新密碼進行加密
	    String encryptedNewPassword = BCrypt.hashpw(newPasswords.get(0), BCrypt.gensalt());

	    // 進行密碼變更
	    user.setPassword(encryptedNewPassword);
	    userDAO.updateUserPassword(user.getUserId(), encryptedNewPassword);

	    return "member";
	    //return "redirect:/logout";
	}


	// 得到目前所有 session attribute names
	@GetMapping("/findAllSessionNames")
	@ResponseBody
	public String findAllSessionNames(HttpSession session) {
		StringBuilder names = new StringBuilder();
		// 目前系統中在使用的 Session 屬性名稱
		Enumeration<String> sessionAttrNames = session.getAttributeNames();
		while (sessionAttrNames.hasMoreElements()) {
			String name = (String) sessionAttrNames.nextElement();
			names.append(name + "\n");
		}
		return names.toString();
	}
	
	

}
