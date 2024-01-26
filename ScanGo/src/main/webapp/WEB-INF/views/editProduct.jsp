<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
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
    display: block;
    margin: 20px auto;
    text-align: left;
}

.rerturn-management {
    border: 3px solid #000;
    padding: 8px 15px;
    color: white;
    background-color: blue;
    border-radius: 10px;
    display: block;
    margin: 20px auto;
    text-align: center;
    text-decoration: none;
}

.rerturn-management:hover {
    background-color: darkblue;
}

footer {
    text-align: center;
    padding: 15px;
    position: fixed;
    bottom: 0;
    width: 100%;
}

.result-container label {
        display: block;
        margin-bottom: 10px; /* 調整這個值以控制垂直空白的大小 */
}

.result-container input {
        margin-bottom: 10px; /* 調整這個值以控制垂直空白的大小 */
}

.result-container button {
        margin-top: 10px; /* 調整這個值以控制垂直空白的大小 */
}
</style>

<div class="page-container">

    <h1>編輯商品</h1>

    <div class="result-container">
        <form class="pure-form" action="${pageContext.request.contextPath}/mvc/updateProduct" method="post">
            <fieldset>
                <!-- 商品ID -->
                <input type="hidden" name="productId" value="${product.productId}">

                <!-- 商品名稱編輯框 -->
                <label for="productName">商品名稱:</label>
                <input type="text" id="productName" name="productName" value="${product.productName}" required>
                <br>

                <!-- 商品價格編輯框 -->
                <label for="price">價格:</label>
                <input type="text" id="price" name="price" value="${product.price}" required>
                <br>

                <!-- 單位編輯框 -->
                <label for="unit">單位:</label>
                <input type="text" id="unit" name="unit" value="${product.unit}" required>
                <br>

                <!-- 類別編輯框 -->
                <label for="categoryId">類別:</label>
                <input type="text" id="categoryId" name="categoryId" value="${product.categoryId}" required>
                <br>

                <!-- 庫存編輯框 -->
                <label for="inventory">庫存:</label>
                <input type="text" id="inventory" name="inventory" value="${product.inventory}" required>
                <br>

                <!-- 圖片編輯框 -->
                <label for="productImage">修改圖片:</label>
                <div class="input-group">
                    <input type="file" id="productImage" name="productImage">
                    <button type="button" class="btn btn-secondary" onclick="resetImage()">選擇其他圖片</button>
                </div>
                <br>

                <!-- Position編輯框 -->
                <label for="position">修改 Position:</label>
                <input type="text" id="position" name="position" value="${product.position}" required>
                <br>

                <!-- 上架狀況編輯框 -->
                <label for="isLaunch">上架狀況:</label>
                <select id="isLaunch" name="isLaunch" required>
                    <option value="1" ${product.isLaunch == 1 ? 'selected' : ''}>上架</option>
                    <option value="0" ${product.isLaunch == 0 ? 'selected' : ''}>下架</option>
                </select>
                <br>

                <!-- 添加其他商品屬性的編輯框，根據實際情況添加 -->

                <!-- 提交按鈕 -->
                <button type="submit">修改</button>
            </fieldset>
        </form>
    </div>

    <a class="return-management" href="${pageContext.request.contextPath}/mvc/backend">回到商品管理</a>

</div>

<script>
    function resetImage() {
        // 將圖片輸入欄的值重置為空
        document.getElementById('productImage').value = '';
    }
</script>

<%@ include file="/WEB-INF/footer.jspf"%>