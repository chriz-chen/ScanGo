package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Coupon;
import com.example.entity.CouponUser;

@Component("couponDaoImpl")
public class CouponDAOImpl implements CouponDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Coupon> findAllCoupons() {
		String sql = "select * from coupon";
		List<Coupon> coupons = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Coupon.class));
		return coupons;
	}

	@Override
	public List<Coupon> findAllActiveCoupons() {
		String sql = "select * from coupon where isActive = true";
		List<Coupon> coupons = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Coupon.class));
		return coupons;
	}
	
	@Override
	public Optional<Coupon> findCouponById(Integer couponId) {
		String sql = "select * from coupon where couponId = ?";
		try {
			Coupon coupon = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Coupon.class), couponId);
			return Optional.ofNullable(coupon);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}
	
	@Override
	public Optional<Coupon> findCouponByCode(String code) {
		String sql = "select * from coupon where code = ?";
		try {
			Coupon coupon = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Coupon.class), code);
			return Optional.ofNullable(coupon);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

	@Override
	public void addCouponUser(Integer userId, Integer couponId) {
		String sql = "insert into couponuser(userId, couponId) values(?, ?)";
		
		try {
	    	jdbcTemplate.update(sql, userId, couponId);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public List<CouponUser> findCouponsByUserId(Integer userId) {
		String sql = "select * from couponuser where userId = ?";
		List<CouponUser> couponUser = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CouponUser.class), userId);
		
		return couponUser;
	}

	@Override
	public List<CouponUser> findAvailableCouponsByUserId(Integer userId) {
		String sql = "select * from couponuser where userId = ? and isUsed = false";
		List<CouponUser> couponUser = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CouponUser.class), userId);
		
		return couponUser;
	}

	@Override
	public Optional<CouponUser> findCouponUserById(Integer user_coupon_id) {
		String sql = "select * from couponUser where user_coupon_id = ?";
		try {
			CouponUser couponUser = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(CouponUser.class), user_coupon_id);
			return Optional.ofNullable(couponUser);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

	@Override
	public Boolean checkIfUserHasCoupon(Integer userId, Integer couponId) {
		String sql = "select count(*) from couponUser where userId = ? and couponId = ?";
		Integer count = jdbcTemplate.queryForObject(sql, Integer.class, userId, couponId);
		
		return count != null && count > 0;
	}

}
