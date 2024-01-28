package com.example.controller.cart;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.CategoryDAO;
import com.example.dao.ProductDAO;
import com.example.entity.Category;
import com.example.entity.Product;
import com.example.util.GenerateQRCode;
import com.google.zxing.WriterException;


@Controller
@RequestMapping
public class ProductController {
	
	
	private static final Path UPLOAD = Paths.get(System.getProperty("user.home")+"/uploads/qrcodes");
	
	static {
		try {
			Files.createDirectories(UPLOAD);
			System.out.println("Absolute Path on  Max/Window: " + UPLOAD.toAbsolutePath().toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Autowired
	GenerateQRCode qrCode;

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
		List<Product> products = productDao.findLaunchProductsByCategoryId(categoryId);
		
		products.forEach(productItem -> {
			categoryDao.findCategoryById(productItem.getCategoryId()).ifPresent(productItem::setCategory);
		});
		
		String category = categoryDao.findCategoryById(categoryId).get().getCategoryName();
		
		model.addAttribute("products", products);
		model.addAttribute("category", category);
		return "product";
	}
	
	
//	------------------------------- backend ----------------------------------------- 
	
	
	@GetMapping("/backend/product")
	public String showProductBackend(Model model) {
		List<Product> productList = productDao.findAllProducts();
		
		List<Category> category = categoryDao.findAllCateories();
		
		model.addAttribute("productList", productList);
		model.addAttribute("category", category);
		
		return "backend_product";
	}
	
	
	/**
	 * 新增商品含 Qrcode
	 * @param product
	 * @param model
	 * @return
	 * @throws WriterException
	 * @throws IOException
	 */
	@PostMapping("/addProduct")
    public String addProduct(@ModelAttribute Product product, Model model) throws WriterException, IOException {
        
        productDao.addProduct(product);
        
        Integer productId = product.getProductId();
        
	     // 定義QRCode檔案
		String filename = productId+".png";
		Path sorucrePath = UPLOAD.resolve(filename);
		
		// 產生QRCode
		String str = "/ScanGo/mvc/product/"+productId;
		qrCode.generateQRcode(str, sorucrePath.toAbsolutePath().toString(), "UTF-8", 200, 200);
		model.addAttribute("product", product);
        return "add_product_result";
    }
	
	/**
	 * QR code download button
	 * http://localhost:8080/ScanGo/mvc/QrcodeDownload?productId=1
	 * @param productId
	 * @param resp
	 * @return 
	 * @throws WriterException
	 * @throws IOException
	 */
	@GetMapping("/QrcodeDownload")
	public String QrcodeDownload(@RequestParam("productId") Integer productId,HttpServletResponse resp) throws WriterException, IOException {
		
		// 定義QRCode檔案
		String filename = productId+".png";
		Path sorucrePath = UPLOAD.resolve(filename);
		
		// QRCode圖片下載
		resp.setContentType("APPLICATION/OCTET-STREAM");
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + filenameEncode(filename) + "\"");
		try (OutputStream output = resp.getOutputStream()){
			Files.copy(sorucrePath, output);
			return "redirect:/mvc/backend";
		}
		
		
	}
	
	public static String filenameEncode(String name) {
	    try {
	        return java.net.URLEncoder.encode(name, "UTF-8").replace("+", "%20");
	    } catch (java.io.UnsupportedEncodingException e) {
	        e.printStackTrace();
	        return name;
	    }
	}
	
	@GetMapping("/editProduct/{productId}")
    public String editProduct(@PathVariable("productId") Integer productId, Model model) {
        Optional<Product> productOptional = productDao.findProductById(productId);
        Product product = productOptional.orElse(null);

        model.addAttribute("product", product);

        return "editProduct";
    }

    @PostMapping("/updateProduct")
    public String updateProduct(@ModelAttribute Product updatedProduct, Model model) {
        productDao.updateProduct(updatedProduct);

        return "redirect:/mvc/backend";
    }
    
    @GetMapping("/update_product_launch")
	public String updateProductLaunch(@RequestParam("productId") Integer productId, 
									  @RequestParam("isLaunch") Boolean isLaunch,
									  HttpServletRequest request) {
		
		productDao.updateProductLaunch(productId, isLaunch);
		String referer = request.getHeader("Referer");
		return "redirect:" + (referer != null ? referer : "/");
	}

    @DeleteMapping("/deleteProduct/{productId}")
    public String deleteProduct(@PathVariable("productId") Integer productId) {
        productDao.deleteProduct(productId);

        return "redirect:/mvc/backend";
    }
	
}
