package com.example.entity;

import java.math.BigDecimal;
import java.sql.Date;

public class Coupon {

	private Integer couponId;
	private String couponName;
	private String code;
	private String type;
	private BigDecimal value;
	private Integer minPurchaseAmount;
	private String description;
	private Date startDate;
	private Date endDate;
	private Boolean isActive;
	private Boolean isDeleted;
	
	public Coupon() {
		
	}
	
	public Coupon(Integer couponId, String couponName, String code, String type, BigDecimal value, Date startDate,
			Date endDate, Boolean isActive) {
		this.couponId = couponId;
		this.couponName = couponName;
		this.code = code;
		this.type = type;
		this.value = value;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isActive = isActive;
	}

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}

	public Integer getMinPurchaseAmount() {
		return minPurchaseAmount;
	}

	public void setMinPurchaseAmount(Integer minPurchaseAmount) {
		this.minPurchaseAmount = minPurchaseAmount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	
}
