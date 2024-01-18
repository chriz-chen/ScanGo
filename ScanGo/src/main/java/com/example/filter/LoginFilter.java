package com.example.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.entity.User;


// 設定該過濾器對應的URL模式
@WebFilter(value = { "/mvc/*" })
public class LoginFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 取得請求的URL字串
		String urlString = request.getRequestURL().toString();
		
		// 如果URL符合特定條件，則直接執行濾波器鏈並結束過濾器的處理
		if (urlString.endsWith("login.jsp") 
				|| urlString.endsWith("login") 
				|| urlString.endsWith("register") 
				|| urlString.endsWith("imagemap.jsp")
				|| urlString.indexOf("/images") >= 0
				|| urlString.indexOf("/product") >= 0
				//|| urlString.indexOf("/addCartByPost") >= 0 
				|| urlString.endsWith(".css") 
				|| urlString.endsWith(".js")
				|| urlString.endsWith("/getcode")) {
			chain.doFilter(request, response);
			return;
		}
		
		// 取得Session物件
		HttpSession session = request.getSession();
		// 從session中取得使用者資訊
		User user = session.getAttribute("user") == null ? null : (User) session.getAttribute("user");
		// 如果使用者未登入，導向登入頁面
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/mvc/login");
			return;
		}
		
		// 若符合條件，則繼續執行過濾器鏈
		chain.doFilter(request, response);

	}

}
