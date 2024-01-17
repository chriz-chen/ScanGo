<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/fragments/html_head.jspf"%>

User
<style>

.puchase-time {
	margin-top: 120px;
	font-size: 20px;
}

.product-price {
    float: right;
    font-size: 16px;
}

.product-vendor {
	font-size: 15px;
}

</style>

<header class="navbar navbar-expand-lg navbar-light bg-light"
	style="position: fixed; top: 0; left: 0; width: 100%; height: 65px; z-index: 1000; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
	<div class="container-fluid">
		<button class="back-button" onclick="history.back()">
			<!-- 使用 "<" 符號 -->
			&lt;
		</button>
		<a class="navbar-brand mx-auto custom-font-size" href="#"> 訂單項目 </a>
	</div>
</header>


<main id="MainContent" class="content-for-layout">
    <div class="checkout-page">
        <div class="container">
            <div class="checkout-page-wrapper">
                <div class="row">
                <div class="puchase-time">
                	購買時間: &nbsp;&nbsp;
                	<fmt:formatDate value="${orders.createTime}"
						pattern="yyyy年MM月dd日 a hh:mm " />
                </div>
                    <div class="col-xl-3 col-lg-4 col-md-12 col-12">
                        <div class="cart-total-area checkout-summary-area">
                            <fn:forEach var="orderItem" items="${orderItems}">
                                <div class="minicart-item d-flex">
                                    <div class="mini-img-wrapper">
                                        <img class="mini-img" src="/ScanGo/image/product/snack/soda/coke.png" alt="img">
                                    </div>
                                    <div class="product-info">
                                        <h2 class="product-title">
                                            <a href="#">${orderItem.product.productName}</a>
                                            <span class="product-price">$${orderItem.itemPrice}</span>
                                        </h2>
                                        <p class="product-vendor">x ${orderItem.itemQuantity}</p>
                                    </div>
                                </div>
                            </fn:forEach>

                            <!-- 小計的地方 -->
                            <div class="cart-total-box mt-4 bg-transparent p-0">
                                <div class="subtotal-item subtotal-box">
                                    <h4 class="subtotal-title">小計</h4>
                                    <p class="subtotal-value">$${orders.orderTotalPrice}</p>
                                </div>
                                <div class="subtotal-item discount-box">
                                    <h4 class="subtotal-title">折扣</h4>
                                    <p class="subtotal-value"></p>
                                </div>
                                <hr />
                                <div class="subtotal-item discount-box">
                                    <h4 class="subtotal-title">總計</h4>
                                    <p class="subtotal-value">$${orders.discountTotalPrice}</p>
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