package com.example.controller.user;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.CouponDAO;
import com.example.entity.CouponUser;
import com.example.entity.User;


/**
 * /ScanGo/mvc/coupon
 */
@Controller
@RequestMapping
public class CouponController {
	
	@Autowired
	@Qualifier("couponDaoImpl")
	private CouponDAO couponDao;

	@GetMapping("/coupon")
	public String coupon(HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		
		List<CouponUser> couponUser = couponDao.findCouponsByUserId(user.getUserId());
		couponUser.forEach(couponList -> {
			couponDao.findCouponById(couponList.getCouponId()).ifPresent(couponList::setCoupon);
		});
		
		model.addAttribute("couponUser", couponUser);
		
		return "coupon";
	}
	
	@PostMapping("/getCoupon")
	public String getCoupon(@RequestParam("code") String code, HttpSession session, HttpServletRequest request) {
		User user = (User)session.getAttribute("user");
		
		
		Integer couponId = couponDao.findCouponByCode(code).get().getCouponId();
		
		couponDao.addCouponUser(user.getUserId(), couponId);
	    String referer = request.getHeader("Referer");
	    return "redirect:" + (referer != null ? referer : "/");
	}
	
}
