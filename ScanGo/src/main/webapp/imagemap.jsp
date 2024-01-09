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
				<li><a href="/ScanGo/mvc/product2">Product 3</a></li>
			</ul>
		`,
		Snack : `
			<ul>
				<li>Snack 1</li>
				<li>Snack 2</li>
				<li><a href="${pageContext.request.contextPath}/mvc/product2">Snack 3</li>
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
		});
		
		// figcaption 區塊消失：商品地圖點選時、空白區域點選時
		$('img[usemap],.blank').on('click',function() {
			$('figcaption').css('transform', 'translate(0, 200px)');
		});
	});
</script>
<body>
	<!-- breadcrumb start -->
	<div class="breadcrumb">
		<div class="container">
			<ul class="list-unstyled d-flex align-items-center m-0">
				<li><a href="/ScanGo/index.jsp">首頁</a></li>
				<li><svg class="icon icon-breadcrumb" width="64" height="64"
						viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g opacity="0.4">
                                <path
							d="M25.9375 8.5625L23.0625 11.4375L43.625 32L23.0625 52.5625L25.9375 55.4375L47.9375 33.4375L49.3125 32L47.9375 30.5625L25.9375 8.5625Z"
							fill="#000" />
                            </g>
                        </svg></li>
				<li>商店平面圖</li>
			</ul>
		</div>
	</div>
	<!-- breadcrumb end -->
	
	<!-- 平面圖 -->

		<div class="map d-flex flex-column justify-content-start mt-4">
			<div class="d-flex container-sm">
				<div class="flex-grow-1 blank"></div>
				<div class="">
					<h3>商店平面圖</h3>
					<img src="/ScanGo/assets/img/imagemap_new2.png" usemap="#image-map" id="imagemap">
					<map name="image-map">
					    <area target="" alt="Grocery" title="Grocery" href="" coords="168,370,159,373,152,377,148,383,146,390,145,398,145,854,147,860,149,865,153,870,158,874,165,877,176,878,437,878,446,875,453,871,458,865,462,858,463,848,463,834,463,394,460,383,455,377,449,371,438,370" shape="poly">
					    <area target="" alt="Snack" title="Snack" href="" coords="605,473,595,477,589,483,584,491,584,502,584,961,586,968,588,973,594,978,603,982,612,983,911,983,919,981,925,976,930,970,933,965,934,947,933,494,930,485,925,478,920,474,909,473" shape="poly">
					    <area target="" alt="Appliance" title="Appliance" href="" coords="167,1068,158,1071,153,1075,148,1082,145,1089,145,1100,145,1321,146,1328,149,1334,153,1339,158,1343,164,1346,176,1347,826,1347,835,1345,841,1340,847,1334,850,1326,850,1309,851,1090,847,1083,842,1075,836,1070,829,1068" shape="poly">
						<!-- 加這一行，解決手機點選，會自動顯示 area 最後一個區塊的怪問題 -->
						<area target="" alt="Other" title="" href="" coords="0,0,0,0" shape="rect">
					</map>
				</div>
				<div class="flex-grow-1 blank"></div>
			</div>
	
			<div class="position-fixed bottom-0 w-100 rounded" style="height: 200px; overflow: hidden; z-index: 99">
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
