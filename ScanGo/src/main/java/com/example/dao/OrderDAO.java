package com.example.dao;

public interface OrderDAO {

	//建立訂單
	void setOrder(Integer userId, Integer orderTotalPrice);
	
	//建立訂單細項
	void setOrderItem(Integer orderId);
}
