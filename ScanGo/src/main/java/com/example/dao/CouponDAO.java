package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.Coupon;
import com.example.entity.CouponUser;

public interface CouponDAO {

	//查詢所有優惠券(多筆)
	List<Coupon> findAllCoupons();
	
	//利用isActive狀態來查找優惠券
	List<Coupon> findAllActiveCoupons();
	
	//根據優惠券ID來查找優惠券(單筆)
	Optional<Coupon> findCouponById(Integer couponId);
	
	//根據優惠券代碼來查找優惠券
	Optional<Coupon> findCouponByCode(String code);
	
	//新增優惠券給使用者
	void addCouponUser(Integer userId, Integer couponId);
	
	//根據使用者ID來查找其所擁有的優惠券
	List<CouponUser> findCouponsByUserId(Integer userId);
	
	//根據使用者ID來查找其所有可使用的優惠券
	List<CouponUser> findAvailableCouponsByUserId(Integer userId);
	
	//根據user_coupon_id來查找使用者的優惠券
	Optional<CouponUser> findCouponUserById(Integer user_coupon_id);
	
}
