package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.OrderItem;
import com.example.entity.Orders;

public interface OrderDAO {

	//建立訂單
	Orders addOrder(Integer userId, Integer orderTotalPrice);
	
	//修改訂單金額
	Boolean updateOrderTotalPrice(Integer orderId, Integer orderTotalPrice);
	
	//根據使用者ID來查找訂單(多筆)
	List<Orders> findOrderByUserId(Integer userId);
	
	//根據訂單ID來查找訂單
	Orders findOrderByOrderId(Integer orderId);
	
	//建立訂單細項
	void addOrderItem(OrderItem orderItem);
	
	//根據訂單ID來查找訂單細項(多筆)
	List<OrderItem> findOrderItemByOrderId(Integer orderId);
	
	//根據訂單ID及評分來更新訂單評分
	void setOrderRating(Integer orderId, Integer rating);
	
	//根據訂單ID來確認是否已經評分
	Boolean hasOrderBeenRated(Integer orderId);
	
}
