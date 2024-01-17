package com.example.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.example.entity.Category;
import com.example.entity.Orders;
import com.example.entity.Product;

public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	@Override
	public Category findCategoryById(Integer categoryId) {
		String sql = "select categoryId, categoryPart, categoryName from category where categoryId = ?";
		Category category = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Category.class), categoryId);
		return category;
	}
	
	@Override
	public List<Category> findCategoryNameByPart(String categoryName) {
		String sql = "select categoryName from category where categoryPart = ?";
		List<Category> category = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class), categoryName);
		return category;
	}

	
}


