<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@ include file="/WEB-INF/header.jspf"%>
<!DOCTYPE html>

<script type="text/javascript">
			function changeLaunch(productId, isLaunch) {
				location.href = '${pageContext.request.contextPath}/mvc/update_product_launch?productId=' + productId + '&isLaunch=' + isLaunch;
			}
		</script>

<style>

body{
	background-color: #fffefb;
}

.pure-button {
    margin-left: 5px;
}


.dataTables_length{
	font-size: 15px;
	margin-right: 20px
	
}

.dataTables_wrapper .dataTables_filter input[type="search"] {
    width: 200px;
    padding: 5px;
    border-radius: 4px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
}

.dataTables_wrapper .dataTables_paginate .paginate_button {
    padding: 5px 10px;
    margin: 0 2px;
    border-radius: 4px;
    background-color: #b6ccd8;
    color: #fff;
}

th {
    white-space: nowrap;
}

.form-label{
	font-size: 18px;
	margin-left: 15px;
	letter-spacing: 3px;
}

.form-control{
	font-size: 16px;
	margin-left: 5px;
	letter-spacing: 3px;
}


</style>

<%
	// 使用 Java 代碼獲取列表大小
	int totalProducts = ((java.util.List)request.getAttribute("productList")).size();
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>學生成績列表</title>
    <!-- Include PureCSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
    <!-- Include DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <!-- Include jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Include DataTables -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <!-- Include DataTables Export and Print functionality -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.pure-table').DataTable({
                // Set language to Traditional Chinese
                "language": {
                	"sProcessing":   "處理中...",
                	"sLengthMenu":   "顯示 _MENU_ 項結果",
                	"sZeroRecords":  "沒有匹配結果",
                	"sInfo":         "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                	"sInfoEmpty":    "顯示第 0 至 0 項結果，共 0 項",
                	"sInfoFiltered": "(由 _MAX_ 項結果過濾)",
                	"sInfoPostFix":  "",
                	"sSearch":       "搜索:",
                	"sEmptyTable":     "表中數據為空",
                	"sLoadingRecords": "載入中...",
                	"sInfoThousands":  ",",
                	"oPaginate": {
                		"sFirst":    "首頁",
                		"sPrevious": "上頁",
                		"sNext":     "下頁",
                		"sLast":     "末頁"
                	},
                	"oAria": {
                		"sSortAscending":  ": 以升序排列此列",
                		"sSortDescending": ": 以降序排列此列"
                	}
                },
                // Set export functionality
                dom: 'lBfrtip',
                buttons: [
                    {extend: 'excel', text: 'EXCEL下載', className:'pure-button'}, 
                    {extend: 'print', text: 'PDF/列印', className:'pure-button'}
                ],
                
                "columnDefs":[
                    {
                      targets: [1,2], // 第二欄
                      createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                         // ...這邊是設定td
                      },
                       width: "15%", 
                    },
                  ],
                  
                
            });
        });
    </script>
    <style type="text/css">
        .fail {
            color: red;
        }
    </style>
</head>
<body>
	<div class="container-lg mt-5 mb-5">
    <h2 class="text-center">商品管理後台</h2>
    
    <div class="d-flex justify-content-end mb-3">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-warning btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">
            新增商品
        </button>
    </div>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">新增商品</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/mvc/addProduct" method="post">
                            <!-- 商品名稱 -->
                            <div class="mb-3">
                                <label for="productName" class="form-label">商品名稱</label>
                                <input type="text" class="form-control" id="productName" name="productName" value="可口可樂 (600ml)" required>
                            </div>
                            <!-- 價格 -->
                            <div class="mb-3">
                                <label for="price" class="form-label">價格</label>
                                <input type="number" class="form-control" id="price" name="price" value="35" required>
                            </div>
                            <!-- 單位 -->
                            <div class="mb-3">
                                <label for="unit" class="form-label">單位</label>
                                <input type="text" class="form-control" id="unit" name="unit" value="瓶" required>
                            </div>
							<div class="mb-3">
							    <label for="category" class="form-label">類別</label>
							    <select class="form-select" id="categorySelect" name="categoryId" required>
							        <fn:forEach var="category" items="${category}">
							            <option value="${category.categoryId}">${category.categoryPart}/${category.categoryName}</option>
							        </fn:forEach>
							    </select>
							</div>
                            
                            <!-- 類別 
                            <div class="mb-3">
                                <label for="category" class="form-label">分區</label>
                                <select class="form-select" id="category" name="categoryId" required>
                                    <!-- 在這裡動態載入分區選項 -->
                                    <%-- <c:forEach var="category" items="${categories}">
                                        <option value="${category.categoryId}">${category.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div> --%>
                            <!-- 庫存 -->
                            <div class="mb-3">
                                <label for="inventory" class="form-label">庫存</label>
                                <input type="number" class="form-control" id="inventory" name="inventory" value="100" required>
                            </div>
                            <!-- 圖片 -->
                            <div class="mb-3">
                                <label for="picture" class="form-label">圖片</label>
                                <input type="file" class="form-control" id="picture" name="picture"  required>
                            </div>
                            <!-- 位置 -->
                            <div class="mb-3">
                                <label for="position" class="form-label">位置</label>
                                <input type="text" class="form-control" id="position" name="position" value="D-1" required>
                            </div>
                            
                            <button type="submit" class="ms-2 btn btn-warning">提交</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    
    
    
        <table class="pure-table pure-table-bordered">
            <thead>
                <tr class="text-center">
					<th>ID</th>
					<th>圖片</th>
					<th>商品</th>
					<th>價格</th>
					<th>單位</th>
					<th>庫存</th>
					<th>分區</th>
					<th>類別</th>
					<th>位置</th>
					<th>QR Code</th>
					<th>上架</th>
					<th>編輯</th>
					<th>刪除</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${productList}">
         		      <tr class="text-center">
	                    <td>${product.productId}</td>
						<td><img class="productsImage" src="${product.picture}" alt="product-img" style="width: 100px; height: 100px"></td>
						<td>${product.productName}</td>
						<td>${product.price} 元</td>
						<td>${product.unit}</td>
						<td>${product.inventory}</td>
						<td style="white-space: nowrap;">${product.category.categoryPart}</td>
						<td style="white-space: nowrap;">${product.category.categoryName}</td>
						<td>${product.position}</td>
						<td>
						   <a href="/ScanGo/mvc/QrcodeDownload?productId=${product.productId}">
						   		<img class="Qrcode" src="/ScanGo/mvc/product/image/${product.productId}.png " 
						   		alt="product-Qrcode" style="width: 100px; height: 100px">
						   </a>
						</td>
						<%-- <td>
							<button type="button" onclick="${pageContext.request.contextPath}/mvc/qrcode/generate?productId=${product.productId}">
								產生QRCode
							</button>
							<a href="${pageContext.request.contextPath}/mvc/qrcode/generate?productId=${product.productId}"
							   style="width: 90px; height: 90px">產生QRCode</a>
						</td> --%>
						<td style="white-space: nowrap;"><input onClick="changeLaunch(${ product.productId }, this.checked)"
									type="checkbox" ${ (product.isLaunch) ? 'checked' : '' } 
								 > 上架
						</td>
						<td>
		                    <div class="">
		                        <a href="${ pageContext.request.contextPath }/mvc/editProduct/${product.productId}"
		                            class="btn btn-primary" style="white-space: nowrap;">修改</a>
		                    </div>
		                </td>
						<td>
							<form action="${pageContext.request.contextPath}/mvc/deleteProduct/${product.productId}"
								method="post" class=""
								onsubmit="return confirm('是否確認要刪除？');">
								<input type="hidden" name="_method" value="delete">
						        <button type="submit" class="btn btn-danger" style="white-space: nowrap;">刪除</button>
						    </form>
						</td>
						
      		         </tr>
                </c:forEach>
            </tbody>
            <tfoot>
				<td colspan="13" align="right" class="me-3">商品總數 : <%= totalProducts %> </td>
			</tfoot>
        </table>
        
        </div>
        
        
        
        
<script>
// 使用 JavaScript 為每個按鈕添加點擊事件處理程序
document.querySelectorAll('.show-userId-orderitem').forEach(button => {
    button.addEventListener('click', function () {
        // 使用 const 或 let 代替 var
        const url = this.getAttribute('data-href');
        
        // 使用 const 或 let 代替 var
        window.location.href = url;
    });
});
</script>

<%@ include file="/WEB-INF/footer.jspf"%>
</body>
</html>

