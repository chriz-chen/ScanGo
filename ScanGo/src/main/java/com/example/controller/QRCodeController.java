package com.example.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.util.GenerateQRCode;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

@Controller
@RequestMapping("/qrcode/generate")
public class QRCodeController {

	@Autowired
	GenerateQRCode qrCode;
	
	@GetMapping
	@ResponseBody
	public String generate(@RequestParam("productId") Integer productId) throws WriterException, IOException {
		String str = "/ScanGo/mvc/product/"+productId;
		String path = "Users/chris/Desktop/product"+productId+".png";
		String charset = "UTF-8";
		Map<EncodeHintType, ErrorCorrectionLevel> hashMap = new HashMap<>();
		hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
		qrCode.generateQRcode(str, path, charset, hashMap, 200, 200);
		System.out.println("QR Code created successfully.");
		return "";
	}
	
}
