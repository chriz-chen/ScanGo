<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>重設密碼</title>
<!-- head -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>

</head>
<body>

	<div class="mx-md-5 mx-3">
	<div class="row justify-content-center">
		<div class="container-fluid p-md-4 p-2 text-center">

				<!-- 重設密碼表單 -->
				<form method="post"
					action="${pageContext.request.contextPath}/mvc/auth/resetPassword"
					class="container bg-white" id="passwordForm">
					<div class="w-75 pt-5 pb-4 text-start mx-auto">
						<h4 class="fw-bold mb-4">重設密碼</h4>
						<p class="text-center text-danger">${ message }</p>

						<div class="mb-3">
							<label for="totp">驗證碼</label> <input type="text" name="totp" />
						</div>

						<div class="mb-3">
							<label for="password">新密碼</label> <input type="password"
								name="password" />
						</div>

						<div class="mb-3">
							<label for="confirmPassword">再次輸入新密碼</label> <input
								type="password" name="confirmPassword" />
						</div>

						<div class="w-100 d-flex justify-content-center">
							<button type="submit">重設</button>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/footer.jspf"%>
</body>

</html>