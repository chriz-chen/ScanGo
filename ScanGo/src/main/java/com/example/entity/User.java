package com.example.entity;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

	private Integer userId;
	private String username; // 使用者帳號
	private String password;
	private Integer levelId; // 使用者權限（1: 一般會員-進行購物, 2: 後臺維運人員-上架商品）
	private String email;
	private String phone;
	
	@JsonFormat(pattern = "yyyy-MM-dd")     // 將Java對象轉換為JSON字符串時，日期屬性的格式
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 將字符串轉換為Java日期對象時的格式
	@Temporal(TemporalType.DATE)            // 指定實體屬性與資料庫中的日期類型對應(不包括時間部分)
	private Date birthday;
	
	private String authType; // 授權來源
	private String authId; // 授權Id
	
	@JsonFormat(pattern = "yyyy-MM-dd")     
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	@Temporal(TemporalType.DATE)
	private Date createDate;
	
	private Level level;
}

