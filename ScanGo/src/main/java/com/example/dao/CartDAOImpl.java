package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Cart;
import com.example.entity.Product;


@Component("cartDaoImpl")
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Cart> findCartsByUserId(Integer userId) {
		String sql = "select * from cart where userId = ?";
		List<Cart> carts = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Cart.class), userId);
		carts.forEach(cartItem -> {
			findProductById(cartItem.getProductId()).ifPresent(cartItem::setProduct);
		});
		return carts;
	}

	@Override
	public List<Cart> findAllCart() {
		String sql = "select * from cart";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Cart.class));
	}
	
	@Override
	public List<Product> findAllProducts() {
		String sql = "select * from product";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class));
	}

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
	
}
