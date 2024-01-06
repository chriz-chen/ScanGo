package com.example.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.example.validate.NotExistUser;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginUser {

	@NotEmpty(message = "請輸入帳號")
	private String username;

	@NotEmpty(message = "請輸入密碼")
	private String password;
	
	
	
}
