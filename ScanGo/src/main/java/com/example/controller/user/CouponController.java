package com.example.controller.user;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;
import java.util.Optional;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dao.CouponDAO;
import com.example.entity.Coupon;
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
	public String getCoupon(@RequestParam("code") String code, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    User user = (User) session.getAttribute("user");

	    Optional<Coupon> couponOpt = couponDao.findCouponByCode(code);

	    if (couponOpt.isPresent()) {
	        Coupon coupon = couponOpt.get();
	        Integer couponId = coupon.getCouponId();

	        boolean alreadyReceived = couponDao.checkIfUserHasCoupon(user.getUserId(), couponId);

	        if (!alreadyReceived) {
	            couponDao.addCouponUser(user.getUserId(), couponId);
	            redirectAttributes.addFlashAttribute("message", "領取成功");
	        } else {
	        	redirectAttributes.addFlashAttribute("message", "已經領取過該優惠券");
	        }

	    } else {
	    	redirectAttributes.addFlashAttribute("message", "找不到該優惠券，請檢查代碼是否正確");
	    }

	    String referer = request.getHeader("Referer");
	    return "redirect:" + (referer != null ? referer : "/");
	}
}
