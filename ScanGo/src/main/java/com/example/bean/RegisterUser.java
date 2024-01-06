package com.example.bean;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.example.validate.NotExistUser;
import com.example.validate.ValidFile;
import com.fasterxml.jackson.annotation.JsonFormat;

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
	
    @NotEmpty(message = "請再次輸入密碼")
    private String confirmPassword;
	
	@Email(message = "Email格式不符")
	@NotEmpty(message = "請輸入Email")
	@NotExistUser(message = "用戶已存在")
	private String email;
	
	@NotEmpty(message = "請輸入手機號碼")
	@NotExistUser(message = "手機號碼已使用")
	private String phone;
	
	@NotNull(message = "請輸入生日")
	@Past(message = "請輸入過去的日期")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	
	
	//	@ValidFile(message = "請上傳個人大頭照")
	//	private MultipartFile avator;
}
