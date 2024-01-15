package com.example.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Orders;

@Component("orderDaoImpl")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addOrder(Integer userId, Integer orderTotalPrice) {
		String sql = "insert into orders (userId, orderTotalPrice) values (?, ?)";
		jdbcTemplate.update(sql, userId, orderTotalPrice);
	}
	
	@Override
	public Optional<Orders> findOrderByUserId(Integer userId) {
		String sql = "select * from orders where userId = ?";
		
		try {
		Orders orders = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Orders.class), userId);
		return Optional.ofNullable(orders);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
		
	}


	@Override
	public void addOrderItem(Integer orderId, Integer productId, Integer productPrice, Integer itemQuantity,
			Integer itemPrice) {
		String sql = "insert into orderItem (orderId, productId, productPrice, itemQuantity, itemPrice) values(?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, orderId, productId, productPrice, itemQuantity, itemPrice);
	}

	

}
