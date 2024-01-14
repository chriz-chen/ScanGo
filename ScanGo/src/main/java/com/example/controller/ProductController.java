package com.example.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.ProductDaoImpl;
import com.example.entity.Product;

/**
 * http://localhost:8080/ScanGo/mvc/product/1
 */
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductDaoImpl productDaoImpl;
	
	@GetMapping(value = "/{productId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Product getProductInfo(@PathVariable("productId") Integer productId) {
		return productDaoImpl.findProductById(productId).get();
	}
}
