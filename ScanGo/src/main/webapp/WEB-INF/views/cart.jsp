<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>

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

.cart-item-details {
	-ms-grid-column: auto;
	-ms-grid-column-span: auto;
	grid-column: auto; /* 或者您可以尝试设置其他的具体值 */
}

.product-remove {
	margin-top: -10px;
	background-color: white;
    color: red;
	font-size: 15px;
	float: right;
}

.product-info {
	display: flex;
	flex-direction: column;
}

.product-price {
	margin-bottom: 5px; /* 调整金額和數量之间的垂直间距 */
}
</style>

<header class="navbar navbar-expand-lg navbar-light bg-light"
	style="position: fixed; top: 0; left: 0; width: 100%; z-index: 1000; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
	<div class="container-fluid">
		<button class="back-button" onclick="history.back()">
			<!-- 使用 "<" 符號 -->
			&lt;
		</button>
		<a class="navbar-brand mx-auto custom-font-size" href="#"> 購物車 </a>
	</div>
</header>

<main id="MainContent" class="content-for-layout">
	<div class="cart-page mt-100">
		<div class="container">
			<div class="cart-page-wrapper">
				<div class="row">
					<div class="col-lg-7 col-md-12 col-12">
						<table class="cart-table w-100">
							<thead>
								<tr>
									<th class="cart-caption heading_18">商品</th>
									<th class="cart-caption heading_18"></th>
									<th
										class="cart-caption text-center heading_18 d-none d-md-table-cell">數量</th>
									<th class="cart-caption text-end heading_18">金額</th>
								</tr>
							</thead>
							<tbody>
								<fn:forEach var="cartItem" items="${carts}">
									<tr class="cart-item">
										<td class="cart-item-media">
											<div class="mini-img-wrapper">
												<img class="mini-img"
													src="/ScanGo/image/product/snack/soda/coke.png" alt="img">
											</div>
										</td>
										<td class="cart-item-details">
											<h2 class="product-title">
												<a href="#"><fn:out
														value='${cartItem.product.productName}' /></a>
											</h2>
										</td>
										<td class="cart-item-quantity">
											<div class="quantity d-flex align-items-center justify-content-between">
												
												<form class="cart-form"
													action="${pageContext.request.contextPath}/mvc/updateCartByPost"
													method="post">
														<input type="hidden" name="situation"
														value="-">
														<input type="hidden" name="productId"
														value="${cartItem.product.productId}">
														<input type="hidden" name="productQuantity"
														id="quantityInput" value=${cartItem.productQuantity}>
													<button type="submit" class="qty-btn dec-qty">-</button>
												</form>
												
												
												<input class="qty-input" type="number" disabled="disabled" 
													name="productQuantity" value="${cartItem.productQuantity}"
													min="0">
													
												<form class="cart-form"
													action="${pageContext.request.contextPath}/mvc/updateCartByPost"
													method="post">
														<input type="hidden" name="situation"
														value="+">
														<input type="hidden" name="productId"
														value="${cartItem.product.productId}">
														<input type="hidden" name="productQuantity"
														id="quantityInput" value=${cartItem.productQuantity}>
													<button type="submit" class="qty-btn dec-qty">+</button>
												</form>
											</div>
										</td>
										
										
										<td class="cart-item-price text-end"
											data-total="${cartItem.product.price}">
											<div class="product-price">
											$${cartItem.product.price}
											</div>
										</td>
										<td>
										<form class="cart-form"
											  action="${pageContext.request.contextPath}/mvc/removeFromCart"
											  method="post">
											<input type="hidden" name="productId"
												   value="${cartItem.product.productId}">
											<button type="submit" class="product-remove">刪除</button>
										</form>
										</td>
									</tr>
									</fn:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-lg-5 col-md-12 col-12">
						<div class="cart-total-area">
							<h3 class="cart-total-title d-none d-lg-block mb-0">Cart
								Totals</h3>
							<div class="cart-total-box mt-4 mb-4">
								<div class="subtotal-item subtotal-box">
									<h4 class="subtotal-title">小計</h4>
									<p id="subtotal-value" class="subtotal-value">$${totalPrice}</p>
								</div>
								<div class="subtotal-item discount-box">
									<h4 class="subtotal-title">折扣</h4>
									<p class="subtotal-value"></p>
								</div>
								<hr />
								<div class="subtotal-item discount-box">
									<h4 class="subtotal-title">總計</h4>
									<p class="subtotal-value"></p>
								</div>
								<div class="d-flex justify-content-center mt-4">
									<a href="checkout.jsp"
										class="position-relative btn-primary text-uppercase"> 我要結帳
									</a>
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