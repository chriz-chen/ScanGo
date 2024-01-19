package com.example.controller;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.UserDAO;
import com.example.entity.User;
import com.example.util.OAuth2Util;
import com.example.util.OIDCUtil;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nimbusds.jwt.JWTClaimsSet;



@Controller
@RequestMapping("/login/secure")
public class SecureCallbackOauth2Controller {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping("/customlogin/google")
	public String loginGoogle() {
		String auth = OIDCUtil.getAuthorizationUrl("code", "email openid profile");
		System.out.println(auth);
		return "redirect:" + auth;
	}
	
	@RequestMapping("/callback/google")
	//@ResponseBody
	public String callbackGoogle(@RequestParam("code")String code, HttpSession session) {
		try {
			// 得到 idToken
			String idToken = OIDCUtil.getIDToken(code);

			// 取得 claimsSet = email openid profile
			JWTClaimsSet claimsSet = OIDCUtil.getClaimsSetAndVerifyIdToken(idToken);
			System.out.println(claimsSet);
			// 取得 email
			String email = claimsSet.getStringClaim("email");
			System.out.println(email);

			// 確認 email 是否有效
			Boolean emailVerified = claimsSet.getBooleanClaim("email_verified");
			
			// 取得 name
			String name = claimsSet.getStringClaim("name");
			System.out.println(name);

			
			// 取得 sub (Subject Identifier 唯一識別符) 當作 id
			String id = claimsSet.getStringClaim("sub");
			System.out.println(id);

			
			GoogleUser googleUser = new GoogleUser(id, name, email);
			
			// 5. 檢查會員資料表中是否有此人，若無則將該會員新增到資料表
			Optional<User> userOpt = userDAO.findAllUsers()
						   .stream()
						   .filter(user -> user.getAuthType() != null &&
						   				   user.getAuthType().equalsIgnoreCase("google") && 
						    	   	       user.getAuthId().equals(googleUser.id))
						   .findFirst();
			
			User user = null;
			if (userOpt.isEmpty()) {
				user = new User(0, googleUser.name, "None", googleUser.email, "None", null, 1, "Google", googleUser.id, null);
				userDAO.addUser(user);
				System.out.println("if " + user);
			}
			user = userDAO.findUserByUsername(googleUser.name).get();
			System.out.println(user);
			// 6. 新增成功就自行自動登入 (例如：建立 user 物件並存放到 session 中)
			session.setAttribute("user", user);
			
			//return id;
			return "redirect:/";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/mvc/login";
		}
	
	}
	
	class GoogleUser {
		public String id;
		public String name;
		public String email;
		
		public GoogleUser(String id, String name, String email) {
			this.id = id;
			this.name = name;
			this.email = email;
		}
		
		
		
	}
	
	
	
	

}
