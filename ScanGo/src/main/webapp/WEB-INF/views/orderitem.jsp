<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns:th="http://www.thymeleaf.org">

<%@ include file="/WEB-INF/fragments/html_head.jspf"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

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

.showRating {
	border: 3px solid #000;
	padding: 8px 15px;
	color: white;
	background-color: blue;
	border-radius: 10px;
	display: block;
	margin: 0 auto;
}

.showRatingFinished {
	border: 3px solid #000;
	padding: 8px 15px;
	color: white;
	background-color: blue;
	border-radius: 10px;
	display: block;
	margin: 0 auto;
}

.rating {
	display: flex;
	justify-content: center;
	flex-direction: row-reverse;
}

input[type="radio"] {
	display: none;
}

label {
	cursor: pointer;
}

label:before {
	content: '\2605';
	font-size: 2em;
	color: #ddd;
}

input[type="radio"]:checked ~ label:before {
	color: #fdd835;
}


.btn-submit {
	border: 1px solid #000;
	padding: 5px 10px;
	color: white;
	background-color: blue;
	border-radius: 10px;
}

.btn-submit:disabled {
    background-color: white;
    cursor: not-allowed;
}

.modal-footer {
    display: flex;
    justify-content: flex-end;
    align-items: flex-end;
}

.stars-container {
    display: flex;
    justify-content: center;
  }

.filled-star {
	color: #fdd835; /* 指定星星颜色，可以根据需要修改 */
}

.empty-star {
	color: #ddd; /* 未选中的星星颜色，可以根据需要修改 */
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
										<img class="mini-img"
											src="${orderItem.product.picture}" alt="img">
									</div>
									<div class="product-info">
										<h2 class="product-title">
											<a href="#">${orderItem.product.productName}</a> <span
												class="product-price">$${orderItem.itemPrice}</span>
										</h2>
										<p class="product-vendor">x ${orderItem.itemQuantity}</p>
									</div>
								</div>
							</fn:forEach>

							<!-- 小計的地方 -->
							<div class="cart-total-box mt-4 bg-transparent p-0">
								<div class="subtotal-item subtotal-box">
									<h4 class="subtotal-title">小計</h4>
									<p class="subtotal-value">$${orders.originalTotalPrice}</p>
								</div>
								<div class="subtotal-item discount-box">
									<h4 class="subtotal-title">折扣</h4>
									<p class="subtotal-value"></p>
								</div>
								<hr />
								<div class="subtotal-item discount-box">
									<h4 class="subtotal-title">總計</h4>
									<p class="subtotal-value">$${orders.originalTotalPrice}</p>
								</div>
							</div>

							<div class=" text-center">
								<button class="showRating" data-bs-toggle="modal" data-bs-target="#ratingModal" th:class="${hasRated ? 'd-none' : ''}">為您的訂單評分</button>
								<button class="showRatingFinished" onclick="displayRatingResult()" th:class="${hasRated ? '' : 'd-none'}">已完成評分</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>



<!-- 評分 Modal -->
<div class="modal fade" id="ratingModal" tabindex="-1" aria-labelledby="ratingModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ratingModalLabel">請根據滿意度給予1~5顆星的評價</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 將評分表單放置在 modal-body 中 -->
                <form id="ratingForm" action="${pageContext.request.contextPath}/mvc/sendRating/${orders.orderId}" method="post">
                    <input type="hidden" name="orderId" value="${orders.orderId}">
                    
                    <div class="rating">
                        <input type="radio" name="star" id="star1" value="5" /><label for="star1"></label>
                        <input type="radio" name="star" id="star2" value="4" /><label for="star2"></label>
                        <input type="radio" name="star" id="star3" value="3" /><label for="star3"></label>
                        <input type="radio" name="star" id="star4" value="2" /><label for="star4"></label>
                        <input type="radio" name="star" id="star5" value="1" /><label for="star5"></label>
                        
                    </div>
                
                    <!-- 提交按鈕 -->
                    <div class="modal-footer">
					    <button type="button" class="btn" data-bs-dismiss="modal">取消</button>
					    <button type="button" class="btn btn-submit" id="submitBtn" onclick="submitRating(${orders.orderId})" disabled>送出</button>
					</div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 评分结果 Modal -->
<div class="modal fade" id="ratingResultModal" tabindex="-1" aria-labelledby="ratingResultModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ratingResultModalLabel">感謝您的評分!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="stars-container"></div>
            </div>
        </div>
    </div>
</div>


<script>
	document.addEventListener('DOMContentLoaded', function () {
	    
	    var showRatingBtn = document.querySelector('.showRating');
	    var showRatingFinishedBtn = document.querySelector('.showRatingFinished');
	    var submitBtn = document.getElementById('submitBtn');
	
	    // 使用 fetch 來檢查是否已經評分
	    fetch('${pageContext.request.contextPath}/mvc/checkRating/${orders.orderId}')
	        .then(response => response.json())
	        .then(data => {
	            if (data.hasRated) {
	                showRatingBtn.style.display = 'none';
	                showRatingFinishedBtn.style.display = '';
	                
	            } else {
	                showRatingBtn.style.display = '';
	                showRatingFinishedBtn.style.display = 'none';
	            }
	        })
	        .catch(error => console.error('Error checking rating:', error));
	
	    // 根據選定的評分啟用/禁用提交按鈕
	    document.addEventListener('change', function () {
	        var selectedRating = document.querySelector('input[name="star"]:checked');
	        submitBtn.disabled = !selectedRating;
	    });
	
	});
	
	function submitRating() {
	    // 獲取所選的評分整數值
	    var selectedRating = document.querySelector('input[name="star"]:checked');
	
	    // 檢查是否有選擇評分
	    if (selectedRating) {
	        // 觸發表單提交
	        document.getElementById('ratingForm').submit();
	        // 關閉評分 Modal
	        $('#ratingModal').modal('hide');
	    } else {
	        alert('請先選擇評分');
	    }
	}
	
	// 在選擇評分時啟用/禁用送出按鈕
	document.addEventListener('change', function () {
	    var selectedRating = document.querySelector('input[name="star"]:checked');
	    submitBtn.disabled = !selectedRating;
	});
	
	function displayRatingResult() {
	    fetch('${pageContext.request.contextPath}/mvc/displayRatingResult/${orders.orderId}')
	        .then(response => response.json())
	        .then(data => {
	            console.log(data);
	            console.log('Rating:', data.rating)

	            // 获取模态框和星星容器
	            var ratingResultModal = document.getElementById('ratingResultModal');
	            var starsContainer = ratingResultModal.querySelector('.stars-container');

	            // 清空之前的内容
	            starsContainer.innerHTML = '';

	        	// 根据评分结果显示星星
	            for (var i = 1; i <= data.rating; i++) {
			    	var starIcon = document.createElement('span');
				    starIcon.classList.add('fa', 'fa-star', 'filled-star');
				    starsContainer.appendChild(starIcon);
			    }
			
			    // 如果需要显示未选择的星星，可以添加以下代码：
			    for (var i = data.rating + 1; i <= 5; i++) {
			    	var emptyStarIcon = document.createElement('span');
			    	emptyStarIcon.classList.add('fa', 'fa-star-o', 'empty-star'); // 使用未填充的星星图标
			    	starsContainer.appendChild(emptyStarIcon);
			    }

	            // 显示模态框
	            var modal = new bootstrap.Modal(ratingResultModal);
	            modal.show();
	        })
	        .catch(error => console.error('Error getting rating result:', error));
	}
	
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<%@ include file="/WEB-INF/footer.jspf"%>