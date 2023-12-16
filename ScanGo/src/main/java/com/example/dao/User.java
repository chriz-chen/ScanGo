package com.example.dao;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

	private Integer userId;
	
	private String firstName;
	
	private String lastName;
	
	private String email;

	private String password;
	
	private String avator;
}

