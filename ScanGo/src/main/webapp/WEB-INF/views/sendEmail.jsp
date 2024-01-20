<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>忘記密碼</title>
    <!-- 引入 Bootstrap 5 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>
</head>
<body>

<div class="container mt-5">
    <h1 class="mb-4">忘記密碼</h1>

    <!-- 忘記密碼表單 -->
    <form id="sendEmailForm" action="${pageContext.request.contextPath}/mvc/auth/sendEmail" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">請輸入您的電子信箱：</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>

        <button type="submit" class="btn btn-primary">提交</button>
    </form>

    <!-- Bootstrap 5 Modal -->
    <div class="modal" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">發送成功</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <!-- Modal Body -->
                <div class="modal-body">
                    <p>電子郵件已成功發送！</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 引入 Bootstrap 5 JavaScript，注意要先引入 Popper.js 和 jQuery -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<!-- JavaScript 代碼 -->
<script>
    $(document).ready(function () {
        // 提交表單後顯示模態框
        $("#forgotPasswordForm").submit(function (event) {
            event.preventDefault(); // 防止表單直接提交
            // 在這裡添加表單處理邏輯，例如 AJAX 請求
            // 成功後顯示模態框
            var successModal = new bootstrap.Modal(document.getElementById('successModal'));
            successModal.show();
        });
    });
</script>

<%@ include file="/WEB-INF/footer.jspf"%>
</body>
</html>
