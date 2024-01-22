package com.example.dao;

import java.util.Optional;

import com.example.entity.Cart;
import com.example.entity.Product;

public interface ProductDao {

	Optional<Product> findProductById(Integer productId);
	
	//新增購物車項目資料
	void addCart(Cart cart);
}
