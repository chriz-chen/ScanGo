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

.product-title, .product-title a {
    font-size: 17px;
}

.quantity input, .product-price {
    font-size: 15px;
}


/* 購物車商品 */
.minicart-item{
	border-bottom: 0.5px solid gray;
	margin-bottom: 5px;
}

.modal-content{
	background-color: #f5f4f1;
	border-radius: 15px;
}


#nullCart{
	font-size: 24px;
	font-weight: 500;
	letter-spacing: 2px;
	margin-left: 20px;
	margin-top: 250px;
	
}

</style>

<!-- drawer cart start -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="drawer-cart">
	<div class="offcanvas-header border-btm-black">
		<h5 class="cart-drawer-heading text_16 ms-2" style="color: #3b3c3d; font-weight: 500; letter-spacing: 3px">您的購物車</h5>
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
					class="minicart-btn-area d-flex align-items-center justify-content-end mt-2">
					<a href="/ScanGo/mvc/checkout" class="minicart-btn btn-primary">我要結帳</a>
				</div>
			</div>
			
		</div>
	</div>
</div>
<!-- drawer cart end -->

<!--Remind  Modal -->
<div class="modal fade" id="remindModal_drawer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">庫存上限提示</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        已達庫存上限，無法再增加數量。
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
      </div>
    </div>
  </div>
</div>

<!-- Confirm Delete Modal -->
<div class="modal fade" id="confirmDeleteModal_drawer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content mt-4">
            <div class="modal-header">
                <h5 class="modal-title fs-3 ms-3" id="exampleModalLabel">確認刪除</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body fs-4 ms-3">
                確定要刪除此商品嗎？
            </div>
            <div class="modal-footer fs-4 ms-3">
                <button type="button" class="btn btn-secondary" 
                        style="font-size: 16px;" data-bs-dismiss="modal">取消</button>
                <button id="confirmDeleteButton" type="button" 
                        style="font-size: 16px;" class="btn btn-primary">確定刪除</button>
            </div>
        </div>
    </div>
</div>

<script>
function loadCartData() {
    // 使用 fetch 發送 GET 請求
    fetch('${pageContext.request.contextPath}/mvc/drawer_cart') 
        .then(response => response.json())
        .then(data => {
            
            var cartItemsDiv = document.getElementById('minicart-loop');
            cartItemsDiv.innerHTML = ''; // 清空原有內容

            if (data.carts.length === 0) {
                // 購物車中沒有商品，顯示相應提醒
                const emptyCartHTML = '<p id="nullCart">您的購物車是空的喔!</p>';
                cartItemsDiv.innerHTML = emptyCartHTML;
            } else{
            	
            	for (var i = 0; i < data.carts.length; i++) {
                    var cart = data.carts[i];
                    
                    const cartsHTML = `
                    <div id="minicartItem" class="minicart-item d-flex">
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
                                    <input id="qtyInput" class="qty-input" type="number" name="qty" min="1" disabled="disabled">
                                    <button class="qty-btn inc-qty">
                                        <img src="${pageContext.request.contextPath}/assets/img/icon/plus.svg" alt="plus">
                                    </button>
                                </div>
                                <div class="product-remove-area d-flex flex-column align-items-end">
                                    <div id="productsPrice" class="product-price"></div>
                                    <a href="#" class="product-remove" style="font-size: 15px" >刪除</a>
                                </div>
                            </div>
                        </div>
                    </div>
    			`
    			
    			// 使用 createElement 創建元素
    			var cartItemDiv = document.createElement('div');
    			cartItemDiv.innerHTML = cartsHTML;
    			
    			var minicartItem = cartItemDiv.querySelector("#minicartItem");
    			if(minicartItem) {
    				minicartItem.id = "drawer_product" + cart.product.productId;
    			}
    			
    			// 尋找元素，確保它存在再進行賦值
    			var productImg = cartItemDiv.querySelector(".mini-img");
    			if (productImg) {
    				productImg.src = cart.product.picture;
    			}
    			
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
            	
            }
            
            const totalPriceHTML = `<span class="cart-subtotal mb-0 fs-5">總金額</span>
            						<span id="totalprice" class="cart-subprice fs-5"></span>`;
            document.querySelector('#minicart-calc').innerHTML = totalPriceHTML;
            document.getElementById("totalprice").textContent = '$' + data.totalPrice;
        })
        .catch(error => console.error('Fetch request failed:', error));
}

$('#minicart-loop').on('click', '.dec-qty', function() {
	
	var productId = $(this).closest('.minicart-item').attr('id');
	productId = productId.substring(14);
	
    var qtyInput = $(this).closest('.minicart-item').find('.qty-input');
    var newValue = parseInt(qtyInput.val()) - 1;
    qtyInput.val(Math.max(newValue, 1)); // 最小值為 1
    
    if(newValue > 0){
	    const data = {
				"productId": productId
			};
		
		const options = {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json', // 設置請求的內容類型為 JSON
		        },
		        body: JSON.stringify(data), // 將數據轉換為 JSON 字符串
		    };
		
		fetch('${pageContext.request.contextPath}/mvc/cart/update_minus', options) 
	    .then(response => response.json())
	    .then(data => {
	    	
	    	loadCartData();
	    })
	    
	
    }
});

$('#minicart-loop').on('click', '.inc-qty', function() {
	
	var productId = $(this).closest('.minicart-item').attr('id');
	productId = productId.substring(14);
	
    var qtyInput = $(this).closest('.minicart-item').find('.qty-input');
    var newValue = parseInt(qtyInput.val()) + 1;
    qtyInput.val(newValue);
    
    const data = {
			"productId": productId
		};
	
	const options = {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json', // 設置請求的內容類型為 JSON
	        },
	        body: JSON.stringify(data), // 將數據轉換為 JSON 字符串
	    };
	
	fetch('${pageContext.request.contextPath}/mvc/cart/update_plus', options) 
    .then(response => response.json())
    .then(data => {
    	
    	if(data.error === '超過庫存上限!'){
    		$('#remindModal_drawer').modal('show');
    	}
    	
    	
    	
    	loadCartData();
    })
    
    
    
});

$('#minicart-loop').on('click', '.product-remove', function() {
	
	var confirmModal = new bootstrap.Modal(document.getElementById('confirmDeleteModal_drawer'));

	var productId = $(this).closest('.minicart-item').attr('id');
	productId = productId.substring(14);
	
	
    var confirmButton = document.getElementById('confirmDeleteButton');
    confirmButton.onclick = function () {

    	console.log(productId);
	    // 移除相應的商品項目
	    $(this).closest('.minicart-item').remove();
	    
	    const data = {
				"productId": productId
			};
		
		const options = {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json', // 設置請求的內容類型為 JSON
		        },
		        body: JSON.stringify(data), // 將數據轉換為 JSON 字符串
		    };
		
		fetch('${pageContext.request.contextPath}/mvc/cart/removeFromCart', options) 
	    .then(response => response.json())
	    .then(data => {
	    	
	    	loadCartData();
	    	confirmModal.hide();
	    })
    }
    confirmModal.show();
});


// 初次載入頁面時就執行一次
//window.onload = loadCartData;
    
</script>
