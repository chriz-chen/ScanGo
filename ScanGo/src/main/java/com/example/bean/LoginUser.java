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

	@Email(message = "Email格式不符")
	@NotEmpty(message = "請輸入Email")
	private String email;

	@NotEmpty(message = "請輸入密碼")
	@Size(min = 6, max = 20)
	private String password;
}
