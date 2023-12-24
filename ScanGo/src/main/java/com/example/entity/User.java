package com.example.entity;

import java.util.Date;

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
	
	private Date createDate;
}
