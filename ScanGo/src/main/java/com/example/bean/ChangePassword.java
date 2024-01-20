package com.example.bean;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChangePassword {

	@NotEmpty(message = "請輸入舊密碼")
	@Size(min = 6, max = 20)
	private String oldPassword;
	
	@NotEmpty(message = "請輸入新密碼")
	@Size(min = 6, max = 20)
	private String newPassword;
	
    @NotEmpty(message = "請再次輸入新密碼")
	@Size(min = 6, max = 20)
    private String confirmPassword;
}
