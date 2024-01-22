<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>忘記密碼</title>
<!-- 引入 Bootstrap 5 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style type="text/css">
#sendEmailForm {
	background-color: #DCDCDC;
	border-radius: 10px;
	width: 100%;
	max-width: 450px;
	height: 400px;
	margin-top: 100px 
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
			<!-- 忘記密碼輸入信箱表單 -->
			<form id="sendEmailForm" class="justify-content-center p-4"
				action="${pageContext.request.contextPath}/mvc/auth/sendEmail"
				method="post">
			<p class="text-center text-danger fs-5">${ message }</p>
				<div class="mb-3 justify-content-center align-items-center text-center">
					<h1 class="mb-4 mt-4">忘記密碼</h1>
				</div>
				<label for="email" class="form-label mt-5">請輸入電子信箱：</label> <input
					type="email" class="form-control" id="email" name="email"
					style="font-size: 16px; padding: 8px; letter-spacing: 4px;"
					required>
				<button type="submit" class="btn btn-primary mt-3  float-end">送出</button>
			</form>

			<!-- <!-- Bootstrap 5 Modal
			<div class="modal" id="successModal" tabindex="-1"
				aria-labelledby="successModalLabel" aria-hidden="true" >
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						Modal Header
						<div class="modal-header">
							<h2 class="modal-title" id="successModalLabel">發送成功</h2>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						Modal Body
						<div class="modal-body">
						    <h3>電子郵件已成功發送！</h3>
						</div>
						Modal Footer
						<div class="modal-footer">
						    <button type="button" class="btn btn-primary" id="confirmButton">確認</button>
						</div>

					</div>
				</div>
			</div> -->
		</div>
	</div>



	<!-- 引入 Bootstrap 5 JavaScript，注意要先引入 Popper.js 和 jQuery -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

	<!-- JavaScript 代碼 -->
	<!-- <script>
		$(document).ready(
		function() {
		// 提交表單後顯示模態框
		$("#sendEmailForm").submit(
			function(event) {
				event.preventDefault(); // 防止表單直接提交
				// 在這裡添加表單處理邏輯，例如 AJAX 請求
				// 成功後顯示模態框
				var successModal = new bootstrap.Modal(document
						.getElementById('successModal'));
				successModal.show();
			});
		});
		
		// 模態框確認按鈕點擊事件
	    $("#confirmButton").click(function() {
	        // 這裡觸發原本表單的提交
	        $("#sendEmailForm").off("submit").submit();
	    });
	</script> -->

	<%@ include file="/WEB-INF/footer.jspf"%>
</body>
</html>
