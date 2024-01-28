<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/fragments/html_head.jspf"%>

<style>
/* 添加一個自定義的樣式，命名為custom-font-size */
.custom-font-size {
	font-size: 26px;
}

.payment-icon {
    width: 70px;
    height: 50px;*/
    margin-right: 10px;
}

main {
	margin-top: 90px;
}

.back-button {
	font-size: 18px;
}

.modal-footer button[type="submit"] {
    background-color: #00234D; 
    color: #fff;
    border-radius: 10px; 
    padding: 8px 15px;
    font-size: 16px;
}

</style>

<header class="navbar navbar-expand-lg navbar-light bg-light"
	style="position: fixed; top: 0; left: 0; width: 100%; height: 65px; z-index: 1000; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
	<div class="container-fluid">
		<button class="back-button" onclick="history.back()">
			<!-- 使用 "<" 符號 -->
			&lt;
		</button>
		<a class="navbar-brand mx-auto custom-font-size" href="#"> 支付方式 </a>
	</div>
</header>

<main id="MainContent" class="content-for-layout">
	<div class="cart-page">
		<div class="container">
			<div class="cart-page-wrapper">
				<div class="row">
					<div class="col-xl-9 col-lg-8 col-md-12 col-12">
						<!-- 商品列表部分改為選擇支付方式的表格 -->
						<form id="paymentForm" action="checkout.html" method="post">
							<div class="checkout-progress overflow-hidden">
								<ol class="checkout-bar px-0">
									<li class="progress-step step-done"><a href="cart.html">購物車</a></li>
									<li class="progress-step step-done"><a
										href="checkout.html">確認清單</a></li>
									<li class="progress-step step-active"><a
										href="checkout.html">支付方式</a></li>
									<li class="progress-step step-todo"><a
										href="checkout.html">結帳完成</a></li>
								</ol>
							</div>

							<div class="payment-methods mt-4">
								<h3 class="mb-3">選擇支付方式</h3>
								<div class="form-check">
									<div class="payment-option">
										<input class="form-check-input" type="radio"
											name="paymentMethod" id="creditCard" value="creditCard"
											checked> <label class="form-check-label"
											for="creditCard"> <img
											src="/ScanGo/image/payment/creditcard.png"
											class="payment-icon" alt="Credit Card"> 信用卡支付
										</label>
									</div>
								</div>

								<div class="form-check">
									<div class="payment-option">
										<input class="form-check-input" type="radio"
											name="paymentMethod" id="paypal" value="paypal">
											<label class="form-check-label" for="paypal"> <img
											src="/ScanGo/image/payment/paypal.png"
											class="payment-icon" alt="Paypal"> PayPal
										</label>
									</div>
								</div>

								<div class="form-check">
									<div class="payment-option">
										<input class="form-check-input" type="radio"
											name="paymentMethod" id="linePay" value="linePay"> <label
											class="form-check-label" for="linePay"> <img
											src="/ScanGo/image/payment/linepay.png"
											class="payment-icon" alt="Line Pay"> Line Pay
										</label>
									</div>
								</div>
								<!-- 添加其他支付方式的表單選擇 -->

							</div>
						</form>
					</div>

				</div>
				<div class="col-lg-5 col-md-12 col-12">
					<div class="cart-total-area">
						<h3 class="cart-total-title d-none d-lg-block mb-0">
							Cart Totals
							</h3>
							<div class="cart-total-box mt-4">
								<div class="subtotal-item subtotal-box">
									<h4 class="subtotal-title">金額</h4>
									<p class="subtotal-value">$${discountTotalPrice}</p>
									<div class="d-flex justify-content-center mt-4">
										<button type="button"
											class="position-relative btn-primary text-uppercase"
											data-bs-toggle="modal" data-bs-target="#paymentModal">
											確認付款</button>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1"
	aria-labelledby="paymentModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="paymentModalLabel">確認付款</h5>
			</div>
			<div class="modal-body">送出後將從您的帳戶進行扣款</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					data-bs-dismiss="modal">取消</button>
				<form class="payment-form"
					  action="${pageContext.request.contextPath}/mvc/addToOrder"
					  method="post">
				<button type="submit">確認</button>
				</form>
			</div>
		</div>
	</div>
</div>


<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<%@ include file="/WEB-INF/footer.jspf"%>