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
body{
	background-color: #fffefb;
}

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
	border-radius: 20px; /* 圓角 */
	padding: 20px; /* 內邊距 */
	margin-bottom: 20px;
	background-color: #f5f4f1;
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 更大的阴影效果 */
    border: 1px solid #555; /* 更明显的边框 */
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

.btn{
	background-color: #00668c;
}
.form-control:disabled, .form-control[readonly] {
    background-color: #fffefb;
    opacity: 1;
}

/* 密碼model框 */
.modal-content{
	border-radius: 20px; /* 圓角 */
	padding: 20px; /* 內邊距 */
	margin-bottom: 20px;
	background-color: #f5f4f1;
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 更大的阴影效果 */
    border: 1px solid #555; /* 更明显的边框 */
}

</style>
</head>
<body>
	<main id="MainContent" class="content-for-layout vh-100">
		<!-- breadcrumb start -->
		<div class="breadcrumb">
			<div class="container">
				<ul class="list-unstyled d-flex align-items-center m-0">
					<li><a href="/ScanGo/mvc/index">首頁</a></li>
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

		<form modelAttribute="updateUser"
			action="${pageContext.request.contextPath}/mvc/member/updateProfile"
			method="post">
			<div class="member-area pt-5 pb-5">
				<div class="container">
					<div class="member-area-inner">
						<div class="section-header member-area-header text-center mb-2">
							<h2 class="section-heading">會員資料</h2>
						</div>
						<div>
							<p class="text-center text-success fs-5" id="successMessage">${message}</p>
							<p class="text-center text-danger fs-5" id="errorMessage">${error}</p>
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
										name="email" class="form-control" value="${user.email}" disabled>
								</div>

								<div class="form-group">
									<label for="phone">手機:</label> <input type="text" id="phone"
										name="phone" class="form-control" value="${user.phone}"
										disabled>
								</div>
								<div class="form-group">
									<label for="birthday">生日:</label> <input type="date"
										id="birthday" name="birthday" class="form-control"
										value="<fmt:formatDate value='${user.birthday}' pattern='yyyy-MM-dd' />"
										disabled>
								</div>
								
								<div class="text-center mt-4">
									<button type="button" class="btn btn-lg m-1" style="background-color: #00234D; color: #fff; font-size: 16px"
										data-toggle="modal" data-target="#passwordChangeModal">密碼變更
									</button> 
									<button type="button" class="btn btn-lg m-1" style="background-color: #00234D; color: #fff; font-size: 16px" 
									onclick="window.location.href='${pageContext.request.contextPath}/mvc/member/updateProfile'">修改會員資料
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		
		<!-- 密碼變更 Modal -->
		<div class="modal fade " id="passwordChangeModal" tabindex="-1"
			role="dialog" aria-labelledby="passwordChangeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				
				    <p class="text-center text-danger fs-5 mt-2" id="message">${error}</p>
				    
					<div class="modal-header ">
						<h5 class="modal-title fs-2" id="passwordChangeModalLabel" style="letter-spacing: 1px">密碼變更</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<div class="modal-body">
						<!-- 密碼變更的表單-->
						<form id="changePasswordForm" class="form" method="post"
						      action="${pageContext.request.contextPath}/mvc/member/change_password">
						    
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
						    <button type="button" id="confirmButton" class="btn ms-auto" style="background-color: #00234D; color: #fff;">確認變更</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>



	<script>
	$(document).ready(function() {
	    $("#confirmButton").click(function() {
	    	
	    	console.log($("#changePasswordForm").attr("action"));
	    	
	        // 使用 AJAX 發送表單數據，可以局部更新HTML元素的內容
	        $.ajax({
	            type: "POST",
	            url: $("#changePasswordForm").attr("action"),
	            data: $("#changePasswordForm").serialize(),
	            success: function(response) {
	            	if(response.errorMessage != '') {
	            		$("#message").text(response.errorMessage);
	            		$("#message").addClass('text-danger');
	            		$("#message").removeClass('text-success');
	            	} else {
	            		$("#message").text(response.successMessage);
	            		$("#message").addClass('text-success');
	            		$("#message").removeClass('text-danger');
	            	}
	            },
	            error: function(xhr, status, error) {
	                $("#message").text("錯誤：" + xhr.responseText);
	                $("#message").addClass('text-danger');
	        		$("#message").removeClass('text-success');
	            }
	        });
	    });
	});
	</script>
	
	<%@ include file="/WEB-INF/footer.jspf"%>
</body>
</html>




