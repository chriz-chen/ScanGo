<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>+Room 重設密碼</title>
		<!-- head -->
<%@ include file="/WEB-INF/header.jspf"%>		

		
	</head>
	<body class="d-flex align-items-center justify-content-center">
		<div class="container bg-white">
			<form method="post" action="${pageContext.request.contextPath}/mvc/auth/password/verifyAndReset">
				<div class="w-75 py-4 text-start mx-auto">
					<!-- logo -->
	                <div class="text-center mb-3">
	                	<img src="${pageContext.request.contextPath}/resources/image/logo-black.png">
	                </div>
                
					<h4 class="fw-bold mb-4">重設密碼</h4>
	
					<div class="mb-3">
						<label for="totp">驗證碼</label>
						<input type="text" name="totp" />
					</div>
					
					<div class="mb-3">
						<label for="password">新密碼</label>
						<input type="password" name="password" />
					</div>
					
					<div class="mb-3">
						<label for="confirmPassword">再次輸入新密碼</label>
						<input type="password" name="confirmPassword" />
					</div>
	
					<div class="w-100 d-flex justify-content-center">
						<button type="submit">重設</button>
					</div>
				</div>
			</form>
		</div>
		
		<!-- footer -->
<%@ include file="/WEB-INF/footer.jspf"%>
	</body>
</html>