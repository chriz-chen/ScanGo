package com.example.bean;

import javax.validation.constraints.NotEmpty;

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
	
	@NotEmpty(message = "請輸入驗證碼")
	private String code;
}
