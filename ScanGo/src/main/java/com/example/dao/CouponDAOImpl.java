package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Coupon;

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
	public Optional<Coupon> findCouponById(Integer couponId) {
		String sql = "select * from coupon where couponId = ?";
		try {
			Coupon coupon = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Coupon.class), couponId);
			return Optional.ofNullable(coupon);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

	
}
