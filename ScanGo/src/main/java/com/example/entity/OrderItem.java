package com.example.entity;

public class OrderItem {

	private Integer orderId;
	private Integer productId;
	private Integer productPrice;
	private Integer itemQuantity;
	private Integer itemPrice;
	
	private Product product;
	
	public OrderItem() {
		
	}
	
	public OrderItem(Integer orderId, Integer productId, Integer productPrice, Integer itemQuantity,
			Integer itemPrice) {
		this.orderId = orderId;
		this.productId = productId;
		this.productPrice = productPrice;
		this.itemQuantity = itemQuantity;
		this.itemPrice = itemPrice;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getItemQuantity() {
		return itemQuantity;
	}

	public void setItemQuantity(Integer itemQuantity) {
		this.itemQuantity = itemQuantity;
	}

	public Integer getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
