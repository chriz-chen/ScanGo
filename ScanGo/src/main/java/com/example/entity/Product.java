package com.example.entity;

public class Product {

	private Integer productId;
	private String productName;
	private Integer price;
	private Integer inventory;
	
	public Product() {
		
	}
	
	public Product(Integer productId, String productName, Integer price, Integer inventory) {
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.inventory = inventory;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getInventory() {
		return inventory;
	}

	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}
	
	
}
