<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	background-color: #fffefb;
}

main {
	flex-grow: 1;
}

table {
	border-collapse: collapse;
	width: 90%;
	margin: 20px;
}


th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	font-size: 20px;
	font-weight: 500;
	background-color: #f2f2f2;
}

td{
	font-size: 18px;
	font-weight: 400;
}

.show-totalprice {
	text-align: right;
}

.show-orderitem {
	border: 1px solid #000;
	padding: 5px 10px;
	color: white;
	background-color: #00668c;
	border-radius: 10px;
	display: block;
	margin: 0 auto;
}





</style>


<h1 class="text-center mt-4">歷史訂單</h1>

<table>
	<thead>
		<tr>
			<th class="text-center">時間</th>
			<th class="text-center">金額</th>
			<th></th>
			<!-- 其他欄位 -->
		</tr>
	</thead>
	<tbody>
		<!-- 迭代購物紀錄 -->
		<c:forEach var="order" items="${orders}">
			<tr class="text-center">
				<td class="text-center"><fmt:formatDate value="${order.createTime}"
						pattern="yyyy年MM月dd日 a hh:mm " /></td>
				<td class="show-totalprice text-center"><c:out
						value="$${order.originalTotalPrice}" /></td>
				<td class="text-center">
					<button class="show-orderitem btn"
						data-href="/ScanGo/mvc/showOrderItem/${order.orderId}">
						查看</button>
				</td>
				<!-- 其他欄位 -->
			</tr>
		</c:forEach>
	</tbody>
</table>

<script>
    // 使用 JavaScript 為每個按鈕添加點擊事件處理程序
    document.querySelectorAll('.show-orderitem').forEach(button => {
        button.addEventListener('click', function () {
            // 獲取 data-href 屬性中的 URL
            const url = this.getAttribute('data-href');
            
            // 進行頁面跳轉
            window.location.href = url;
        });
    });
</script>

<%@ include file="/WEB-INF/footer.jspf"%>