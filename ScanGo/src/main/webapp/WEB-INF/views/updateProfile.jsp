<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/header.jspf"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>會員資訊</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.breadcrumb {
	background-color: white; /* 使用整體背景色 */
	padding: 10px; /* 調整內邊距 */
}

.breadcrumb a {
	color: #007bff; /* 超連結文字顏色 */
}

.breadcrumb a:hover {
	color: #0056b3; /* 鼠標懸停時的文字顏色 */
}

.member-area {
	padding: 50px 0;
}

.member-area-inner {
	border: 1px solid #ddd; /* 邊框效果 */
	border-radius: 8px; /* 圓角 */
	padding: 20px; /* 內邊距 */
	margin-bottom: 20px;
	background-color: #DCDCDC;
}

.member-content {
	margin-bottom: 15px;
}

.title {
	color: #555;
}

.subtitle {
	color: #555;
}

#passwordChange {
	max-width: 400px; /* 調整表單寬度 */
	margin: 0 auto; /* 水平居中 */
}

.comfirmButton {
	background-color: #007bff; /* 使用 Bootstrap 的原生顏色 */
	color: #fff; /* 文字顏色 */
}

.error-message {
	color: red;
}

label {
	font-size: 18px !important;
	margin-left: 5px;
	letter-spacing: 5px !important;
}

.form-control{
	font-size: 16px; 
	padding: 8px; 
	letter-spacing: 4px;
}
</style>
</head>
<body>
	<main id="MainContent" class="content-for-layout vh-100">
		<!-- breadcrumb start -->
		<div class="breadcrumb">
			<div class="container">
				<ul class="list-unstyled d-flex align-items-center m-0">
					<li><a href="/ScanGo/index.jsp">首頁</a></li>
					<li><svg class="icon icon-breadcrumb" width="64" height="64"
							viewBox="0 0 64 64" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                        <g opacity="0.4">
                            <path
								d="M25.9375 8.5625L23.0625 11.4375L43.625 32L23.0625 52.5625L25.9375 55.4375L47.9375 33.4375L49.3125 32L47.9375 30.5625L25.9375 8.5625Z"
								fill="#000" />
                        </g>
                    </svg></li>
					<li>會員資訊</li>
				</ul>
			</div>
		</div>
		<!-- breadcrumb end -->

		<form
			action="${pageContext.request.contextPath}/mvc/member/updateProfile"
			method="post">
			<div class="member-area pt-5 pb-5">
				<div class="container">
					<div class="member-area-inner">
						<p class="text-center text-danger fs-5" id="errorMessage">${error}</p>
						<p class="text-center text-success fs-5" id="successMessage">${message}</p>
						<div class="section-header member-area-header text-center mb-5">
							<h2 class="section-heading">修改會員資料</h2>
						</div>
						<div class="row">
							<div class="col-md-6 offset-md-3">
								<input type="hidden" name="userId" value="${user.userId}">
								<div class="form-group">
									<label for="username">帳號:</label> <input type="text"
										id="username" name="username" class="form-control"
										value="${user.username}" disabled>
								</div>
								<div class="form-group">
									<label for="email">信箱:</label> <input type="email" id="email"
										name="email" class="form-control" value="${user.email}">
								</div>

								<div class="form-group">
									<label for="phone">手機:</label> <input type="text" id="phone"
										name="phone" class="form-control" value="${user.phone}"
										required>
								</div>
								<div class="form-group">
									<label for="birthday">生日:</label> <input type="date"
										id="birthday" name="birthday" class="form-control"
										value="<fmt:formatDate value='${user.birthday}' pattern='yyyy-MM-dd' />"
										required>
								</div>

								<button type="submit" class="btn-primary d-block ms-auto"
								style="background-color: #00234D; color: #fff; font-size: 16px ">確認修改</button>

							</div>
						</div>

					</div>
				</div>
			</div>
		</form>
	</main>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	<%@ include file="/WEB-INF/footer.jspf"%>
</body>
</html>
