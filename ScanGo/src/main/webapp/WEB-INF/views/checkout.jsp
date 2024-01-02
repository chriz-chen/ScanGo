<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/fragments/html_head.jspf"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
/* 添加一個自定義的樣式，命名為custom-font-size */
.custom-font-size {
	font-size: 26px; /* 設置初始字體大小 */
}

main {
	margin-top: 100px; /* 假設 header 的高度為 60px，請根據實際情況調整這個值 */
}

/* 隱藏模態框 */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	/* 背景半透明黑色 */
}

/* 模態框內容 */
.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
}

/* 關閉按鈕樣式 */
.close {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}
</style>

<header class="navbar navbar-expand-lg navbar-light bg-light"
	style="position: fixed; top: 0; left: 0; width: 100%; z-index: 1000; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
	<div class="container-fluid">
		<button class="back-button" onclick="history.back()">
			<!-- 使用 "<" 符號 -->
			&lt;
		</button>
		<a class="navbar-brand mx-auto custom-font-size" href="#"> 確認清單 </a>
	</div>
</header>

<main id="MainContent" class="content-for-layout">
	<div class="checkout-page">
		<div class="container">
			<div class="checkout-page-wrapper">
				<div class="row">
					<div class="col-xl-9 col-lg-8 col-md-12 col-12">
						<div class="checkout-progress overflow-hidden">
							<ol class="checkout-bar px-0">
								<li class="progress-step step-done"><a href="cart.html">購物車</a></li>
								<li class="progress-step step-active"><a
									href="checkout.html">確認清單</a></li>
								<li class="progress-step step-todo"><a href="checkout.html">支付方式</a></li>
								<li class="progress-step step-todo"><a href="checkout.html">Review</a></li>
							</ol>
						</div>


					</div>
					<div class="col-xl-3 col-lg-4 col-md-12 col-12">
						<div class="cart-total-area checkout-summary-area">
							<h3 class="d-none d-lg-block mb-0 text-center heading_24 mb-4">
								商品總覽
								</h4>

								<div class="minicart-item d-flex">
									<div class="mini-img-wrapper">
										<img class="mini-img"
											src="assets/img/products/furniture/1.jpg" alt="img">
									</div>
									<div class="product-info">
										<h2 class="product-title">
											<a href="#">Eliot Reversible Sectional</a>
										</h2>
										<p class="product-vendor">$580 x 1</p>
									</div>
								</div>
								<div class="minicart-item d-flex">
									<div class="mini-img-wrapper">
										<img class="mini-img"
											src="assets/img/products/furniture/2.jpg" alt="img">
									</div>
									<div class="product-info">
										<h2 class="product-title">
											<a href="#">Eliot Reversible Sectional</a>
										</h2>
										<p class="product-vendor">$370 x 1</p>
									</div>
								</div>
								<div class="minicart-item d-flex">
									<div class="mini-img-wrapper">
										<img class="mini-img"
											src="assets/img/products/furniture/3.jpg" alt="img">
									</div>
									<div class="product-info">
										<h2 class="product-title">
											<a href="#">Eliot Reversible Sectional</a>
										</h2>
										<p class="product-vendor">$580 x 1</p>
									</div>
								</div>
								<div class="minicart-item d-flex">
									<div class="mini-img-wrapper">
										<img class="mini-img"
											src="assets/img/products/furniture/4.jpg" alt="img">
									</div>
									<div class="product-info">
										<h2 class="product-title">
											<a href="#">Eliot Reversible Sectional</a>
										</h2>
										<p class="product-vendor">$370 x 1</p>
									</div>
								</div>

								<div class="cart-total-box mt-4 bg-transparent p-0">
									<div class="subtotal-item subtotal-box">
										<h4 class="subtotal-title">小計</h4>
										<p class="subtotal-value">$1900.00</p>
									</div>
									<div class="subtotal-item discount-box">
										<h4 class="subtotal-title">折扣</h4>
										<p class="subtotal-value">- $100.00</p>
									</div>
									<hr />
									<div class="subtotal-item discount-box">
										<h4 class="subtotal-title">總計</h4>
										<p class="subtotal-value">$1800.00</p>
									</div>


									<div class="mt-4 checkout-promo-code">
										<a href="#" id="openModalBtn"
											class="btn-apply-code position-relative btn-secondary text-uppercase mt-3">
											使用優惠券 </a>
									</div>

									<!-- 模態框 -->
									<div id="myModal" class="modal">
										<div class="modal-content">
											<span class="close" onclick="closeModal()">&times;</span>
											<p>您可用的優惠</p>
										</div>
									</div>

								</div>

								<div class="shipping-address-area billing-area">
									<div
										class="minicart-btn-area d-flex align-items-center justify-content-between flex-wrap">
										<a href="/ScanGo/mvc/cart"
											class="checkout-page-btn minicart-btn btn-secondary">回到購物車</a>
										<a href="payment.jsp"
											class="checkout-page-btn minicart-btn btn-primary">確認並結帳</a>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="/WEB-INF/footer.jspf"%>

<script>
	// 顯示模態框
	function openModal() {
		document.getElementById("myModal").style.display = "block";
	}

	// 關閉模態框
	function closeModal() {
		document.getElementById("myModal").style.display = "none";
	}

	// 點擊按鈕時顯示模態框
	document.getElementById("openModalBtn").addEventListener("click",
			function(event) {
				event.preventDefault(); // 防止點擊按鈕時跳轉到 "#"
				openModal();
			});
</script>