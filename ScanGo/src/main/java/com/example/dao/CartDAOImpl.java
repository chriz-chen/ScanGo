package com.example.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Cart;

@Component("cartDaoImpl")
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Cart> findCartsByUserId(Integer userId) {
		//String sql = "select * from cart where userId = ?";
		String sql = "select u.userName, p.productName, p.price, c.productQuantity, (p.price * c.productQuantity)as itemPrice\r\n"
				+ "from cart c\r\n"
				+ "join product p on c.productId = p.productId\r\n"
				+ "join account u on c.userId = u.userId\r\n"
				+ "where c.userId = ?";
		List<Cart> carts = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Cart.class), userId);
		
		return carts;
	}

	@Override
	public List<Cart> findAllCart() {
		// TODO Auto-generated method stub
		return null;
	}

}
