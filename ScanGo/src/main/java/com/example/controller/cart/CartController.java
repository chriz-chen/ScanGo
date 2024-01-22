package com.example.controller.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.CartDAO;
import com.example.dao.ProductDAO;
import com.example.entity.Cart;
import com.example.entity.Product;
import com.example.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping
public class CartController {

	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDAO cartDao;
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDAO productDao;
	
	@GetMapping("/cart")
	public String cartPage(HttpSession session, Model model) {
		//  先找到 user 登入者
		User user = (User)session.getAttribute("user");
		
		Integer totalPrice = 0;
		List<Cart> carts = cartDao.findCartsByUserId(user.getUserId());
		for(Cart cart : carts) {
			cart.getProduct().setPrice((cart.getProduct().getPrice()) * (cart.getProductQuantity()));
			totalPrice += ((cart.getProduct().getPrice()));
		}
		model.addAttribute("carts", carts);
		model.addAttribute("totalPrice", totalPrice);
		return "cart";
	}
	
	@PostMapping("cart/update_minus")
	@ResponseBody
	public String updateQuantityByMinus(@RequestBody Product data,
									   HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		//  先找到 user 登入者
		User user = (User)session.getAttribute("user");
		
		Integer productQuantity = cartDao.findCartItem(user.getUserId(), data.getProductId()).getProductQuantity();
		
		if(productQuantity > 1 ) {
			productQuantity = productQuantity - 1;
			cartDao.updateCartItemQuantity(user.getUserId(), data.getProductId(), productQuantity);
			
			Cart cart = cartDao.findCartItem(user.getUserId(), data.getProductId());
			Integer productBasePrice = productDao.findProductById(data.getProductId()).get().getPrice();
			Integer itemPrice = (cart.getProductQuantity()) * (productDao.findProductById(data.getProductId()).get().getPrice());
			
			
			response.put("cart", cart);		
			response.put("productBasePrice", productBasePrice);		
			response.put("itemPrice", itemPrice);		
			
		} else {
			response.put("error", "最少加入1件!");
		}
		
		try {
	        // 將 response 轉換為 JSON 字符串
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonResponse = objectMapper.writeValueAsString(response);

	        return jsonResponse;
	    } catch (JsonProcessingException e) {
	        // 處理轉換失敗的例外
	        e.printStackTrace();
	        return "{\"error\": \"Error converting to JSON\"}";
	    }
	}
	
	@PostMapping("cart/update_plus")
	@ResponseBody
	public String updateQuantityByPlus(@RequestBody Product data,
									   HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		//  先找到 user 登入者
		User user = (User)session.getAttribute("user");
		
		Integer productQuantity = cartDao.findCartItem(user.getUserId(), data.getProductId()).getProductQuantity();
		Integer inventory = productDao.findProductById(data.getProductId()).get().getInventory();
		
		if(productQuantity < inventory) {
			productQuantity = productQuantity + 1;
			cartDao.updateCartItemQuantity(user.getUserId(), data.getProductId(), productQuantity);
			
			Cart cart = cartDao.findCartItem(user.getUserId(), data.getProductId());
			Integer productBasePrice = productDao.findProductById(data.getProductId()).get().getPrice();
			Integer itemPrice = (cart.getProductQuantity()) * (productDao.findProductById(data.getProductId()).get().getPrice());
			
			
			response.put("cart", cart);		
			response.put("productBasePrice", productBasePrice);		
			response.put("itemPrice", itemPrice);		
			
		} else {
			response.put("error", "超過庫存上限!");
		}
		
		try {
	        // 將 response 轉換為 JSON 字符串
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonResponse = objectMapper.writeValueAsString(response);

	        return jsonResponse;
	    } catch (JsonProcessingException e) {
	        // 處理轉換失敗的例外
	        e.printStackTrace();
	        return "{\"error\": \"Error converting to JSON\"}";
	    }
	}
	
	@PostMapping("cart/removeFromCart")
	@ResponseBody
	public String removeFromCart(@RequestBody Product data,
									   HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		//  先找到 user 登入者
		User user = (User)session.getAttribute("user");
		
		cartDao.removeFromCart(user.getUserId(), data.getProductId());
		
		List<Cart> cart = cartDao.findCartsByUserId(user.getUserId());
		
		Integer totalPrice = 0;
		for (Cart carts : cart) {
            carts.getProduct().setPrice(carts.getProduct().getPrice() * carts.getProductQuantity());
            totalPrice += carts.getProduct().getPrice();
        }
		
		response.put("totalPrice", totalPrice);	
	
		try {
	        // 將 response 轉換為 JSON 字符串
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonResponse = objectMapper.writeValueAsString(response);

	        return jsonResponse;
	    } catch (JsonProcessingException e) {
	        // 處理轉換失敗的例外
	        e.printStackTrace();
	        return "{\"error\": \"Error converting to JSON\"}";
	    }
	}
	
	@GetMapping("/drawer_cart")
	@ResponseBody
	public String drawer_cartPage(HttpSession session) {
	    Map<String, Object> response = new HashMap<>();
	    // 先找到 user 登入者
	    User user = (User) session.getAttribute("user");

	    if (user != null) {
	        List<Cart> carts = cartDao.findCartsByUserId(user.getUserId());

	        Integer totalPrice = 0;
	        for (Cart cart : carts) {
	            cart.getProduct().setPrice(cart.getProduct().getPrice() * cart.getProductQuantity());
	            totalPrice += cart.getProduct().getPrice();
	        }

	        response.put("carts", carts);
	        response.put("totalPrice", totalPrice);
	    } else {
	        response.put("error", "User not logged in");
	    }

	    try {
	        // 將 response 轉換為 JSON 字符串
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonResponse = objectMapper.writeValueAsString(response);

	        return jsonResponse;
	    } catch (JsonProcessingException e) {
	        // 處理轉換失敗的例外
	        e.printStackTrace();
	        return "{\"error\": \"Error converting to JSON\"}";
	    }
	    
	}
	
	@PostMapping("/test")
	@ResponseBody
	public String testFromCartDrawer(@RequestBody Product data, HttpSession session) {
		System.out.println("test1234");
		
		Map<String, Object> response = new HashMap<>();
	    // 先找到 user 登入者
	    User user = (User) session.getAttribute("user");

		List<Cart> cart = cartDao.findCartsByUserId(user.getUserId());
		
		response.put("cart", cart);
		
		try {
	        // 將 response 轉換為 JSON 字符串
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonResponse = objectMapper.writeValueAsString(response);

	        return jsonResponse;
	    } catch (JsonProcessingException e) {
	        // 處理轉換失敗的例外
	        e.printStackTrace();
	        return "{\"error\": \"Error converting to JSON\"}";
	    }
	}
	
	
	
	@PostMapping("/addCartByPost")
	@ResponseBody
	public String addToCart(@RequestParam("productId") Integer productId,
							@RequestParam("productQuantity") Integer productQuantity,
							HttpSession session, HttpServletRequest request) {
		// 先找到 user 登入者
		User user = (User)session.getAttribute("user");
		
		// 建立購物項目
		Cart cart = new Cart();
		cart.setUserId(user.getUserId());
		cart.setProductId(productId);
		cart.setProductQuantity(productQuantity);
			
		// 新增購物車項目
		cartDao.addCart(cart);
		
		String referer = request.getHeader("Referer");
		return "ok";
	}
	
	
	
}



