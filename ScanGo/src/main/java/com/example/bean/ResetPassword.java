package com.example.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.example.validate.NotExistUser;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResetPassword {

	@NotEmpty(message = "請輸入舊密碼")
	@Size(min = 6, max = 20)
	private String oldPassword;
	
	@NotEmpty(message = "請輸入新密碼")
	@Size(min = 6, max = 20)
	private String newPassword;
	
    @NotEmpty(message = "請再次輸入新密碼")
	@Size(min = 6, max = 20)
    private String confirmPassword;
    
	@Email(message = "Email格式不符")
	@NotEmpty(message = "請輸入Email")
	private String email;
}
