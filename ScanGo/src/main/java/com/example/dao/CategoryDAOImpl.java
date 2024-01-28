package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Category;
import com.example.entity.Coupon;
import com.example.entity.Product;

@Component("categoryDaoImpl")
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Category> findAllCateories() {
		String sql = "select * from category";
		List<Category> category = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class));
		return category;
	}

	@Override
	public Optional<Category> findCategoryById(Integer categoryId) {
		String sql = "select categoryId, categoryPart, categoryName from category where categoryId = ?";
		
		try {
			Category category = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Category.class), categoryId);
			return Optional.ofNullable(category);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}

	}
	
	@Override
	public List<Category> findCategoryNameByPart(String categoryName) {
		String sql = "select categoryName from category where categoryPart = ?";
		List<Category> category = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class), categoryName);
		return category;
	}

	
}


