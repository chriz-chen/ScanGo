package com.example.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.entity.Cart;
import com.example.entity.Product;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public Optional<Product> findProductById(Integer productId) {
		String sql = "SELECT productId, productName, price, unit, categoryId, inventory, picture FROM product where productId=?";
		try {
			Product product = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Product.class), productId);
			return Optional.ofNullable(product);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

	//新增購物車項目資料
		@Override
		public void addCart(Cart cart) {
			String sql1 = "select count(*) as count from cart where userId = ? and productId = ?";
			int count = jdbcTemplate.queryForObject(sql1, Integer.class, cart.getUserId(), cart.getProductId());
			if(count == 0) {
				String sql2 = "insert into cart(userId, productId, productQuantity) values(?, ?, ?)";
				jdbcTemplate.update(sql2, cart.getUserId(), cart.getProductId(), cart.getProductQuantity());
			} else {
				String sql3 = "update cart set productQuantity = productQuantity + ? where userId = ? and productId = ?";
				jdbcTemplate.update(sql3, cart.getProductQuantity(), cart.getUserId(), cart.getProductId());
			}
		}
}
