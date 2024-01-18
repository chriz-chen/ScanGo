package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Product;

@Component("productDaoImpl")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//查詢所有商品(多筆)
	@Override
	public List<Product> findAllProducts() {
		String sql = "select * from product";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class));
	}

	//根據產品ID來查找商品(單筆)
	@Override
	public Optional<Product> findProductById(Integer productId) {
		String sql = "select * from product where productId = ?";
		try {
			Product product = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Product.class), productId);
			return Optional.ofNullable(product);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

	//根據類別ID來查找商品(多筆)
	@Override
	public List<Product> findProductsByCategoryId(Integer categoryId) {
		String sql = "select * from product where categoryId = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class), categoryId);
	}

}
