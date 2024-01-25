package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.Category;
import com.example.entity.Product;

public interface ProductDAO {

	//查詢所有商品(多筆)
	List<Product> findAllProducts();
			
	//根據產品ID來查找商品(單筆)
	Optional<Product> findProductById(Integer productId);
	
	//根據類別ID來查找商品(多筆)
	List<Product> findProductsByCategoryId(Integer categoryId);
	
	//新增商品
	void addProduct(Product product);
	
	//修改商品庫存
	Boolean updateInventory(Integer productId, Integer inventory);
	
	//變更商品上架狀態
	Boolean updateProductLaunch(Integer productId, Boolean isLaunch);
	
}
