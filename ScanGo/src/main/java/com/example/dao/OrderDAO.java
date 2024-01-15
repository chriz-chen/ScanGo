package com.example.dao;

import java.util.Optional;

import com.example.entity.Orders;

public interface OrderDAO {

	//建立訂單
	void addOrder(Integer userId, Integer orderTotalPrice);
	
	//根據使用者ID來查找訂單
	Optional<Orders> findOrderByUserId(Integer userId);
	
	//建立訂單細項
	void addOrderItem(Integer orderId, Integer productId, Integer productPrice, Integer itemQuantity, Integer itemPrice);
}
