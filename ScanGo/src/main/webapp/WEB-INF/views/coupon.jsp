<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
.coupon-time {
	background-color: #f2f2f2;
	padding: 5px;
	border-radius: 10px;
}

footer {
	bottom: 0;
}

.coupon-area {
	margin-bottom: 10px;
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

	<!-- coupon start -->
	<div class="coupon-area container mt-4 vh-100">
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
							<span class="coupon-time">使用期限: ${couponUser.coupon.endDate}</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- coupon end -->
</body>

<%@ include file="/WEB-INF/footer.jspf"%>