package com.example.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Optional;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bean.*;
import com.example.dao.UserDAO;
import com.example.entity.User;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDAO userDAO;
	
	// 登入首頁
	@GetMapping()
	public String loginPage(@ModelAttribute LoginUser loginUser) {
		return "login";
	}
	
	@GetMapping("/getcode")
	private void getCodeImage(HttpSession session, HttpServletResponse response) throws IOException {
		// 產生一個驗證碼 code
		Random random = new Random();
		String code1 = String.format("%c", (char)(random.nextInt(26) + 65));
		String code2 = String.format("%c", (char)(random.nextInt(26) + 65));
		String code3 = String.format("%c", (char)(random.nextInt(26) + 65));
		String code4 = String.format("%c", (char)(random.nextInt(26) + 65));
		
		String code  = code1+code2+code3+code4;
		session.setAttribute("code", code);
		
		// Java 2D 產生圖檔
		// 1. 建立圖像暫存區
		BufferedImage img = new BufferedImage(90, 35, BufferedImage.TYPE_INT_BGR);
		// 2. 建立畫布
		Graphics g = img.getGraphics();
		// 3. 設定顏色
		g.setColor(Color.YELLOW);
		// 4. 塗滿背景
		g.fillRect(0, 0, 90, 35);
		// 5. 設定顏色
		g.setColor(Color.BLACK);
		// 6. 設定自型
		g.setFont(new Font("新細明體", Font.PLAIN, 30));
		// 7. 繪字串
		g.drawString(code, 10, 23); // code, x, y
		// 8. 干擾線
		g.setColor(Color.RED);
		for(int i=0;i<10;i++) {
			int x1 = random.nextInt(90);
			int y1 = random.nextInt(35);
			int x2 = random.nextInt(90);
			int y2 = random.nextInt(35);
			g.drawLine(x1, y1, x2, y2);
		}
		
		// 設定回應類型
		response.setContentType("image/png");
		
		// 將影像串流回寫給 client
		ImageIO.write(img, "PNG", response.getOutputStream());
	}
	
	// 前台登入處理
	@PostMapping()
	public String login(@ModelAttribute @Valid LoginUser loginUser, 
						BindingResult result,
						@RequestParam("code") String code, 
						Model model,HttpSession session) {
		
		if(result.hasErrors()) {
			return "login";
		}
		
		//比對驗證碼
		if(!code.equals(session.getAttribute("code")+"")) {
			session.invalidate(); // session 過期失效
			model.addAttribute("errorMessage", "驗證碼錯誤");
			return "login";
		}
		
		Optional<User> optUser = userDAO.findUserByUsername(loginUser.getUsername());
		if(!optUser.isPresent() ||  ! BCrypt.checkpw(loginUser.getPassword(),optUser.get().getPassword())) {
			model.addAttribute("errorMessage", "帳號或密碼錯誤");
			return "login";
		}
		
		User user = optUser.get();
		session.setMaxInactiveInterval(60 * 30); // 30分鐘：如果在指定的一段時間內，沒有任何的請求進來，session會失效。
		session.setAttribute("user", user);
		return "redirect:/";
	}
	
	
	
}
