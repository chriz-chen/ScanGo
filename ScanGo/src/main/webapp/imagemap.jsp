<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jspf"%>

<!-- image map -->
<style>
.map {
	height: 100%;
	margin-top: 10px;
}

figcaption {
	background-color: rgba(0, 0, 0, 0.499);
	color: #fff;
	width: 100%;
	padding: 1.5rem 1rem;
	transition: .5s;
	height: 85% !important;
	left: 0;
	bottom: 0;
	transform: translate(0, 100%);
}

figcaption p {
	font-size: 20px;
}

img {
	width: 400px;
	height: auto;
}
</style>

<body>
	<div id="map"
		class="map d-flex flex-column justify-content-start align-items-center vh-100">
		<div>
			<h3>商店平面圖</h3>
			<img src="assets/img/imagemap.png" usemap="#image-map">

			<map name="image-map">
				<area target="" alt="Grocery" title="Grocery" href=""
					coords="50,172,442,791" shape="rect">
				<area target="" alt="Snack" title="Snack" href=""
					coords="554,344,968,938" shape="rect">
				<area target="" alt="Appliance" title="Appliance" href=""
					coords="60,999,974,1337" shape="rect">
			</map>
		</div>
		<figcaption>
			<h4>商品資訊</h4>
			<hr>
			<p>
				洗髮精 沐浴乳 洗面乳 <br> 牙刷 牙膏 毛巾 <br>
			</p>
		</figcaption>
	</div>
</body>

<script>
	// 定義不同區域的 HTML 片段
	var areaContent = {
		Grocery : '<ul>' + '<li>Product 1</li>' + '<li>Product 2</li>'
				+ '<li>Product 3</li>' + '</ul>',
		Snack : '<ul>' + '<li>Snack 1</li>' + '<li>Snack 2</li>'
				+ '<li>Snack 3</li>' + '</ul>',
		Appliance : '<ul>' + '<li>Appliance 1</li>' + '<li>Appliance 2</li>'
				+ '<li>Appliance 3</li>' + '</ul>'
	};

	$(function() {
		$('img[usemap]').mapster({
			fillColor : '000000',
			fillOpacity : 0.3,
			mapKey : 'alt',
			isSelectable : false,
			onMouseover : function(data) {
				var figcaption = $('figcaption');
				figcaption.find('h4').text(data.key);
				figcaption.find('p').html(areaContent[data.key]);
				figcaption.css('transform', 'translate(0, 30%)');
			},
			onMouseout : function(data) {
				$('figcaption').css('transform', 'translate(0, 100%)');
			}
		});
	});
</script>

<%@ include file="/WEB-INF/fragments/scan.jspf"%>
<%@ include file="/WEB-INF/footer.jspf"%>

   