package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.OrderDAO;
import com.example.entity.OrderItem;
import com.example.entity.Orders;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping
public class OrderItemController {

	@Autowired
	@Qualifier("orderDaoImpl")
	private OrderDAO orderDao;
	
	
	@GetMapping("/showOrderItem/{orderId}")
	public String orderItemPage(@PathVariable("orderId") Integer orderId,
			    				Model model) {
		Orders orders = orderDao.findOrderByOrderId(orderId);
		List<OrderItem> orderItems = orderDao.findOrderItemByOrderId(orderId);
		
		boolean hasRated = orderDao.hasOrderBeenRated(orderId);
		
		model.addAttribute("orders", orders);
		model.addAttribute("orderItems", orderItems);
		model.addAttribute("hasRated", hasRated);
		
		return "orderitem";
	}
	
	@GetMapping("/checkRating/{orderId}")
	@ResponseBody
	public String checkRating(@PathVariable Integer orderId) {
	    Map<String, Object> response = new HashMap<>();

	    boolean hasRated = orderDao.hasOrderBeenRated(orderId);

	    response.put("hasRated", hasRated);

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
	
	@PostMapping("/sendRating/{orderId}")
	public String setOrderRating(@PathVariable Integer orderId, @RequestParam Integer star, HttpServletRequest request) {
		
		orderDao.setOrderRating(orderId, star);
		
		// 取得 Referer 頭資訊（即當前頁面的 URL）
	    String referer = request.getHeader("Referer");

	    // 如果 Referer 不為 null，則重新導向到 Referer 頁面，否則重新導向到根目錄
	    return "redirect:" + (referer != null ? referer : "/");
	}
	
	@GetMapping("/displayRatingResult/{orderId}")
	@ResponseBody
	public String displayRatingResult(@PathVariable Integer orderId) {
	    Map<String, Object> response = new HashMap<>();

	    Integer rating = orderDao.findOrderByOrderId(orderId).getRating();
	    
	    response.put("rating", rating);
	    
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
	
}
