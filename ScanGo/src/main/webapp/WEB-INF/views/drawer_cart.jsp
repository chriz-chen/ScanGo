<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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
			</div>
			
			<div class="minicart-footer">
				<div class="minicart-calc-area">
					<div id="minicart-calc" class="minicart-calc d-flex align-items-center justify-content-between">
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
function loadCartData() {
    // 使用 fetch 發送 GET 請求
    fetch('${pageContext.request.contextPath}/mvc/drawer_cart') 
        .then(response => response.json())
        .then(data => {
            console.log(data);
            
            var cartItemsDiv = document.getElementById('minicart-loop');
            cartItemsDiv.innerHTML = ''; // 清空原有內容

            for (var i = 0; i < data.carts.length; i++) {
                var cart = data.carts[i];
                console.log(cart.product.price);
                console.log(cart.product.productName);
                
                const cartsHTML = `
                <div class="minicart-item d-flex">
                    <div class="mini-img-wrapper">
                        <img class="mini-img" src="/ScanGo/image/product/snack/soda/coke.png" alt="img">
                    </div>
                    <div class="product-info">
                        <h2 id="productTitle" class="product-title">
                            ${cart.product.productName}
                        </h2>
                        <div class="misc d-flex align-items-end justify-content-between">
                            <div class="quantity d-flex align-items-center justify-content-between">
                                <button class="qty-btn dec-qty">
                                    <img src="${pageContext.request.contextPath}/assets/img/icon/minus.svg" alt="minus">
                                </button>
                                <input id="qtyInput" class="qty-input" type="number" name="qty" min="1">
                                <button class="qty-btn inc-qty">
                                    <img src="${pageContext.request.contextPath}/assets/img/icon/plus.svg" alt="plus">
                                </button>
                            </div>
                            <div class="product-remove-area d-flex flex-column align-items-end">
                                <div id="productsPrice" class="product-price"></div>
                                <a href="#" class="product-remove">刪除</a>
                            </div>
                        </div>
                    </div>
                </div>
			`
			
			// 使用 createElement 創建元素
			var cartItemDiv = document.createElement('div');
			cartItemDiv.innerHTML = cartsHTML;
			
			// 尋找元素，確保它存在再進行賦值
			var productTitle = cartItemDiv.querySelector("#productTitle");
			if (productTitle) {
				productTitle.textContent = cart.product.productName;
			}
			
			var qtyInput = cartItemDiv.querySelector("#qtyInput");
			if (qtyInput) {
				qtyInput.value = cart.productQuantity;
			}
			
			var productsPrice = cartItemDiv.querySelector("#productsPrice");
			if (productsPrice) {
				productsPrice.textContent = '$' + cart.product.price;
			}
			
			// 將創建的元素添加到 DOM 中
			cartItemsDiv.appendChild(cartItemDiv);
            }
            
            const totalPriceHTML = `<span class="cart-subtotal mb-0">總金額</span>
            						<span id="totalprice" class="cart-subprice"></span>`;
            document.querySelector('#minicart-calc').innerHTML = totalPriceHTML;
            document.getElementById("totalprice").textContent = '$' + data.totalPrice;
        })
        .catch(error => console.error('Fetch request failed:', error));
}

$('#minicart-loop').on('click', '.dec-qty', function() {
    var qtyInput = $(this).closest('.minicart-item').find('.qty-input');
    var newValue = parseInt(qtyInput.val()) - 1;
    qtyInput.val(Math.max(newValue, 1)); // 最小值為 1
    
    const data = {
			"productId": 1
		};
	
	const options = {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json', // 設置請求的內容類型為 JSON
	        },
	        body: JSON.stringify(data), // 將數據轉換為 JSON 字符串
	    };
	
	fetch('${pageContext.request.contextPath}/mvc/test', options) 
    .then(response => response.json())
    .then(data => {
    	console.log(data);

    })

});

$('#minicart-loop').on('click', '.inc-qty', function() {
    var qtyInput = $(this).closest('.minicart-item').find('.qty-input');
    var newValue = parseInt(qtyInput.val()) + 1;
    qtyInput.val(newValue);
});

$('#minicart-loop').on('click', '.product-remove', function() {
    // 移除相應的商品項目
    $(this).closest('.minicart-item').remove();
});

//當數量改變時觸發的事件處理函式
function updateQuantityByDrawer(productId, newQuantity) {
    // 使用 AJAX 發送 POST 請求到後端
    $.ajax({
        url: '${pageContext.request.contextPath}/mvc/update_quantity', // 替換為後端處理請求的端點
        method: 'POST',
        data: {
            productId: productId,
            newQuantity: newQuantity
        },
        success: function(response) {
            console.log('數量更新成功');
            // 在這裡可以更新其他頁面元素或執行其他操作
        },
        error: function(error) {
            console.error('數量更新失敗', error);
        }
    });
}

// 初次載入頁面時就執行一次
//window.onload = loadCartData;
    
</script>
