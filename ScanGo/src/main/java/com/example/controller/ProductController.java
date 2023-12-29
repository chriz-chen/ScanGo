package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * http://localhost:8080/ScanGo/mvc/product       (1) V
 * http://localhost:8080/ScanGo/mvc/product/      (2) X
 * http://localhost:8080/ScanGo/mvc/product/hello (3) X
 */
@Controller
@RequestMapping("/product")
public class ProductController {

	@GetMapping()
	public String showProduct() {
		return "product";
	}
}
