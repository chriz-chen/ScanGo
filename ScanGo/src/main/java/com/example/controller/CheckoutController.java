package com.example.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.CartDAO;
import com.example.dao.CouponDAO;
import com.example.entity.Cart;
import com.example.entity.Coupon;
import com.example.entity.CouponUser;
import com.example.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping
public class CheckoutController {

	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDAO cartDao;
	
	@Autowired
	@Qualifier("couponDaoImpl")
	private CouponDAO couponDao;
	
	@GetMapping("/checkout")
	public String checkoutPage(HttpSession session, Model model) {
	    // 先找到 user 登入者
	    User user = (User) session.getAttribute("user");

	    Integer checkoutPrice = 0;
	    List<Cart> checkouts = cartDao.findCartsByUserId(user.getUserId());

	    for (Cart checkout : checkouts) {
	        checkout.getProduct().setPrice((checkout.getProduct().getPrice()) * (checkout.getProductQuantity()));
	        checkoutPrice += ((checkout.getProduct().getPrice()));
	    }

	    List<CouponUser> couponUser = couponDao.findAvailableCouponsByUserId(user.getUserId());
	    couponUser.forEach(couponList -> {
	        couponDao.findCouponById(couponList.getCouponId()).ifPresent(couponList::setCoupon);
	    });

	    List<CouponUser> eligibleCoupons = new ArrayList<>();

	    for (CouponUser couponUsers : couponUser) {
	        Integer minPurchaseAmount = couponUsers.getCoupon().getMinPurchaseAmount();
	        if (checkoutPrice >= minPurchaseAmount) {
	            eligibleCoupons.add(couponUsers);
	        }
	    }

	    model.addAttribute("checkouts", checkouts);
	    model.addAttribute("checkoutPrice", checkoutPrice);
	    model.addAttribute("eligibleCoupons", eligibleCoupons); // 將符合條件的優惠券添加到模型
	    
	    session.removeAttribute("discountTotalPrice");

	    return "checkout";
	}
	
	@PostMapping("cart/couponSelection")
	@ResponseBody
	public String couponSelection(@RequestBody Map<String, Object> data,
								  HttpSession session) {
		Integer user_coupon_id = Integer.valueOf(data.get("user_coupon_id").toString());
		
		Map<String, Object> response = new HashMap<>();
		
		Optional<CouponUser> couponUser = couponDao.findCouponUserById(user_coupon_id);
		Optional<Coupon> coupon = couponDao.findCouponById(couponUser.get().getCouponId());
		
	    Integer subtotalValue = Integer.valueOf(data.get("subtotalValue").toString());
		
		if(coupon.isPresent()) {
			Coupon couponPresent = coupon.get();
			if("FIXED".equals(couponPresent.getType())) {
				
				BigDecimal couponValue = couponPresent.getValue();
				Integer discountValue = couponValue.intValue();
				Integer discountTotalPrice = subtotalValue - discountValue;
				System.out.println(discountTotalPrice);
				
				response.put("discountValue", discountValue);	
				response.put("discountTotalPrice", discountTotalPrice);	
				
				session.setAttribute("discountTotalPrice", discountTotalPrice);
				
			}else if("PERCENT".equals(couponPresent.getType())) {
				
				BigDecimal couponValue = couponPresent.getValue();
				BigDecimal discountAmount = couponValue.divide(BigDecimal.valueOf(100)).multiply(BigDecimal.valueOf(subtotalValue));
			    BigDecimal discountedTotalPrice = BigDecimal.valueOf(subtotalValue).subtract(discountAmount);
			    Integer roundedDiscountedTotalPrice = discountedTotalPrice.setScale(0, RoundingMode.HALF_UP).intValue();
			    Integer discountValue = subtotalValue - roundedDiscountedTotalPrice;
				
			    response.put("discountValue", discountValue);
			    response.put("discountTotalPrice", roundedDiscountedTotalPrice);
			    
			    session.setAttribute("discountTotalPrice", roundedDiscountedTotalPrice);
				
			}else {
				response.put("error", "優惠券類型無法判斷!");
			}

		}else {
			response.put("error", "找不到該優惠券!");	

		}
		
		try {
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonResponse = objectMapper.writeValueAsString(response);

	        return jsonResponse;
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	        return "{\"error\": \"Error converting to JSON\"}";
	    }
	}
}
