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
                                        <th class="cart-caption text-center heading_18 d-none d-md-table-cell">
                                            數量
                                        </th>
                                        <th class="cart-caption text-end heading_18">價格</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="cartItem" items="${carts}">
                                        <tr class="cart-item">
                                            <td class="cart-item-media">
                                                <div class="mini-img-wrapper">
                                                    <img class="mini-img" src="<c:out value='${cartItem.productImage}' />" alt="img">
                                                </div>
                                            </td>
                                            <td class="cart-item-details">
                                                <h2 class="product-title">
                                                    <a href="#"><c:out value='${cartItem.productName}' /></a>
                                                </h2>
                                                <p class="product-vendor"><c:out value='${cartItem.productVendor}' /></p>
                                            </td>
                                            <td class="cart-item-quantity">
                                                <div class="quantity d-flex align-items-center justify-content-between">
                                                    <!-- 这里放置你的数量输入框等相关内容 -->
                                                </div>
                                            </td>
                                            <td class="cart-item-price text-end">
                                                <div class="product-price"><c:out value='${cartItem.productPrice}' /></div>
                                                <div class="product-remove mt-2">
                                                    <a href="#">刪除</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-lg-5 col-md-12 col-12">
                            <!-- 这里放置购物车总计等相关内容 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

<%@ include file="/WEB-INF/footer.jspf"%>