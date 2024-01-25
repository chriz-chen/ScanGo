package com.example.entity;

import java.sql.Timestamp;

public class CouponUser {

	private Integer user_coupon_id;
	private Integer userId;
	private Integer couponId;
	private Timestamp acquiredDate;
	private Timestamp usedDate;
	private Boolean isUsed;
	
	private Coupon coupon; 
	
	public CouponUser() {
		
	}
	
	public CouponUser(Integer user_coupon_id, Integer userId, Integer couponId, Timestamp acquiredDate,
			Timestamp usedDate, Boolean isUsed) {
		this.user_coupon_id = user_coupon_id;
		this.userId = userId;
		this.couponId = couponId;
		this.acquiredDate = acquiredDate;
		this.usedDate = usedDate;
		this.isUsed = isUsed;
	}

	public Integer getUser_coupon_id() {
		return user_coupon_id;
	}

	public void setUser_coupon_id(Integer user_coupon_id) {
		this.user_coupon_id = user_coupon_id;
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

	public Timestamp getAcquiredDate() {
		return acquiredDate;
	}

	public void setAcquiredDate(Timestamp acquiredDate) {
		this.acquiredDate = acquiredDate;
	}

	public Timestamp getUsedDate() {
		return usedDate;
	}

	public void setUsedDate(Timestamp usedDate) {
		this.usedDate = usedDate;
	}

	public Boolean getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(Boolean isUsed) {
		this.isUsed = isUsed;
	}

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}
	
	
}
