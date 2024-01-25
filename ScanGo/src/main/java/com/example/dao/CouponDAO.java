package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.Coupon;

public interface CouponDAO {

	//查詢所有優惠券(多筆)
	List<Coupon> findAllCoupons();
	
	//根據優惠券ID來查找優惠券(單筆)
	Optional<Coupon> findCouponById(Integer couponId);
	
}
