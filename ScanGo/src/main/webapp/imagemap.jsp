<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
figcaption {
	background-color: rgba(0, 0, 0, 0.7);
	height: 200px;
	transform: translate(0, 200px);
	transition: transform 0.5s, opacity 0.5s;
	color: #fff;
}

figcaption h4 {
	color: #fff;
}

figcaption p {
	font-size: 20px;
}

img[usemap] {
	width: 400px;
	height: auto;
	z-index: 100;
}

body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

footer {
	z-index: 1;
}
</style>
<script>

	// 定義不同區域的 HTML 片段
	var areaContent = {
		Grocery : `
			<ul>
				<li><a href="/ScanGo/mvc/product">Product 1</a></li>
				<li><a href="/ScanGo/index.jsp">Product 2</a></li>
				<li><a href="/ScanGo/index.jsp">Product 3</a></li>
			</ul>
		`,
		Snack : `
			<ul>
				<li>Snack 1</li>
				<li>Snack 2</li>
				<li>Snack 3</li>
			</ul>
		`,
		Appliance : `
			<ul>
				<li>Appliance 1</li>
				<li>Appliance 2</li>
				<li>Appliance 3</li>
			</ul>
		`
	};

	$(function() {
		$('img[usemap]').mapster({
			fillColor : '000000',
			fillOpacity : 0.3,
			mapKey : 'alt',
			isSelectable : false,
			onClick : function(data) {
				$('figcaption').css('transform', 'translate(0, 0)');
				$('figcaption').parent().removeClass('opacity-0');
				$('figcaption').parent().addClass('opacity-100');
				$('figcaption').find('h4').text(data.key);
				$('figcaption').find('p').html(areaContent[data.key]);
			},
			onMouseout : function(data) {
				$('figcaption').css('transform', 'translate(0, 200px)');
			}
		});
	});
</script>
<body>
	<!-- breadcrumb start -->
	<div class="breadcrumb">
		<div class="container">
			<ul class="list-unstyled d-flex align-items-center m-0">
				<li><a href="${pageContext.request.contextPath}/mvc/index.jsp">首頁</a></li>
				<li><svg class="icon icon-breadcrumb" width="64" height="64"
						viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g opacity="0.4">
                                <path
							d="M25.9375 8.5625L23.0625 11.4375L43.625 32L23.0625 52.5625L25.9375 55.4375L47.9375 33.4375L49.3125 32L47.9375 30.5625L25.9375 8.5625Z"
							fill="#000" />
                            </g>
                        </svg></li>
				<li>Bag</li>
				<li><svg class="icon icon-breadcrumb" width="64" height="64"
						viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g opacity="0.4">
                                <path
							d="M25.9375 8.5625L23.0625 11.4375L43.625 32L23.0625 52.5625L25.9375 55.4375L47.9375 33.4375L49.3125 32L47.9375 30.5625L25.9375 8.5625Z"
							fill="#000" />
                            </g>
                        </svg></li>
				<li>Accesories Lather Bag</li>
			</ul>
		</div>
	</div>
	<!-- breadcrumb end -->
	<!-- 平面圖 -->
	<div
		class="map d-flex flex-column justify-content-start align-items-center mt-4">
		<div>
			<h3>商店平面圖</h3>
			<img src="assets/img/imagemap.png" usemap="#image-map" id="imagemap">
			<map name="image-map">
				<area target="" alt="Grocery" title="Grocery" href=""
					coords="50,172,442,791" shape="rect">
				<area target="" alt="Snack" title="Snack" href=""
					coords="554,344,968,938" shape="rect">
				<area target="" alt="Appliance" title="Appliance" href=""
					coords="60,999,974,1337" shape="rect">
			</map>
		</div>
		<div class="position-fixed bottom-0 w-100 rounded"
			style="height: 200px; overflow: hidden; z-index: 99">
			<figcaption class="p-4">
				<h4></h4>
				<hr>
				<p></p>
			</figcaption>

		</div>
	</div>
	<!-- 平面圖 end -->
</body>

<%@ include file="/WEB-INF/footer.jspf"%>

<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
