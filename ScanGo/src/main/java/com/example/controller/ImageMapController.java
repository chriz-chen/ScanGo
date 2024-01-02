package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * /ScanGo/mvc/imagemap
 */
@Controller
@RequestMapping("/imagemap")
public class ImageMapController {

	@GetMapping
	public String imageMap() {
		return "imagemap";
	}
}
