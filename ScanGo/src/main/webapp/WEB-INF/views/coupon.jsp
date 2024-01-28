<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/header.jspf"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
body {
	background-color: #fffefb;
}

.coupon-time {
	background-color: #f2f2f2;
	padding: 5px;
	border-radius: 10px;
}

.getCoupon {
	padding: 8px 15px;
	border-radius: 10px;
	margin: 20 auto;
	border: 1px solid #555 !important;
}

footer {
	bottom: 0;
}

.coupon-area {
	margin-bottom: 10px;
}

.coupon-item {
	background-color: #f5f4f1;
	border-radius: 17px;	
}

/* 領取彈出框 */
#couponForm{
	background-color: #f5f4f1;
	border-radius: 20px;
}
.modal-title{
	margin-left: 8px;
	font-size: 24px;
	letter-spacing: 1px;
}

.form-control{
	font-size: 18px;
	letter-spacing: 2px;
}

.submitbtn{
	background-color: #00234D;
}


</style>

<body>
	<!-- breadcrumb start -->
	<div class="breadcrumb">
		<div class="container">
			<ul class="list-unstyled d-flex align-items-center m-0">
				<li><a href="/ScanGo/index.jsp">首頁</a></li>
				<li><svg class="icon icon-breadcrumb" width="64" height="64"
						viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
            <g opacity="0.4">
              <path
							d="M25.9375 8.5625L23.0625 11.4375L43.625 32L23.0625 52.5625L25.9375 55.4375L47.9375 33.4375L49.3125 32L47.9375 30.5625L25.9375 8.5625Z"
							fill="#000" />
            </g>
          </svg></li>
				<li>優惠券</li>
			</ul>
		</div>
	</div>
	<!-- breadcrumb end -->

	<div class="container mt-4">
	<div class="row mt-4">
		<div class="col-12 d-flex justify-content-center">
			<button type="button" class="getCoupon btn btn-warning btn-lg" data-bs-toggle="modal"
				data-bs-target="#getCouponModal">獲取優惠券</button>
		</div>
	</div>
	
	<!-- 提示訊息區域 -->
		<div id="alertMessage" class="alert alert-success mt-3" role="alert" style="display: none;">
		    ${not empty message ? message : ''}
		</div>
	
		<!-- coupon start -->
		<div class="coupon-area vh-100">
			<div class="row justify-content-center">
				<c:forEach var="couponUser" items="${couponUser}">
					<div class="col-12">
						<div class="coupon-item">
							<div class="coupon-icon">
								<img alt="coupon" src="/ScanGo/assets/img/coupon/coupon.png"
									width="50" height="50">
							</div>
							<div class="coupon-details">
								<h2 class="coupon-title">${couponUser.coupon.couponName}</h2>
								<h5 class="coupon-info mb-3">結帳金額滿$${couponUser.coupon.minPurchaseAmount}，${couponUser.coupon.description}(全館商品適用)</h5>
								<span class="coupon-time">使用期限:
									${couponUser.coupon.endDate}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- coupon end -->

		


		<!-- Modal -->
		<div class="modal fade" id="getCouponModal" tabindex="-1"
			role="dialog" aria-labelledby="couponModalLabel" aria-hidden="true">
			<div class="modal-dialog mt-5" role="document">
				<div class="modal-content">
					<form id="couponForm" action="${pageContext.request.contextPath}/mvc/getCoupon"
						method="post">
						<div class="modal-header">
							<h5 class="modal-title" id="couponModalLabel">優惠券代碼</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<!-- 優惠券代碼輸入框 -->
							<input type="text" class="form-control fs-5" id="couponCodeInput"
								name="code" placeholder="請輸入優惠券代碼">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">關閉</button>
							<button type="submit" class="btn submitbtn" style="color: white;">送出</button>
						</div>
					</form>
				</div>
			</div>
		</div>


	</div>
</body>
<script>

$(document).ready(function() {
    var message = '${not empty message ? message : ''}';
    if (message) {
        $('#alertMessage').show();
    }
});

</script>

<%@ include file="/WEB-INF/footer.jspf"%>