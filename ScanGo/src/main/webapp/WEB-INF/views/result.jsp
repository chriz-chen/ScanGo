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
</style>

<div class="page-container">

	<h1>商品新增結果</h1>

	<div class="result-container">
		<form class="pure-form">
			<fieldset>
				商品名稱: ${product.productName}
				<p />
				價格: ${product.price}
				<p />
				單位: ${product.unit}
				<p />
				類別: ${product.categoryId}
				<p />
				庫存: ${product.inventory}
				<p />
				<p />
			</fieldset>
		</form>
	</div>

	<a class="rerturn-management"
		href="${pageContext.request.contextPath}/mvc/backend">回到商品管理</a>

</div>

<%@ include file="/WEB-INF/footer.jspf"%>