<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
body {
	background-color: #fffefb;
}

.link-light:hover {
    color: #71c4ef;
  }

.map {
	height: 90vh;
}

figcaption {
	background-color: rgba(90, 90, 90, 0.9);
	height: 200px;
	transform: translate(0, 200px);
	transition: transform 0.5s, opacity 0.5s;
	color: #f5f4f1;
}

figcaption h4 {
	color: #f5f4f1;
	letter-spacing: 5px;
	font-size: 28px;
}

figcaption p {
	color: #f5f4f1;
	font-size: 22px;
}

img[usemap] {
	width: 500px;
	height: auto;
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
		五金雜貨區 : `
			<ul>
				<li><a href="/ScanGo/mvc/searchProduct/1" class="link-light">清潔用品</a></li>
				<li><a href="/ScanGo/mvc/searchProduct/2" class="link-light">廚房用品</a></li>
				<li><a href="/ScanGo/mvc/searchProduct/3" class="link-light">衛生紙</a></li>
			</ul>
		`,
		零食飲料區 : `
			<ul>
				<li><a href="/ScanGo/mvc/searchProduct/4" class="link-light">汽水</a></li>
				<li><a href="/ScanGo/mvc/searchProduct/5" class="link-light">餅乾</li>
				<li><a href="/ScanGo/mvc/searchProduct/6" class="link-light">茶</li>
			</ul>
		`,
		家電用品區 : `
			<ul>
				<li><a href="/ScanGo/mvc/searchProduct/7" class="link-light">季節家電</li>
				<li><a href="/ScanGo/mvc/searchProduct/8" class="link-light">美體家電</li>
				<li><a href="/ScanGo/mvc/searchProduct/9" class="link-light">廚房家電</li>
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
		$(document).ready(function() {  // 確保DOM已經完全載入後執行程式碼
		    // 綁定點擊事件到滿足選擇器條件的元素
		    $('img[usemap], .blank').click(function() {
		        // 將所有符合選擇器的 <figcaption> 元素的 CSS transform 屬性設置為 'translate(0, 200px)'
		        $('figcaption').css('transform', 'translate(0, 200px)');
		    });
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
			<div class="d-flex container-sm ">
				<div class="flex-grow-1 blank"></div>
				<div class="">
					<!-- <h3>商店平面圖</h3> -->
					<img src="/ScanGo/assets/img/imagemap_new2.png" usemap="#image-map" id="imagemap">
					<map name="image-map">
					    <area target="" alt="五金雜貨區" title="Grocery" href="" coords="168,370,159,373,152,377,148,383,146,390,145,398,145,854,147,860,149,865,153,870,158,874,165,877,176,878,437,878,446,875,453,871,458,865,462,858,463,848,463,834,463,394,460,383,455,377,449,371,438,370" shape="poly">
					    <area target="" alt="零食飲料區" title="Snack" href="" coords="605,473,595,477,589,483,584,491,584,502,584,961,586,968,588,973,594,978,603,982,612,983,911,983,919,981,925,976,930,970,933,965,934,947,933,494,930,485,925,478,920,474,909,473" shape="poly">
					    <area target="" alt="家電用品區" title="Appliance" href="" coords="167,1068,158,1071,153,1075,148,1082,145,1089,145,1100,145,1321,146,1328,149,1334,153,1339,158,1343,164,1346,176,1347,826,1347,835,1345,841,1340,847,1334,850,1326,850,1309,851,1090,847,1083,842,1075,836,1070,829,1068" shape="poly">
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