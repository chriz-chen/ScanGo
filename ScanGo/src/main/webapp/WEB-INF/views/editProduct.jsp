<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
    .form-label {
        font-size: 18px;
        margin-left: 15px;
        letter-spacing: 3px;
    }

    .info {
        font-size: 16px;
        margin-left: 5px;
        letter-spacing: 3px;
        padding: 5px;
    }

    .page-container {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h1 {
        text-align: center;
        margin: 20px 0;
    }

    .result-container {
        border: 3px solid #000;
        padding: 15px;
        background-color: #fff;
        border-radius: 10px;
        display: flex;
        justify-content: space-between; /* 元素之間均勻分布 */
        margin: 20px 50px; /* 調整左右邊界距離 */
        width: 400px;
    }

    .return-management {
        border: 3px solid #000;
        padding: 8px 15px;
        color: white;
        background-color: blue;
        border-radius: 10px;
        display: inline-block;
        margin: 20px 50px; /* 調整左右邊界距離 */
        text-align: center;
        text-decoration: none;
        
    }

    .return-management:hover {
        background-color: darkblue;
    }
</style>

<div class="page-container vh-100">
    <h1>編輯商品</h1>
    <div class="result-container">
        <form class="pure-form d-flex justify-content-center" action="${pageContext.request.contextPath}/mvc/updateProduct" method="post">
            <fieldset>
                <!-- 商品ID -->
                <input type="hidden" name="productId" value="${product.productId}">
                <!-- 商品名稱編輯框 -->
                <div class="mb-3">
                    <label for="productName" class="form-label">商品:</label>
                    <input type="text" class="info" id="productName" name="productName" value="${product.productName}" required>
                </div>
                <!-- 商品價格編輯框 -->
                <div class="mb-3">
                    <label for="price" class="form-label">價格:</label>
                    <input type="text" class="info" id="price" name="price" value="${product.price}" required>
                </div>
                <!-- 單位編輯框 -->
                <div class="mb-3">
                    <label for="unit" class="form-label">單位:</label>
                    <input type="text" class="info" id="unit" name="unit" value="${product.unit}" required>
                </div>
                <!-- 類別編輯框 -->
                <div class="mb-3">
                    <label for="categoryId" class="form-label">類別:</label>
                    <input type="text" class="info" id="categoryId" name="categoryId" value="${product.categoryId}" required>
                </div>
                <!-- 庫存編輯框 -->
                <div class="mb-3">
                    <label for="inventory" class="form-label">庫存:</label>
                    <input type="text" class="info" id="inventory" name="inventory" value="${product.inventory}" required>
                </div>
                <!-- 圖片編輯框 -->
<!--                 <div class="mb-3"> -->
<!--                     <label for="picture" class="form-label">圖片:</label> -->
<!--                     <input type="file" class="info" id="picture" name="picture" value="123123123" required> -->
<!--                 </div> -->
                <!-- Position編輯框 -->
                <div class="mb-3">
                    <label for="position" class="form-label">位置:</label>
                    <input type="text" class="info" id="position" name="position" value="${product.position}" required>
                </div>
                <!-- 提交按鈕 -->
                <button type="submit" class="btn btn-primary ms-2">修改</button>
            </fieldset>
        </form>
    </div>
    <a class="return-management" href="${pageContext.request.contextPath}/mvc/backend/product">回到商品管理</a>
</div>

<%@ include file="/WEB-INF/footer.jspf"%>
