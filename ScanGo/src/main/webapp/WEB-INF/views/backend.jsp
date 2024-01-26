<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
body {
    overflow: auto;
}

.page-container {
    font-family: Arial, sans-serif;
    background-color: white;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 20px;
}

h1 {
	text-align: center;
	margin: 20px 0;
}

.content-container {
	display: flex;
	justify-content: space-between;
	width: 90%;
	margin-top: 20px auto;
}

.product-list {
	width: 70%;
}

.add-product-form {
	width: 25%;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

td:nth-child(3) {
    min-width: 120px;
}

td:nth-child(4) {
    text-align: center;
}

td:nth-child(5) {
	min-width: 60px;
	text-align: center;
}

td:nth-child(6) {
	min-width: 100px;
	text-align: center;
}

td:nth-child(7) {
	min-width: 100px;
	text-align: center;
}

td:nth-child(8) {
	min-width: 50px;
	text-align: center;
}

td:nth-child(9) {
	min-width: 50px;
	text-align: center;
}

form {
	margin-top: 20px;
}

input {
	margin-bottom: 10px;
}

.product-list img.productsImage {
    max-width: 60px;
    max-height: 60px;
    width: auto;
    height: auto;
}

</style>

<div class="page-container">

	<h1>商品管理後台</h1>

	<div class="content-container">
		<div class="product-list">
			<h2>現有商品列表</h2>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>圖片</th>
						<th>商品名稱</th>
						<th>價格</th>
						<th>單位</th>
						<th>分區</th>
						<th>類別</th>
						<th>庫存</th>
						<th>位置</th>
						<th>上架</th>
						<th>編輯</th>
						<th>刪除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${productList}">
						<tr>
							<td>${product.productId}</td>
							<td><img class="productsImage" src="${product.picture}" alt="product-img"></td>
							<td>${product.productName}</td>
							<td>${product.price}</td>
							<td>${product.unit}</td>
							<td>${product.category.categoryPart}</td>
							<td>${product.category.categoryName}</td>
							<td>${product.inventory}</td>
							<td>${product.position}</td>
							<td>${product.isLaunch}</td>
							<td>
			                    <div class="d-flex flex-column align-items-center justify-content-between">
			                        <a href="${ pageContext.request.contextPath }/mvc/editProduct/${product.productId}"
			                            class="btn btn-primary">修改</a>
			                    </div>
			                </td>
							<td>
								<form action="${pageContext.request.contextPath}/mvc/deleteProduct/${product.productId}"
									method="post" class="d-flex flex-column align-items-center justify-content-between"
									onsubmit="return confirm('是否確認要刪除？');" style="margin: 10px 0;">
									<input type="hidden" name="_method" value="delete">
							        <button type="submit" class="btn btn-primary">刪除</button>
							    </form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="add-product-form">
			<h2>新增商品</h2>
			<form action="${pageContext.request.contextPath}/mvc/add-product" method="post" enctype="multipart/form-data">
				商品名稱：<input type="text" name="productName" required><br>
				價格：<input type="number" name="price" required min="0"><br>
				單位：<input type="text" name="unit" required><br>
				類別：<input type="number" name="categoryId" required><br>
				庫存：<input type="number" name="inventory" required min="0" step="1"><br>
				圖片：<input type="text" name="picture" required><br>
				位置：<input type="text" name="position" required><br>
				<input type="submit" value="新增商品">
			</form>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/footer.jspf"%>