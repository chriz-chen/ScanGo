package com.example.entity;

import java.sql.Timestamp;

public class Orders {

	private Integer orderId;
	private Integer userId;
	private Integer couponId;
	private Timestamp createTime;
	private Integer originalTotalPrice;
	private Integer discountTotalPrice;
	private Integer rating;
	
	public Orders() {
		
	}
	
	
	public Orders(Integer orderId, Integer userId, Integer couponId, Timestamp createTime, Integer originalTotalPrice,
			Integer discountTotalPrice) {
		this.orderId = orderId;
		this.userId = userId;
		this.couponId = couponId;
		this.createTime = createTime;
		this.originalTotalPrice = originalTotalPrice;
		this.discountTotalPrice = discountTotalPrice;
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


	public Integer getCouponId() {
		return couponId;
	}


	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}


	public Timestamp getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}


	public Integer getOriginalTotalPrice() {
		return originalTotalPrice;
	}


	public void setOriginalTotalPrice(Integer originalTotalPrice) {
		this.originalTotalPrice = originalTotalPrice;
	}


	public Integer getDiscountTotalPrice() {
		return discountTotalPrice;
	}


	public void setDiscountTotalPrice(Integer discountTotalPrice) {
		this.discountTotalPrice = discountTotalPrice;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}
	
	
}
