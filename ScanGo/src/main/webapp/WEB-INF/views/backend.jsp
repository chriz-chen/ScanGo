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
	background-color: #f4f4f4;
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
	width: 80%;
	margin-top: 20px;
}

.product-list {
	width: 60%;
}

.add-product-form {
	width: 35%;
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

td:nth-child(2) {
    min-width: 120px;
}

td:nth-child(3) {
    text-align: right;
}

td:nth-child(4) {
	min-width: 60px;
	text-align: center;
}

td:nth-child(5), td:nth-child(6) {
	min-width: 100px;
	text-align: center;
}

td:nth-child(7) {
	min-width: 50px;
	text-align: right;
}

form {
	margin-top: 20px;
}

input {
	margin-bottom: 10px;
}

body.modal-open {
    overflow: hidden;
}

body.modal-open {
    overflow: auto;
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
						<th>商品名稱</th>
						<th>價格</th>
						<th>單位</th>
						<th>分區</th>
						<th>類別</th>
						<th>庫存</th>
						<th>圖片</th>
						<th>上架</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${productList}">
						<tr>
							<td>${product.productId}</td>
							<td>${product.productName}</td>
							<td>${product.price}</td>
							<td>${product.unit}</td>
							<td>${product.category.categoryPart}</td>
							<td>${product.category.categoryName}</td>
							<td>${product.inventory}</td>
							<td>
								<button type="button" class="btn btn-primary" data-bs-toggle="modal"
										data-bs-target="#imageModal" data-image="data:image/jpeg;base64,${product.base64Image}">
									顯示
                        		</button>
							</td>
							<td>${product.isLaunch}</td>
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
				選擇圖片：<input type="file" name="productImg"><br>
				<input type="submit" value="新增商品">
			</form>
		</div>
	</div>




<!-- Modal -->
<div class="modal-dialog modal-dialog-centered">
<div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">商品圖片</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <img id="modalImage" class="img-fluid" alt="Product Image">
            </div>
        </div>
    </div>
</div>
</div>
</div>

<script>
    var myModal = new bootstrap.Modal(document.getElementById('imageModal'));

    $('#imageModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var imageURL = button.data('image');
        var modal = $(this);
        modal.find('#modalImage').attr('src', imageURL);
    });
</script>

<%@ include file="/WEB-INF/footer.jspf"%>