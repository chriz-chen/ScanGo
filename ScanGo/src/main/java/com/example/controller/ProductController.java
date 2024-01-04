package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.CartDAO;
import com.example.entity.Cart;

/**
 * http://localhost:8080/ScanGo/mvc/product       (1) V
 * http://localhost:8080/ScanGo/mvc/product/      (2) X
 * http://localhost:8080/ScanGo/mvc/product/hello (3) X
 */
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDAO cartDao;
	
	@GetMapping()
	public String showProduct() {
		return "product";
	}
	
	@PostMapping("/showCart")
    public String showCart(@RequestParam Integer userId, Model model) {
        List<Cart> carts = cartDao.findCartsByUserId(userId);
        model.addAttribute("carts", carts);
        return "cart";
    }
}
