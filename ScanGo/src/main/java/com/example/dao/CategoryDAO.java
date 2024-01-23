package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.Category;

public interface CategoryDAO {

	//根據類別ID找到商品類別
	Optional<Category> findCategoryById(Integer categoryId);
	
	//根據大類別分類找到小類別名稱
	List<Category> findCategoryNameByPart(String categoryName);
}
