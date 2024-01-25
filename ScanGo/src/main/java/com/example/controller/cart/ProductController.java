package com.example.controller.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.ProductDAO;
import com.example.entity.Product;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequestMapping
public class ProductController {

	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDAO productDao;
	
	/**
	 * http://localhost:8080/ScanGo/mvc/product/1
	 * @param productId
	 * @return
	 */
	@GetMapping(value = "/product/{productId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Product getProductInfo(@PathVariable("productId") Integer productId) {
		return productDao.findProductById(productId).get();
	 }
	
	
	@GetMapping("/searchProduct/{categoryId}")
	public String showProduct(@PathVariable("categoryId") Integer categoryId,
							  Model model) {
		List<Product> products = productDao.findProductsByCategoryId(categoryId);
		model.addAttribute("products", products);
		return "product";
	}
	
	@GetMapping("/backend")
	public String showProductBackend(Model model) {
		List<Product> productList = productDao.findAllProducts();

		
		model.addAttribute("productList", productList);
		
		return "backend";
	}
	
	@PostMapping("/add-product")
	public String addProduct(@ModelAttribute Product product) {
		productDao.addProduct(product);
		return "result";
	}
	
	
	
	
	
	
}
