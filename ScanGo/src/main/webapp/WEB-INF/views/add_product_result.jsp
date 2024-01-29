<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
.page-container {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f4f4;
    padding: 20px;
    text-align: center;
}

h1 {
    margin-bottom: 30px;
    color: #333;
}

.result-container {
    border: 3px solid #000;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    margin-bottom: 30px;
    display: inline-block;
    text-align: left;
}

.result-container h2 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
}

.result-item {
    margin-bottom: 15px;
    color: #333;
}

.result-item strong {
    font-weight: bold;
    color: #000;
}

.productsImage {
    max-width: 150px;
    max-height: 150px;
    width: auto;
    height: auto;
    display: block;
    margin: 0 auto;
}

.return-management {
    display: inline-block;
    width: 200px;
    padding: 10px;
    text-align: center;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
}

.return-management:hover {
    background-color: #0056b3;
}

.info{
	font-size: 22px;
	margin: 10px;
	letter-spacing: 3px;
	font-weight: 500px;
}


</style>

<div class="container">
    <div class="page-container vh-100">
        <h1>商品新增結果</h1>
        <div class="result-container mt-5 p-5">
            <div class="result-item">
                <div class="row mb-4">
				    <div class="col-md-6">
				        <img class="productsImage" src="/ScanGo/image/product/${product.picture}" 
				             style="border: 1.5px solid #00234D;" alt="product-img">
				    </div>
				    <div class="col-md-6">
					    <a href="/ScanGo/mvc/QrcodeDownload?productId=${product.productId}">
					        <img class="productsImage" src="/ScanGo/mvc/product/image/${product.productId}.png" 
					             style="border: 1.5px solid #00234D;" alt="product-img">
					    </a>
				    </div>
				</div>
                <div class="info mt-3">
                    <strong>商品名稱:</strong> ${product.productName}
                </div>
                <div class="info">
                    <strong>價格:</strong> ${product.price}
                </div>
                <div class="info">
                    <strong>單位:</strong> ${product.unit}
                </div>
                <div class="info">
                    <strong>類別:</strong> ${product.categoryId}
                </div>
                <div class="info">
                    <strong>庫存:</strong> ${product.inventory}
                </div>
                <div class="info">
                    <strong>位置:</strong> ${product.position}
                </div>
            </div>
        </div>
        </p><a href="${pageContext.request.contextPath}/mvc/backend/product" class="btn btn-primary btn-lg mt-2 fs-5">回到後台</a>

    </div>
</div>

<%@ include file="/WEB-INF/footer.jspf"%>
