package com.example.oauth2;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.util.OIDCUtil;
import com.nimbusds.jwt.JWTClaimsSet;


/**
 * 此 Servlet 處理從 Google OAuth 2.0 服務重定向回的 OAuth 2.0 回調。
 * 它將解析授權碼，獲取ID令牌，然後驗證令牌的有效性。
 * 如果令牌有效，它將從ID令牌中提取用戶信息，並將令牌發送到報告服務。
 */
@WebServlet("/secure/callback/oidc")
public class OIDCCallback extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		// 取得授權碼
		String code = req.getParameter("code");
		resp.getWriter().println("code: " + code + "<p>");
		try {
			// 得到 idToken
			String idToken = OIDCUtil.getIDToken(code);
			resp.getWriter().println("idToken: " + idToken + "<p>");
			
			// 取得 email
			JWTClaimsSet claimsSet = OIDCUtil.getClaimsSetAndVerifyIdToken(idToken);
			String email = claimsSet.getStringClaim("email");
			resp.getWriter().println("email: " + email + "<p>");
			// email 是否已驗證
			Boolean emailVerified = claimsSet.getBooleanClaim("email_verified");
			resp.getWriter().println("emailVerified: " + emailVerified + "<p>");
			// 取得 sub(Subject Identifier) 當作 id
			String id = claimsSet.getStringClaim("sub");
			resp.getWriter().println("id: " + id + "<p>");
			
			resp.getWriter().println("claimsSet: " + claimsSet + "<p>");
			
		} catch (Exception e) {
			resp.getWriter().println("Exception: " + e);
		}
		
	}
}
