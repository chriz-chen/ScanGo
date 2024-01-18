package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.Cart;
import com.example.entity.Product;
import com.example.entity.Category;


public interface CartDAO {

	//根據使用者ID來查找其所有購物車資料(多筆)
	List<Cart> findCartsByUserId(Integer userId);
	
	//查詢所有購物車資料(多筆)
	List<Cart> findAllCart();
	
	//新增購物車項目資料
	void addCart(Cart cart);
	
	//修改購物車商品數量
	Boolean updateCartItemQuantity(Integer userId, Integer productId, Integer productQuantity);
	
	//根據使用者ID來刪除該使用者全部購物車(結帳用)
	Boolean cleanCartByUserId(Integer userId);
	
	//根據使用者ID及商品ID來刪除購物車中的項目
	Boolean removeFromCart(Integer userId, Integer productId);
}
