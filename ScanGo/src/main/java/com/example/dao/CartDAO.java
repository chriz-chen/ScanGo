package com.example.dao;

import java.util.List;

import com.example.entity.Cart;


public interface CartDAO {

	//根據使用者ID來查找其所有購物車資料(多筆)
	List<Cart> findCartsByUserId(Integer userId);
	
	//查詢所有購物車資料(多筆)
	List<Cart> findAllCart();
}
