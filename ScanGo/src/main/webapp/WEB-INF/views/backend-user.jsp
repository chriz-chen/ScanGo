<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@ include file="/WEB-INF/header.jspf"%>
<!DOCTYPE html>


<%
	// 使用 Java 代碼獲取列表大小
	int totalMembers = ((java.util.List)request.getAttribute("userList")).size();
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
                    "url": "/js/datatables_zh_tw.json"
                },
                // Set export functionality
                dom: 'lBfrtip',
                buttons: [
                    {extend: 'copy', text: '複製', className:'pure-button pure-button-primary'}, 
                    {extend: 'csv', text: 'CSV', className:'pure-button'}, 
                    {extend: 'excel', text: 'EXCEL', className:'pure-button'}, 
                    {extend: 'print', text: 'PDF/列印', className:'pure-button pure-button-primary'}
                ]
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
${userList}
	<div class="container-lg vh-100">
    <h2>會員管理後台</h2>
        <table class="pure-table pure-table-bordered">
            <thead>
                <tr>
                    <th>序號</th>
                    <th>帳號</th>
                    <th>信箱</th>
                    <th>手機</th>
                    <th>生日</th>
                    <th>來源</th>
                    <th>創建日期</th>
                    <th>權限</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" /></td>
                        <td>${user.authType}</td>
                        <td><fmt:formatDate value="${user.createDate}" pattern="yyyy-MM-dd" /></td>
                        <td>${user.level}</td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
				<td colspan="8" align="right">會員總人數 : <%= totalMembers %> 人</td>
			</tfoot>
        </table>
        </div>

<%@ include file="/WEB-INF/footer.jspf"%>
</body>
</html>

