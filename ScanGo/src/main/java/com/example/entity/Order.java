package com.example.entity;

import java.sql.Timestamp;

public class Order {

	private Integer orderId;
	private Integer userId;
	private Integer orderTotalPrice;
	private Timestamp createTime;
	private Integer rating;
	
	public Order() {
		
	}
	
	public Order(Integer orderId, Integer userId, Integer orderTotalPrice, Timestamp createTime) {
		this.orderId = orderId;
		this.userId = userId;
		this.orderTotalPrice = orderTotalPrice;
		this.createTime = createTime;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(Integer orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}
	
	
}
