package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.example.entity.OrderItem;
import com.example.entity.Orders;

@Component("orderDaoImpl")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDAO productDao;
	
	
	@Override
	public Orders addOrder(Integer userId, Integer orderTotalPrice) {
	    KeyHolder keyHolder = new GeneratedKeyHolder();

	    jdbcTemplate.update(new PreparedStatementCreator() {
	        @Override
	        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
	            PreparedStatement ps = connection.prepareStatement("INSERT INTO orders (userId, orderTotalPrice) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
	            ps.setInt(1, userId);
	            ps.setInt(2, orderTotalPrice);
	            return ps;
	        }
	    }, keyHolder);

	    // 獲取新插入行的主鍵值
	    Number generatedKey = keyHolder.getKey();
	    if (generatedKey == null) {
	        throw new RuntimeException("Failed to retrieve generated key after insert");
	    }

	    // 將 Number 轉換為 Integer
	    Integer generatedIntegerKey = generatedKey.intValue();

	    // 創建並返回新的 Orders 實例
	    Orders newOrder = new Orders();
	    newOrder.setOrderId(generatedIntegerKey);
	    newOrder.setUserId(userId);
	    newOrder.setOrderTotalPrice(orderTotalPrice);

	    return newOrder;
	}
	
	@Override
	public Boolean updateOrderTotalPrice(Integer orderId, Integer orderTotalPrice) {
		String sql = "update orders set orderTotalPrice = ? where orderId = ?";
		return jdbcTemplate.update(sql, orderTotalPrice, orderId) == 1;
	}

	@Override
	public List<Orders> findOrderByUserId(Integer userId) {
		String sql = "select * from orders where userId = ?";
		List<Orders> orders = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Orders.class), userId);
		return orders;
	}

	@Override
	public Orders findOrderByOrderId(Integer orderId) {
		String sql = "select * from orders where orderId = ?";
		Orders orders = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Orders.class), orderId);
		return orders;
	}

	@Override
	public void addOrderItem(OrderItem orderItem) {
		String sql = "insert into orderItem (orderId, productId, productPrice, itemQuantity, itemPrice) values(?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, orderItem.getOrderId(), orderItem.getProductId(), orderItem.getProductPrice(),
							orderItem.getItemQuantity(), orderItem.getItemPrice());
	}

	@Override
	public List<OrderItem> findOrderItemByOrderId(Integer orderId) {
		String sql = "select * from orderItem where orderId = ?";
		List<OrderItem> orderItem = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderItem.class), orderId);
		orderItem.forEach(orderItems -> {
			productDao.findProductById(orderItems.getProductId()).ifPresent(orderItems::setProduct);
		});
		
		return orderItem;
	}

	@Override
	public void setOrderRating(Integer orderId, Integer rating) {
		String sql = "update orders set rating = ? where orderId = ?";
		jdbcTemplate.update(sql, rating, orderId);
	}

	@Override
	public Boolean hasOrderBeenRated(Integer orderId) {
		String sql = "select rating from orders where orderId = ?";
		
		try {
			Integer rating = jdbcTemplate.queryForObject(sql, new Object[]{orderId}, Integer.class);
		
			return rating != null;
			
		} catch (EmptyResultDataAccessException e) {
			
			return false;
		}

	}

	

}
