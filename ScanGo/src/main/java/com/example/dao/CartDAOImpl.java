package com.example.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Cart;


@Component("cartDaoImpl")
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDAO productDao;

	//根據使用者ID來查找其所有購物車資料(多筆)
	@Override
	public List<Cart> findCartsByUserId(Integer userId) {
		String sql = "select * from cart where userId = ?";
		List<Cart> carts = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Cart.class), userId);
		carts.forEach(cartItem -> {
			productDao.findProductById(cartItem.getProductId()).ifPresent(cartItem::setProduct);
		});
		return carts;
	}
	
	//查詢所有購物車資料(多筆)
	@Override
	public List<Cart> findAllCart() {
		String sql = "select * from cart";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Cart.class));
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

	//修改購物車商品數量
	@Override
	public Boolean updateCartItemQuantity(Integer userId, Integer productId, Integer productQuantity) {
		String sql = "update cart set productQuantity = ? where userId = ? and productId = ?";
		return jdbcTemplate.update(sql, productQuantity, userId, productId) == 1;
	}

	@Override
	public Boolean removeCartByUserId(Integer userId) {
		String sql = "delete from cart where userId = ?";
		return jdbcTemplate.update(sql, userId) == 1;
	}

	//根據使用者ID及商品ID來刪除購物車中的項目
	@Override
	public Boolean removeFromCart(Integer userId, Integer productId) {
		String sql = "delete from cart where userId = ? && productId = ?";
		return jdbcTemplate.update(sql, userId, productId) == 1;
	}
	
	
	
	
	
}
