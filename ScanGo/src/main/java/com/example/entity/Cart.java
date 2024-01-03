package com.example.entity;

public class Cart {

	private Integer userId;
	private Integer productId;
	private Integer productQuantity;
	
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

	
}
