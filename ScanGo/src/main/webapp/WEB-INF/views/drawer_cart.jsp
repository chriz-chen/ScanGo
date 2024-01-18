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
			<div id="minicart-loop" class="minicart-loop custom-scrollbar">



				<fn:forEach var="cartItem" items="${carts}">
				
				
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
					<div id="minicart-calc" class="minicart-calc d-flex align-items-center justify-content-between">
						<span class="cart-subtotal mb-0">總金額</span>
						<span class="cart-subprice">$0</span>
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



<!--
            
            const cartsHTML = data.carts.map(cart => `
            <div class="minicart-item d-flex">
                <div class="mini-img-wrapper">
                    <img class="mini-img" src="${cart.product.image}" alt="img">
                </div>
                <div class="product-info">
                    <h2 class="product-title">
                        <a href="#">${cart.product.productName}</a>
                    </h2>
                    <div class="misc d-flex align-items-end justify-content-between">
                        <div class="quantity d-flex align-items-center justify-content-between">
                            <button class="qty-btn dec-qty">
                                <img src="${pageContext.request.contextPath}/assets/img/icon/minus.svg" alt="minus">
                            </button>
                            <input class="qty-input" type="number" name="qty" value="${cart.quantity}" min="1">
                            <button class="qty-btn inc-qty">
                                <img src="${pageContext.request.contextPath}/assets/img/icon/plus.svg" alt="plus">
                            </button>
                        </div>
                        <div class="product-remove-area d-flex flex-column align-items-end">
                            <div class="product-price">$${cart.product.price}</div>
                            <a href="#" class="product-remove">刪除</a>
                        </div>
                    </div>
                </div>
            </div>
        `).join('');

        const totalPriceHTML = `<span class="cart-subprice">$${data.totalPrice}</span>`;
        // 選擇購物車的目標元素，這裡使用 ID 為 "minicart-loop" 的元素作為例子
        const minicartLoop = document.querySelector('.minicart-loop');

        // 插入到特定位置（在現有內容的末尾）
        minicartLoop.innerHTML = cartsHTML;
        // 更新總金額
        document.querySelector('#minicart-calc').innerHTML = totalPriceHTML;
            
            
-->        
            


<script>
function loadCartData() {
    // 使用 fetch 發送 GET 請求
    fetch('${pageContext.request.contextPath}/mvc/drawer_cart') 
        .then(response => response.json())
        .then(data => {
            console.log(data);
/*
            // 更新購物車內容
            var cartItemsDiv = document.getElementById('cart-items');
            cartItemsDiv.innerHTML = ''; // 清空原有內容

            for (var i = 0; i < data.carts.length; i++) {
                var cartItem = data.carts[i];

                // 創建購物車項目元素
                var cartItemDiv = document.createElement('div');
                cartItemDiv.className = 'cart-item';
                cartItemDiv.innerHTML = '<p>' + cartItem.product.productName + ' - $' + cartItem.product.price + '</p>';

                cartItemsDiv.appendChild(cartItemDiv);
            }
*/
            const totalPriceHTML = `<span class="cart-subtotal mb-0">總金額</span>
            						<span class="cart-subprice">$${totalPrice}</span>`;
            document.querySelector('#minicart-calc').innerHTML = totalPriceHTML;
        })
        .catch(error => console.error('Fetch request failed:', error));
}

// 初次載入頁面時就執行一次
window.onload = loadCartData;
    
</script>
