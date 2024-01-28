<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/fragments/html_head.jspf"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	background-color: #fffefb;
}

main {
	flex-grow: 1;
}

.custom-font-size {
	font-size: 26px;
}

.product-price {
	float: right;
	font-size: 18px;
}

.product-vendor {
	font-size: 15px;
}

main {
	margin-top: 100px;
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
}

/* 模態框內容 */
.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 0px 10px 10px 10px;
	border-radius: 8px;
	overflow-y: auto;
	max-height: 60vh; /* 設置最大高度，以避免超出屏幕 */
	width: 100%;
	max-width: 600px;
	margin-top: 0;
	max-width: 90%;
    padding: 20px;
}

/* 模態框頭部，固定在模態框的頂部 */
.modal-header {
	background-color: #f5f4f1;
	z-index: 1;
	width: 100%;
	font-size: 20px;
	font-weight: 500;
}

/* 關閉按鈕樣式 */
.close {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

/* 確認清單 */
.checkout-summary-area {
    background: #f5f4f1;
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 更大的阴影效果 */
    border: 1px solid #555; /* 更明显的边框 */
    border-radius: 20px; /* 圓角 */
    margin-bottom: 50px;
}	

.checkout-bar li a {
    font-size: 20px;
}

.product-title a {
    font-size: 18px;
}

.quantity input, .product-price {
    font-size: 18px;
    color: #00668c;
}

.product-vendor {
    font-size: 18px;
}

.subtotal-title {
    font-size: 19px;
}

.subtotal-value{
	color: #00668c;
	font-size: 19px;
}

.coupon-item{
	border-radius: 10px;
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

<body>

<main id="MainContent" class="content-for-layout">
	<div class="checkout-page">
		<div class="container">
			<div class="checkout-page-wrapper">
				<div class="row">
					<div class="col-12">
						<div class="checkout-progress overflow-hidden ms-3">
							<ol class="checkout-bar px-0">
								<li class="progress-step step-done"><a href="cart.html">購物車</a></li>
								<li class="progress-step step-active"><a
									href="checkout.html">確認清單</a></li>
								<li class="progress-step step-todo"><a href="checkout.html">支付方式</a></li>
								<li class="progress-step step-todo"><a href="checkout.html">結帳完成</a></li>
							</ol>
						</div>


					</div>
					<div class="col-12">
						<div class="cart-total-area checkout-summary-area">
							<h3 class="d-none d-lg-block mb-0 text-center heading_24 mb-4">
								商品總覽</h3>
							<fn:forEach var="cartItem" items="${checkouts}">
								<div class="minicart-item d-flex">
									<div class="mini-img-wrapper">
										<img class="mini-img" src="${cartItem.product.picture}"
											alt="img">
									</div>
									<div class="product-info">
										<h2 class="product-title">
											<a href="#">${cartItem.product.productName}</a> <span
												class="product-price">$${cartItem.product.price}</span>
										</h2>
										<p class="product-vendor">x ${cartItem.productQuantity}</p>
									</div>
								</div>
							</fn:forEach>

							<div class="cart-total-box mt-4 bg-transparent p-0">
								<div class="subtotal-item subtotal-box">
									<h4 class="subtotal-title">小計</h4>
									<p class="subtotal-value">$${checkoutPrice}</p>
								</div>
								<div class="subtotal-item discount-box">
									<h4 class="subtotal-title">折扣</h4>
									<p id="discount-value" class="discount-value"></p>
								</div>
								<hr />
								<div class="subtotal-item discount-box">
									<h4 class="subtotal-title">總計</h4>
									<p id="discount-total-value" class="discount-total-value">$${checkoutPrice}</p>
								</div>


								<div class="mt-4 checkout-promo-code ">
									<a href="#" id="openModalBtn"
										class="btn-apply-code position-relative btn-secondary text-uppercase mt-3 fs-5">
										使用優惠券 </a>
								</div>

								<!-- 模態框 -->
								<div id="myModal" class="modal">
									<div class="modal-content">
										<div class="modal-header">
											<span class="close" onclick="closeModal()">&times;</span>
											<p class="fs-3">您可用的優惠</p>
										</div>
										<!-- 優惠券的內容部分 -->
										<c:forEach var="eligibleCoupons" items="${eligibleCoupons}">
											<div class="col-12">
												<div id="coupon-item-${eligibleCoupons.user_coupon_id}"
													class="coupon-item"
													data-user-coupon-id="${eligibleCoupons.user_coupon_id}"
													onclick="markSelectedCoupon(this)">
													<div class="coupon-icon">
														<img alt="coupon"
															src="/ScanGo/assets/img/coupon/coupon.png" width="50"
															height="50">
													</div>
													<div class="coupon-details">
														<h2 class="coupon-title">${eligibleCoupons.coupon.couponName}</h2>
														<span class="coupon-time">使用期限:
															${eligibleCoupons.coupon.endDate}</span>
													</div>
												</div>
											</div>
										</c:forEach>
										<button type="button" class="select-coupon btn btn-primary mt-5"
											style="background-color: #00234D"
											onclick="confirmCouponSelection()">確認</button>
									</div>
								</div>

							</div>

							<div class="shipping-address-area billing-area">
								<div
									class="minicart-btn-area d-flex align-items-center justify-content-between flex-wrap">
									<a href="/ScanGo/mvc/cart"
										class="checkout-page-btn minicart-btn btn-secondary fs-5">回到購物車</a>
									<a href="/ScanGo/mvc/payment"
										class="checkout-page-btn minicart-btn btn-primary fs-5">確認並結帳</a>
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
	
	// 存儲所選優惠券的 ID
    var selectedCouponId = null;

    // 標記所選優惠券
    function markSelectedCoupon(element) {
        // 移除之前所選標記
        var previousSelected = document.querySelector('.coupon-item.selected');
        if (previousSelected) {
            previousSelected.classList.remove('selected');
        }

        // 標記新選擇的優惠券
        element.classList.add('selected');

        // 存儲所選優惠券的 ID
        selectedCouponId = element.getAttribute('data-user-coupon-id');
    }

    // 確認按鈕被點擊時
    function confirmCouponSelection() {
        if (selectedCouponId) {
        	 var subtotalValue = document.querySelector('.subtotal-value').textContent;
        	 
            sendCouponSelection(selectedCouponId, subtotalValue);
        } else {
            alert('請選擇優惠券');
        }
    }

    // 發送優惠券選擇請求
    function sendCouponSelection(user_coupon_id, subtotalValue) {
    	
    	subtotalValue = subtotalValue.substring(1);
    	
        const data = {
            "user_coupon_id": user_coupon_id,
            "subtotalValue": subtotalValue
        };

        const options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        };

        fetch('${pageContext.request.contextPath}/mvc/cart/couponSelection', options)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
			console.log(data);
            
			var discountValue = document.getElementById("discount-value");
			discountValue.textContent = '- $' + data.discountValue;
	    	
	    	var discountTotalPrice = document.getElementById("discount-total-value");
	    	
	    	discountTotalPrice.textContent = '$' + data.discountTotalPrice;
           
	    	closeModal();
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
    }

	
</script> 


</body>