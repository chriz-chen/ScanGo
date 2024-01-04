package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.Cart;
import com.example.entity.Product;


public interface CartDAO {

	//根據使用者ID來查找其所有購物車資料(多筆)
	List<Cart> findCartsByUserId(Integer userId);
	
	//查詢所有購物車資料(多筆)
	List<Cart> findAllCart();
	
	//查詢所有商品(多筆)
	List<Product> findAllProducts();
		
	//根據產品ID來查找商品(單筆)
	Optional<Product> findProductById(Integer productId);
}
