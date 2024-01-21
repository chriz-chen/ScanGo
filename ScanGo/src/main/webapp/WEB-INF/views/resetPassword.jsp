<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>重設密碼</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>
<%@ include file="/WEB-INF/header.jspf"%>

<style type="text/css">
#resetPasswordForm {
	background-color: #DCDCDC;
	border-radius: 10px;
	width: 100%;
	max-width: 450px;
	height: 500px;
	margin-top: 100px;
}

label {
	font-size: 18px !important;
	margin-left: 5px;
	letter-spacing: 5px !important;
}
</style>

</head>
<body>

	<div class="container mt-5 vh-100">
		<div class="row justify-content-center">
			<!-- 重設密碼輸入信箱表單 -->
			<form id="resetPasswordForm" class="p-4" action="${pageContext.request.contextPath}/mvc/auth/resetPassword" method="post">
			<p class="text-center text-danger fs-5">${ message }</p>
				<div class="mb-3 text-center">
					<h1 class="mb-4 mt-4">重設密碼</h1>
				</div>
				<div class="mb-3">
					<label for="totp" class="form-label ">驗證碼</label> 
					<input type="text" class="totp form-control" id="totp" name="totp" style="font-size: 16px; padding: 8px; letter-spacing: 4px;" required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label ">新密碼</label> 
					<input type="password" class="password form-control" id="password" name="password" style="font-size: 16px; padding: 8px; letter-spacing: 4px;" required>
				</div>
				<div class="mb-3">
					<label for="confirmPassword" class="form-label ">再次輸入新密碼</label> 
					<input type="password" class="confirmPassword form-control" id="confirmPassword" name="confirmPassword" style="font-size: 16px; padding: 8px; letter-spacing: 4px;" required>
				</div>
				<button type="submit" class="btn btn-primary mt-3 float-end">送出</button>
			</form>
		</div>
	</div>

	<%@ include file="/WEB-INF/footer.jspf"%>
</body>

</html>
