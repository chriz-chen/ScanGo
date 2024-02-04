package com.example.service;

import com.example.bean.RegisterUser;

// 註冊服務接口，定義了註冊功能的方法
public interface RegisterService {

	// 註冊使用者的方法，接收一個RegisterUser對象，返回註冊狀態
	RegisterStatus register(RegisterUser registerUser);
}
