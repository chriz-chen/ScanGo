package com.example.entity;

public class Product {

	private Integer productId;
	private String productName;
	private Integer price;
	private String unit;
	private Integer categoryId;
	private Integer inventory;
	private Integer picture;
	
	private Category category;
	
	public Product() {
		
	}
	
	public Product(Integer productId, String productName, Integer price, String unit, Integer categoryId,
			Integer inventory) {
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.unit = unit;
		this.categoryId = categoryId;
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

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getInventory() {
		return inventory;
	}

	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}

	public Integer getPicture() {
		return picture;
	}

	public void setPicture(Integer picture) {
		this.picture = picture;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	
}
