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
					<li>商店平面圖</li>
				</ul>
			</div>
		</div>
		<!-- breadcrumb end -->

		<div class="member-area pt-5 pb-5">
			<div class="container">
				<div class="member-area-inner">
					<div class="section-header member-area-header text-center mb-5">
						<h2 class="section-heading">會員資訊</h2>
					</div>
					<div class="row">
						<div class="col-md-6 offset-md-3">
							<div class="member-content text-center">
								<h4 class="title">帳號</h4>
								<p class="information">${ user.username }</p>
							</div>
							<div class="member-content text-center">
								<h4 class="title">信箱</h4>
								<p class="information">${ user.email }</p>
							</div>
							<div class="member-content text-center">
								<h4 class="title">手機</h4>
								<p class="information">${ user.phone }</p>
							</div>
							<div class="member-content text-center">
								<h4 class="title">生日</h4>
								<p class="information">
									<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" />
								</p>
							</div>
							<!-- 按鈕觸發 Modal -->
							<div class="text-center mt-4">
								<input type="button" onclick="ScanGo/mvc/member/change_password" value="變更密碼">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#passwordChangeModal">密碼變更
								</button> 
							</div>
						</div>
					</div>
					
					<!-- 密碼變更 Modal -->
					<div class="modal fade " id="passwordChangeModal" tabindex="-1"
						role="dialog" aria-labelledby="passwordChangeModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header ">
									<h5 class="modal-title " id="passwordChangeModalLabel">密碼變更</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								
								<div class="modal-body">
									<!-- 密碼變更的表單-->
									<form id="changePasswordForm" class="form" method="post"
									      action="${pageContext.request.contextPath}/mvc/member/change_password">
									    <p class="text-center text-danger fs-5" id="errorMessage"></p>
									    <p class="text-center text-success fs-5" id="successMessage"></p>
									    <div class="form-group">
									        <label for="oldPassword">舊密碼:</label>
									        <input type="password" id="oldPassword" name="oldPassword" class="form-control" required>
									    </div>
									    <div class="form-group">
									        <label for="newPassword">新密碼:</label>
											<input type="password" id="newPassword" name="newPasswords" class="form-control" required>
									    </div>
									    <div class="form-group">
									        <label for="confirmPassword">確認新密碼:</label>
									        <input type="password" id="confirmPassword" name="newPasswords" class="form-control" required>
									    </div>
									    <button type="button" id="confirmButton" class="btn btn-primary">確認變更</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	<%@ include file="/WEB-INF/footer.jspf"%>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

/*
var errormessage = '${ errorMessage }';
var modal = new bootstrap.Modal(document.getElementById('passwordChangeModal'), {
	keyboard: false
});
if(errormessage != '') {
	modal.show();
}*/

$(document).ready(function() {
    $("#confirmButton").click(function() {
        // 使用 AJAX 發送表單數據，可以局部更新HTML元素的內容
        $.ajax({
            type: "POST",
            url: $("#changePasswordForm").attr("action"),
            data: $("#changePasswordForm").serialize(),
            success: function(response) {
            	$("#errorMessage").text(response.errorMessage);
            	$("#successMessage").text(response.successMessage);
            },
            error: function(xhr, status, error) {
                $("#errorMessage").text("錯誤：" + xhr.responseText);
            }
        });
    });
});
</script>
