<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

form {
	margin-top: 20px;
}

input {
	margin-bottom: 10px;
}
</style>

<div class="page-container">

	<h1>會員管理後台</h1>

	<div class="content-container vh-100">
		<div class="user-list">
			<!-- <h2>會員列表</h2> -->
			<table>
				<thead>
					<tr>
						<th>序號</th>
						<th>帳號</th>
						<th>信箱</th>
						<th>手機</th>
						<th>生日</th>
						<th>權限</th>
						<th>來源</th>
						<th>創建日期</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userList}">
						<tr>
							<td>${user.userId}</td>
							<td>${user.username}</td>
							<td>${user.email}</td>
							<td>${user.phone}</td>
							<td>${user.birthday}</td>
							<td>${user.level}</td>
							<td>${user.authType}</td>
							<td>${user.createDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>

</div>

<%@ include file="/WEB-INF/footer.jspf"%>