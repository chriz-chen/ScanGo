package com.example.entity;

public class Category {
	
	private Integer categoryId;
	private String categoryPart;
	private String categoryName;
	
	public Category() {
		
	}
	
	public Category(Integer categoryId, String categoryPart, String categoryName) {
		this.categoryId = categoryId;
		this.categoryPart = categoryPart;
		this.categoryName = categoryName;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryPart() {
		return categoryPart;
	}

	public void setCategoryPart(String categoryPart) {
		this.categoryPart = categoryPart;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	

}
