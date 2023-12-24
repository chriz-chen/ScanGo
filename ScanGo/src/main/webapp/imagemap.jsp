<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
	figcaption {
		background-color: rgba(0, 0, 0, 0.7);
		height:200px;
		transform: translate(0, 200px);
		transition: transform 0.5s, opacity 0.5s;
		color: #fff;
	}

	figcaption p {
		font-size: 20px;
	}
	
	img {
		width: 400px;
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
		Grocery : '<ul><li>Product 1</li><li>Product 2</li><li>Product 3</li></ul>',
		Snack : '<ul><li>Snack 1</li><li>Snack 2</li><li>Snack 3</li></ul>',
		Appliance : '<ul><li>Appliance 1</li><li>Appliance 2</li><li>Appliance 3</li></ul>'
	};

	$(function() {
		$('img[usemap]').mapster({
			fillColor : '000000',
			fillOpacity : 0.3,
			mapKey : 'alt',
			isSelectable : false,
			onClick: null, // 試著禁用 onClick 事件
			onMouseover : function(data) {
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
<div class="map d-flex flex-column justify-content-start align-items-center mt-2">
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
	<div class="position-absolute bottom-0 w-100" style="height:200px; overflow: hidden;z-index:99">
		<figcaption class="p-4">
			<h4></h4>
			<hr>
			<p></p>
		</figcaption>
	</div>
</div>
<%@ include file="/WEB-INF/fragments/footer.jspf"%>

<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

