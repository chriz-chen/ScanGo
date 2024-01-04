package com.example.bean;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.example.validate.NotExistUser;
import com.example.validate.ValidFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisterUser {

	@NotExistUser(message = "帳號已存在")
	@NotEmpty(message = "請輸入帳號")
	private String username;
	
	@NotEmpty(message = "請輸入密碼")
	@Size(min = 6, max = 20)
	private String password;
	
	@Email(message = "Email格式不符")
	@NotEmpty(message = "請輸入Email")
	@NotExistUser(message = "用戶已存在")
	private String email;
	
	@NotEmpty(message = "請輸入手機號碼")
	@NotExistUser(message = "手機號碼已使用")
	private String phone;
	
	@NotEmpty(message = "請輸入生日")
	private Date birthday;
	
	
	//	@ValidFile(message = "請上傳個人大頭照")
	//	private MultipartFile avator;
}
