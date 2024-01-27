package com.example.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.util.GenerateQRCode;
import com.google.zxing.WriterException;

/**
 * 1. 如何透過 Controller 產生圖片，並下載檔案：
 *    http://localhost:8080/ScanGo/mvc/qrcode/generate?productId=1
 *    
 * 2. 從網頁中顯示圖片：http://localhost:8080/ScanGo/mvc/product/image/1.png 
 *    (原理：在 springmvc-servlet.xml 新增這個設定
 *    <mvc:resources mapping="/product/image/**" location="file:/uploads/qrcodes/"/>)
 */
@Controller
@RequestMapping("/qrcode/generate")
public class QRCodeController {

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
	
	/**
	 * http://localhost:8080/ScanGo/mvc/qrcode/generate?productId=1 GET
	 * @param productId
	 * @return
	 * @throws WriterException
	 * @throws IOException
	 */
	@GetMapping
	public void generate(@RequestParam("productId") Integer productId,HttpServletResponse resp) throws WriterException, IOException {
		
		// 定義QRCode檔案
		String filename = productId+".png";
		Path sorucrePath = UPLOAD.resolve(filename);
		
		// 產生QRCode
		String str = "/ScanGo/mvc/product/"+productId;
		qrCode.generateQRcode(str, sorucrePath.toAbsolutePath().toString(), "UTF-8", 200, 200);
		
		// QRCode圖片下載
		resp.setContentType("APPLICATION/OCTET-STREAM");
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + filenameEncode(filename) + "\"");
		try (OutputStream output = resp.getOutputStream()){
			Files.copy(sorucrePath, output);
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

	
}
