package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dao.CategoryDAO;
import com.example.entity.Category;

/**
 * /ScanGo/mvc/imagemap
 */
@Controller
@RequestMapping("/imagemap")
public class ImageMapController {

	
//	@GetMapping
//	public String imageMap(@PathVariable("categoryPart") String categoryPart, Model model) {
//		List<Category> category = categoryDao.findCategoryNameByPart(categoryPart);
//		model.addAttribute("category", category);
//		return "imagemap";
//	}
	
	@GetMapping
	public String imageMap() {
		return "imagemap";
	}
	
	
}



