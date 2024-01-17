<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.cart-drawer-heading {
	color: white; /* Set the title color to white */
	font-size: 22px;
}

.product-remove-area .product-remove {
	color: red;
}
</style>
<!-- drawer cart start -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="drawer-cart">
	<div class="offcanvas-header border-btm-black">
		<h5 class="cart-drawer-heading text_16">您的購物車</h5>
		<button type="button" class="btn-close text-reset"
			data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body p-0">
		<div
			class="cart-content-area d-flex justify-content-between flex-column">
			<div class="minicart-loop custom-scrollbar">
				<!-- minicart item -->
				<fn:forEach var="cartItem" items="${carts}">
					<!-- 在這裡使用 cartItem 來訪問資料 -->
					<div class="minicart-item d-flex">
						<div class="mini-img-wrapper">
							<img class="mini-img"
								src="/ScanGo/image/product/snack/soda/coke.png" alt="img">
						</div>
						<div class="product-info">
							<h2 class="product-title">
								<a href="#"><fn:out value='${cartItem.product.productName}' /></a>
							</h2>
							<div class="misc d-flex align-items-end justify-content-between">
								<div
									class="quantity d-flex align-items-center justify-content-between">
									<button class="qty-btn dec-qty">
										<img
											src="${pageContext.request.contextPath}/assets/img/icon/minus.svg"
											alt="minus">
									</button>
									<input class="qty-input" type="number" name="qty" value="1"
										min="1">
									<button class="qty-btn inc-qty">
										<img
											src="${pageContext.request.contextPath}/assets/img/icon/plus.svg"
											alt="plus">
									</button>
								</div>
								<div
									class="product-remove-area d-flex flex-column align-items-end">
									<div class="product-price">$${cartItem.product.price}</div>
									<a href="#" class="product-remove">刪除</a>
								</div>
							</div>
						</div>
					</div>
				</fn:forEach>
			</div>
			<div class="minicart-footer">
				<div class="minicart-calc-area">
					<div
						class="minicart-calc d-flex align-items-center justify-content-between">
						<span class="cart-subtotal mb-0">總金額</span> <span
							class="cart-subprice">$${totalPrice}</span>
					</div>
				</div>
				<div
					class="minicart-btn-area d-flex align-items-center justify-content-center">
					<a href="/ScanGo/mvc/checkout" class="minicart-btn btn-primary">我要結帳</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- drawer cart end -->

<script>
    var carts = ${carts};
    var totalPrice = ${totalPrice};

    console.log(carts);
    console.log(totalPrice);

    // 在這裡使用 carts 和 totalPrice 進行後續處理

    // 例：將 carts 的信息顯示在頁面上
    for (var i = 0; i < carts.length; i++) {
        console.log("Product Name: " + carts[i].product.productName);
        console.log("Price: " + carts[i].product.price);
    }

    // 例：將 totalPrice 的信息顯示在頁面上
    console.log("Total Price: " + totalPrice);
</script>
