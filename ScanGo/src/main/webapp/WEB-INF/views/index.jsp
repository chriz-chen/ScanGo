<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js">

<%@ include file="/WEB-INF/header.jspf"%>

<style>
body {
	background-color: #fffefb;
}

.about-service-wrapper{
	background-color: #f5f4f1;
	border-radius: 30px;
}

/* 商品資訊 */
.product-card-details{
	font-weight: 400;
}

</style>

<body>
	<main id="MainContent" class="content-for-layout">
		<!-- slideshow start -->
		<div class="slideshow-section position-relative">
			<div class="slideshow-active activate-slider"
				data-slick='{
                "slidesToShow": 1, 
                "slidesToScroll": 1, 
                "dots": true,
                "arrows": true,
                "responsive": [
                    {
                    "breakpoint": 768,
                    "settings": {
                        "arrows": false
                    }
                    }
                ]
            }'>
				<div class="slide-item slide-item-bag position-relative">
					<img class="slide-img d-none d-md-block"
						src="/ScanGo/assets/img/banner/banner-03.png" alt="slide-1"> 
					<img class="slide-img d-md-none" src="/ScanGo/assets/img/banner/banner-01.png"
						alt="slide-1" style="width: 100%">
					

				</div>
				<div class="slide-item slide-item-bag position-relative">
					<img class="slide-img d-none d-md-block"
						src="/ScanGo/assets/img/slideshow/f2.jpg" alt="slide-2"> <img
						class="slide-img d-md-none" src="/ScanGo/assets/img/banner/banner-coupon.png"
						alt="slide-2">
					<div class="content-absolute content-slide">
						<div
							class="container height-inherit d-flex align-items-center justify-content-center">
							<div
								class="content-box slide-content slide-content-1 py-4 text-center">
								<h
									class="slide-heading heading_72 animate__animated animate__fadeInUp"
									data-animation="animate__animated animate__fadeInUp">
									限時領取優惠券</h1>
								<p class="slide-subheading heading_24 animate__animated animate__fadeInUp mt-3"
									data-animation="animate__animated animate__fadeInUp">優惠券代碼: IWANTCOUPON100</p>
								<a
									class="btn-primary slide-btn animate__animated animate__fadeInUp btn-lg"
									href="${pageContext.request.contextPath}/mvc/coupon.jsp"
									data-animation="animate__animated animate__fadeInUp">輸入代碼領取</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="activate-arrows"></div>
			<div class="activate-dots dot-tools"></div>
		</div>
		<!-- slideshow end -->

		<!-- collection start -->
		<div class="featured-collection mt-100 overflow-hidden mt-5 ">
			<div class="collection-tab-inner">
				<div class="container d-lg-none">
					<div class="section-header text-center">
						<h2 class="section-heading primary-color" style="line-height: 2;">本月優惠商品</h2>
					</div>
					<div class="row mb-5 justify-content-center">
						<div class="col-6" data-aos="fade-up" data-aos-duration="700">
							<div class="product-card">
								<div class="product-card-img justify-content-center">
									<a class="hover-switch"
										>
										<img class="primary-img"
										src="/ScanGo/image/product/grocery/tissue/2.jpeg" alt="product-img"
										style=" border: 1.5px solid #00234D;">

									</a>

									<div class="product-badge">
										<span class="badge-label badge-percentage rounded">-20%</span>
									</div>

								</div>
								<div class="product-card-details">
									<h3 class="product-card-title">
										<a  style="font-size: 20px">好韌真衛生紙
											100抽6包</a>
									</h3>
									<div class="product-card-price">
										<span class="card-price-regular" style="font-size: 20px">$100</span>
										<span class="card-price-compare text-decoration-line-through"
											style="font-size: 18px">$125</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6" data-aos="fade-up" data-aos-duration="700">
							<div class="product-card">
								<div class="product-card-img">
									<a class="hover-switch" >
										<img class="primary-img"
										src="/ScanGo/image/product/snack/cookies/3.jpeg" alt="product-img"
										style=" border: 1.5px solid #00234D;">
									</a>

									<div class="product-badge">
										<span class="badge-label badge-percentage rounded">-15%</span>
									</div>

								</div>
								<div class="product-card-details">
									<h3 class="product-card-title">
										<a  style="font-size: 20px">樂事美國經典原味</a>
									</h3>
									<div class="product-card-price">
										<span class="card-price-regular" style="font-size: 20px">$45</span>
										<span class="card-price-compare text-decoration-line-through"
											style="font-size: 18px">$50</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6" data-aos="fade-up" data-aos-duration="700">
							<div class="product-card">
								<div class="product-card-img">
									<a class="hover-switch" >
										<img class="primary-img" src="/ScanGo/image/product/snack/soda/5.jpeg"
										alt="product-img"
										style=" border: 1.5px solid #00234D;">
									</a>

									<div class="product-badge">
										<span class="badge-label badge-percentage rounded">-10%</span>
									</div>

								</div>
								<div class="product-card-details">
									<h3 class="product-card-title">
										<a  style="font-size: 20px">可口可樂
											600ml</a>
									</h3>
									<div class="product-card-price">
										<span class="card-price-regular" style="font-size: 20px">$35</span>
										<span class="card-price-compare text-decoration-line-through"
											style="font-size: 18px">$40</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6" data-aos="fade-up" data-aos-duration="700">
							<div class="product-card">
								<div class="product-card-img">
									<a class="hover-switch" >
										<img class="primary-img"
										src="/ScanGo/image/product/appliance/season/5.jpeg" alt="product-img"
										style=" border: 1.5px solid #00234D;">
									</a>

									<div class="product-badge">
										<span class="badge-label badge-percentage rounded">-10%</span>
									</div>

								</div>
								<div class="product-card-details">
									<h3 class="product-card-title">
										<a  style="font-size: 20px">SHARP夏普
											42吋電視</a>
									</h3>
									<div class="product-card-price">
										<span class="card-price-regular" style="font-size: 20px">$9000</span>
										<span class="card-price-compare text-decoration-line-through"
											style="font-size: 18px">$10000</span>
									</div>
								</div>
							</div>
						</div>
						<div class="view-all text-center" data-aos="fade-up"
							data-aos-duration="700">
							<a class="btn-primary fs-5" href="/ScanGo/imagemap.jsp">查看全部</a>
						</div>
					</div>
				</div>
			</div>
			<!-- collection end -->
			
			<!-- about service start -->
			<div class="about-service pt-100 pb-100">
				<div class="container">
					<div class="section-header about-service-header text-center"
						data-aos="fade-up" data-aos-duration="700">
						<h2 class="section-heading mb-5" style="color: #1d1c1c">一掃即得，無憂購物新體驗！</h2>
					</div>
					<div class="about-service-wrapper">
						<div class="row justify-content-center">
							<div class="col-lg-4 col-md-6 col-12 py-4" data-aos="fade-up"
								data-aos-duration="1000">
								<div class="about-service-inner text-center">
									<div class="about-service-icon">
										<svg xmlns="http://www.w3.org/2000/svg" width="36" height="37" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
										  <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z"/>
										  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0"/>
										</svg>
									</div>
									<div class="about-service-content">
										<h3 class="mt-3">無需等待，節省時間</h3>
										<p class="about-service-subtitle fs-5"> 
										透過自助結帳系統，無需再排隊結帳，節省您的寶貴時間。</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12 py-4" data-aos="fade-up"
								data-aos-duration="1400">
								<div class="about-service-inner text-center">
									<div class="about-service-icon">
										<svg xmlns="http://www.w3.org/2000/svg" width="36" height="37" fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
										  <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.37 2.37 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0M1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5M4 15h3v-5H4zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1zm3 0h-2v3h2z"/>
										</svg>
									</div>
									<div class="about-service-content">
										<h3 class="mt-3">24/7 營業</h3>
										<p class="about-service-subtitle fs-5">
										24小時全天候開放，無需受制於商店營業時間，隨時都能享受購物的樂趣。</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12 py-4" data-aos="fade-up"
								data-aos-duration="1700">
								<div class="about-service-inner text-center">
									<div class="about-service-icon">
										<svg xmlns="http://www.w3.org/2000/svg" width="36" height="37" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
										  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
										</svg>
									</div>
									<div class="about-service-content">
										<h3 class="mt-3">隱私和安全保障</h3>
										<p class="about-service-subtitle fs-5">
										個人資訊和購物資料都將受到加密保護，確保您的隱私擁有最大程度的保障。</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- about service end -->

				<div class="about-page">
					<!-- about hero start -->
					<div class="about-hero mt-5 mb-5">
						<div class="container">
							<div class="row">
								<div class="col-lg-6 col-md-12 col-12 mb-3">
									<div class="about-hero-img mb-5 mx-auto text-center"
										data-aos="fade-up" data-aos-duration="700">
										<img src="/ScanGo/image/reason.png" alt="img"
											style="max-width: 100%; border-radius: 20px;">
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-12 ">
									<div class="about-hero-content" data-aos="fade-up"
										data-aos-duration="700">
										<h2 class="about-hero-title" style="color: #1d1c1c">探索無人商店新境界，輕鬆購物，三步驟引領新體驗！</h2>
										<p class="about-hero-subtitle fs-5">探索新型態購物：使用方式簡易，購物快感一掃而得</p>
										<ul class="about-hero-action p-0">
											<li class="action-item d-flex">
												<div class="action-count">01</div>
												<div class="action-content">
													<h4 class="action-title">註冊會員，購物從容輕鬆啟程</h4>
													<p class="action-subtitle">註冊會員，體驗購物的從容樂趣，立即感受前所未有的方便與輕鬆。</p>
												</div>
											</li>
											<li class="action-item d-flex">
												<div class="action-count">02</div>
												<div class="action-content">
													<h4 class="action-title">輕鬆掃描，加入購物車</h4>
													<p class="action-subtitle">利用內建 QR Code 掃描器，輕鬆掃描商品上的 QR
														Code，瞬間將心儀商品加入購物車。</p>
												</div>
											</li>
											<li class="action-item d-flex">
												<div class="action-count">03</div>
												<div class="action-content">
													<h4 class="action-title">簡易結帳，商品輕鬆帶回家</h4>
													<p class="action-subtitle">完成結帳後，輕鬆帶出所選商品，體驗無人商店便利快捷的購物樂趣。</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="view-all text-center" data-aos="fade-up"
									data-aos-duration="700">
									<a class="btn-primary fs-5" href="${ pageContext.request.contextPath }/mvc/register">立即註冊</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- about hero end -->
	</main>
</body>

<%@ include file="/WEB-INF/fragments/scan.jspf"%>
<%@ include file="/WEB-INF/footer.jspf"%>