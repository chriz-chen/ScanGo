package com.example.entity;

import java.util.List;

public class Cart {

	private Integer userId;
	private Integer productId;
	private Integer productQuantity;

	private Product product; 

	
	public Cart() {
		
	}
	
	public Cart(Integer userId, Integer productId, Integer productQuantity) {
		this.userId = userId;
		this.productId = productId;
		this.productQuantity = productQuantity;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	
}
