package com.example.dao;

import java.util.Optional;

import com.example.entity.Product;

public interface ProductDao {

	Optional<Product> findProductById(Integer productId);
}
