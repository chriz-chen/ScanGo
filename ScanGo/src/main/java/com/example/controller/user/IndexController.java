package com.example.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bean.LoginUser;
import com.example.dao.CouponDAO;
import com.example.entity.Coupon;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Autowired
	@Qualifier("couponDaoImpl")
	private CouponDAO couponDao;
	
	// 登入首頁
	@GetMapping
	public String index(Model model) {
		
		List<Coupon> coupons = couponDao.findAllCoupons();
		
		model.addAttribute("coupons", coupons);

		return "index";
	}
	
	@GetMapping("/product-info")
	public String loginPage(@ModelAttribute LoginUser loginUser) {
		return "product-info";
	}
	
}
