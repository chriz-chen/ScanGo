<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/fragments/html_head.jspf"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
    /* 添加一個自定義的樣式，命名為custom-font-size */
    .custom-font-size {
      font-size: 26px; /* 設置初始字體大小 */
    }

    main {
      margin-top: 100px; /* 假設 header 的高度為 60px，請根據實際情況調整這個值 */
    }
    
    .product-remove a {
      color: red; /* 設定刪除按鈕文字為紅色 */
    }
    
  </style>

<header class="navbar navbar-expand-lg navbar-light bg-light" 
		style="position: fixed; top: 0; left: 0; width: 100%; 
		z-index: 1000; 
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
  <div class="container-fluid">
    <button class="back-button" onclick="history.back()">
      <!-- 使用 "<" 符號 -->
      &lt;
    </button>
    <a class="navbar-brand mx-auto custom-font-size" href="#">
      購物車
    </a>
  </div>
</header>

<main id="MainContent" class="content-for-layout">
	<div class="cart-page">
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
										class="cart-caption text-center heading_18 d-none d-md-table-cell">
										數量</th>
									<th class="cart-caption text-end heading_18">價格</th>
								</tr>
							</thead>

							<tbody>
								<tr class="cart-item">
									<td class="cart-item-media">
										<div class="mini-img-wrapper">
											<img class="mini-img"
												src="assets/img/products/furniture/1.jpg" alt="img">
										</div>
									</td>
									<td class="cart-item-details">
										<h2 class="product-title">
											<a href="#">Eliot Reversible Sectional</a>
										</h2>
										<p class="product-vendor">XS / 淺灰</p>
									</td>
									<td class="cart-item-quantity">
										<div
											class="quantity d-flex align-items-center justify-content-between">
											<button class="qty-btn dec-qty">
												<img src="assets/img/icon/minus.svg" alt="minus">
											</button>
											<input class="qty-input" type="number" name="qty" value="1"
												min="0">
											<button class="qty-btn inc-qty">
												<img src="assets/img/icon/plus.svg" alt="plus">
											</button>
									</td>
									<td class="cart-item-price text-end">
										<div class="product-price">$580.00</div>
										 <div class="product-remove mt-2">
                        					<a href="#">刪除</a>
									</td>
								</tr>
								<tr class="cart-item">
									<td class="cart-item-media">
										<div class="mini-img-wrapper">
											<img class="mini-img"
												src="assets/img/products/furniture/2.jpg" alt="img">
										</div>
									</td>
									<td class="cart-item-details">
										<h2 class="product-title">
											<a href="#">Vita Lounge Chair</a>
										</h2>
										<p class="product-vendor">XS / 粉紅</p>
									</td>
									<td class="cart-item-quantity">
										<div
											class="quantity d-flex align-items-center justify-content-between">
											<button class="qty-btn dec-qty">
												<img src="assets/img/icon/minus.svg" alt="minus">
											</button>
											<input class="qty-input" type="number" name="qty" value="1"
												min="0">
											<button class="qty-btn inc-qty">
												<img src="assets/img/icon/plus.svg" alt="plus">
											</button>
									</td>
									<td class="cart-item-price text-end">
										<div class="product-price">$370.00</div>
										<div class="product-remove mt-2">
                        					<a href="#">刪除</a>
									</td>
								</tr>
								<tr class="cart-item">
									<td class="cart-item-media">
										<div class="mini-img-wrapper">
											<img class="mini-img"
												src="assets/img/products/furniture/3.jpg" alt="img">
										</div>
									</td>
									<td class="cart-item-details">
										<h2 class="product-title">
											<a href="#">Sarno Dining Chair</a>
										</h2>
										<p class="product-vendor">XS / 淺灰</p>
									</td>
									<td class="cart-item-quantity">
										<div
											class="quantity d-flex align-items-center justify-content-between">
											<button class="qty-btn dec-qty">
												<img src="assets/img/icon/minus.svg" alt="minus">
											</button>
											<input class="qty-input" type="number" name="qty" value="1"
												min="0">
											<button class="qty-btn inc-qty">
												<img src="assets/img/icon/plus.svg" alt="plus">
											</button>
									</td>
									<td class="cart-item-price text-end">
										<div class="product-price">$370.00</div>
										<div class="product-remove mt-2">
                        					<a href="#">刪除</a>
									</td>
								</tr>
								<tr class="cart-item">
									<td class="cart-item-media">
										<div class="mini-img-wrapper">
											<img class="mini-img"
												src="assets/img/products/furniture/4.jpg" alt="img">
										</div>
									</td>
									<td class="cart-item-details">
										<h2 class="product-title">
											<a href="#">Eliot Reversible Sectional</a>
										</h2>
										<p class="product-vendor">XS / 淺灰</p>
									</td>
									<td class="cart-item-quantity">
										<div
											class="quantity d-flex align-items-center justify-content-between">
											<button class="qty-btn dec-qty">
												<img src="assets/img/icon/minus.svg" alt="minus">
											</button>
											<input class="qty-input" type="number" name="qty" value="1"
												min="0">
											<button class="qty-btn inc-qty">
												<img src="assets/img/icon/plus.svg" alt="plus">
											</button>
									</td>
									<td class="cart-item-price text-end">
										<div class="product-price">$580.00</div>
										<div class="product-remove mt-2">
                        					<a href="#">刪除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-lg-5 col-md-12 col-12">
						<div class="cart-total-area">
							<h3 class="cart-total-title d-none d-lg-block mb-0">
								Cart Totals
								</h4>
								<div class="cart-total-box mt-4">
									<div class="subtotal-item subtotal-box">
										<h4 class="subtotal-title">小計</h4>
										<p class="subtotal-value">$1900.00</p>
										<div class="d-flex justify-content-center mt-4">
											<a href="checkout.jsp"
												class="position-relative btn-primary text-uppercase"> 結帳
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