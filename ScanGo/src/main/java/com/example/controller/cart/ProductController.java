package com.example.controller.cart;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.dao.CategoryDAO;
import com.example.dao.ProductDAO;
import com.example.entity.Category;
import com.example.entity.Product;



@Controller
@RequestMapping
public class ProductController {

	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDAO productDao;
	
	@Autowired
	@Qualifier("categoryDaoImpl")
	private CategoryDAO categoryDao;
	
	
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
		
		products.forEach(productItem -> {
			byte[] picture = productItem.getPicture();
	        if (picture != null) {
	            // 將 BLOB 資料轉換為 base64 字串
	            String base64Image = Base64.getEncoder().encodeToString(picture);
	            productItem.setBase64Image(base64Image);
	        }
			
			categoryDao.findCategoryById(productItem.getCategoryId()).ifPresent(productItem::setCategory);
		});
		
		String category = categoryDao.findCategoryById(categoryId).get().getCategoryName();
		
		model.addAttribute("products", products);
		model.addAttribute("category", category);
		return "product";
	}
	
	@GetMapping("/backend")
	public String showProductBackend(Model model) {
		List<Product> productList = productDao.findAllProducts();

		
		model.addAttribute("productList", productList);
		
		return "backend";
	}
	
	@PostMapping("/add-product")
    public String addProduct(@ModelAttribute Product product,
    						 @RequestPart("productImg") MultipartFile picture, Model model) {
        try {
            byte[] imageBytes = picture.getBytes();

            product.setPicture(imageBytes);

        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("錯誤", "Failed to read image file.");

            return "errorPage";
        }
        productDao.addProduct(product);

        return "result";
    }
	
	
}
