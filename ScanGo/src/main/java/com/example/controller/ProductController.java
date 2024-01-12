package com.example.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * http://localhost:8080/ScanGo/mvc/product/1
 */
@Controller
@RequestMapping("/product")
public class ProductController {

	@GetMapping("/{productId}")
	@ResponseBody
	public Map<String,String> getProductInfo(@PathVariable("productId") String productId) {
		Map<String,String> productInfoMap = new LinkedHashMap<>();
		productInfoMap.put("productId", productId);
		productInfoMap.put("productName", "汽水");
		productInfoMap.put("productPrice", "50");
		productInfoMap.put("productQty", "100");
		return productInfoMap;
	}
}
