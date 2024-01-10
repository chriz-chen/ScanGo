<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/header.jspf"%>


<style>
.featured-collection {
	margin-top: 40px;
}

.section-header {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 10%;
}

.section-heading {
	font-size: 32px;
}
</style>

<!-- breadcrumb start -->
<div class="breadcrumb">
	<div class="container">
		<ul class="list-unstyled d-flex align-items-center m-0">
			<li><a href="/ScanGo/index.jsp">首頁</a></li>
			<li><svg class="icon icon-breadcrumb" width="64" height="64"
					viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g opacity="0.4">
                                <path
						d="M25.9375 8.5625L23.0625 11.4375L43.625 32L23.0625 52.5625L25.9375 55.4375L47.9375 33.4375L49.3125 32L47.9375 30.5625L25.9375 8.5625Z"
						fill="#000" />
                            </g>
                        </svg></li>
			<li>商品列表</li>
		</ul>
	</div>
</div>
<!-- breadcrumb end -->


<c:forEach var="product" items="${products}">
    <div>
        <p>Product Name: <c:out value="${product.productName}" /></p>
        <p>Price: <c:out value="${product.price}" /></p>
        <!-- 其他 product 屬性... -->
    </div>
</c:forEach>

<!-- collection start -->
<div class="featured-collection mt-100 overflow-hidden">
    <div class="collection-tab-inner">
        <div class="container">
            <div class="section-header text-center">
                <h2 class="section-heading primary-color">商品列表</h2>
            </div>
            <div class="row mb-5">
                <div class="col-6">
                    <div class="product-card">
                        <div class="product-card-img">
                            <a class="hover-switch">
                                <img class="primary-img"
                                    src="assets/img/products/furniture/1.jpg" alt="product-img">
                            </a>

                            <div class="product-badge">
                                <span class="badge-label badge-percentage rounded">-44%</span>
                            </div>
                        </div>
                        <div class="product-card-details">
                            <h3 class="product-card-title">
                                <a>best wood furniture</a>
                            </h3>
                            <div class="product-card-price">
                                <span class="card-price-regular">$1529</span>
                            </div>

                            <!-- 添加“商品详细信息”和“加入购物车”按钮 -->
                            <div class="d-flex justify-content-between">
                                <button type="button" class="btn btn-primary btn-lg"
                                    onclick="openModal('productDetailsModal')">商品資訊</button>
                                <button type="button" class="btn btn-success btn-sm"
                                    onclick="openModal('addToCartModal')">加入購物車</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- collection end -->

<!-- 商品详细信息的模态框 -->
<div class="modal fade" id="productDetailsModal" tabindex="-1"
	aria-labelledby="productDetailsModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="productDetailsModalLabel">商品資訊</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- 这里添加模态框的内容 -->
				<!-- 例如商品详细信息 -->
			</div>
		</div>
	</div>
</div>

<!-- 加入购物车的模态框 -->
<div class="modal fade" id="addToCartModal" tabindex="-1"
	aria-labelledby="addToCartModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="addToCartModalLabel">加入購物車</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- 这里添加模态框的内容 -->
				<!-- 例如加入购物车的表单 -->
			</div>
		</div>
	</div>
</div>

<script>
	// JavaScript 函数打开模态框
	function openModal(modalId) {
		var modal = new bootstrap.Modal(document.getElementById(modalId));
		modal.show();
	}
</script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="/WEB-INF/footer.jspf"%>