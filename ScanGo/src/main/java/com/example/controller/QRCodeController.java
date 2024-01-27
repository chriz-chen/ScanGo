package com.example.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.util.GenerateQRCode;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

@Controller
@RequestMapping("qrcode")
public class QRCodeController {

	@Autowired
	GenerateQRCode qrCode;
	
	@GetMapping("/generateQRcode")
	public String generate(@RequestParam("productId") Integer productId, Model model) throws WriterException, IOException {
		try {
            String productUrl = "/ScanGo/mvc/product/" + productId;
            String qrCodePath = "src/main/webapp/QRCode/product" + productId + ".png";
            String charset = "UTF-8";
            Map<EncodeHintType, ErrorCorrectionLevel> hints = new HashMap<>();
            hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
            
            GenerateQRCode.generateQRcode(productUrl, qrCodePath, charset, hints, 200, 200);
            
            model.addAttribute("qrCodePath", qrCodePath);
            return "backend"; // Return the JSP page name
        } catch (WriterException | IOException e) {
            e.printStackTrace();
            // Handle the exception, maybe redirect to an error page
            return "errorPage";
        }
	}
	
}
