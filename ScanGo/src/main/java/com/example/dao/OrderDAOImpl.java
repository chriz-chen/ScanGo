package com.example.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.OrderItem;
import com.example.entity.Orders;

@Component("orderDaoImpl")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addOrder(Integer userId, Integer orderTotalPrice) {
		String sql1 = "insert into orders (userId, orderTotalPrice) values (?, ?)";
		jdbcTemplate.update(sql1, userId, orderTotalPrice);
	}
	
	@Override
	public Boolean updateOrderTotalPrice(Integer orderId, Integer userId, Integer orderTotalPrice) {
		String sql = "update orders set orderTotalPrice = ? where orederId = ? and userId = ?";
		return jdbcTemplate.update(sql, orderTotalPrice, orderId, userId) == 1;
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
	public void addOrderItem(OrderItem orderItem) {
		String sql = "insert into orderItem (orderId, productId, productPrice, itemQuantity, itemPrice) values(?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, orderItem.getOrderId(), orderItem.getProductId(), orderItem.getProductPrice(),
							orderItem.getItemQuantity(), orderItem.getItemPrice());
	}

	

}
