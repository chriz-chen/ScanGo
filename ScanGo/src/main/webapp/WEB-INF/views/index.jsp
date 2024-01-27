<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js">

<%@ include file="/WEB-INF/header.jspf"%>

<style>
body {
	background-color: #fffefb;
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
						src="/ScanGo/assets/img/slideshow/f1.jpg" alt="slide-1"> <img
						class="slide-img d-md-none" src="/ScanGo/assets/img/banner/banner-01.png"
						alt="slide-1" style="width: 100%">

				</div>
				<div class="slide-item slide-item-bag position-relative">
					<img class="slide-img d-none d-md-block"
						src="/ScanGo/assets/img/slideshow/f2.jpg" alt="slide-2"> <img
						class="slide-img d-md-none" src="/ScanGo/assets/img/slideshow/f2-m.jpg"
						alt="slide-2">
					<div class="content-absolute content-slide">
						<div
							class="container height-inherit d-flex align-items-center justify-content-end">
							<div
								class="content-box slide-content slide-content-1 py-4 text-center">
								<h2
									class="slide-heading heading_72 animate__animated animate__fadeInUp"
									data-animation="animate__animated animate__fadeInUp">
									Discover The Best Product</h2>
								<p
									class="slide-subheading heading_24 animate__animated animate__fadeInUp"
									data-animation="animate__animated animate__fadeInUp">Look
									for your inspiration here</p>
								<a
									class="btn-primary slide-btn animate__animated animate__fadeInUp"
									href="collection-left-sidebar.html"
									data-animation="animate__animated animate__fadeInUp">SHOP
									NOW</a>
							</div>
						</div>
					</div>
				</div>
				<div class="slide-item slide-item-bag position-relative">
					<img class="slide-img d-none d-md-block"
						src="assets/img/slideshow/f3.jpg" alt="slide-3"> <img
						class="slide-img d-md-none" src="assets/img/slideshow/f3-m.jpg"
						alt="slide-3">
					<div class="content-absolute content-slide">
						<div
							class="container height-inherit d-flex align-items-center justify-content-center">
							<div
								class="content-box slide-content slide-content-1 py-4 text-center">
								<h2
									class="slide-heading heading_72 animate__animated animate__fadeInUp"
									data-animation="animate__animated animate__fadeInUp">
									Discover The Best Product</h2>
								<p
									class="slide-subheading heading_24 animate__animated animate__fadeInUp"
									data-animation="animate__animated animate__fadeInUp">Look
									for your inspiration here</p>
								<a
									class="btn-primary slide-btn animate__animated animate__fadeInUp"
									href="collection-left-sidebar.html"
									data-animation="animate__animated animate__fadeInUp">SHOP
									NOW</a>
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
										href="${pageContext.request.contextPath}/product-info.jsp">
										<img class="primary-img"
										src="/ScanGo/image/product/grocery/tissue/2.jpeg" alt="product-img"
										style="width: 226px; height: 250px; border: 1.5px solid #00234D;">

									</a>

									<div class="product-badge">
										<span class="badge-label badge-percentage rounded">-20%</span>
									</div>

								</div>
								<div class="product-card-details">
									<h3 class="product-card-title">
										<a href="collection-left-sidebar.html" style="font-size: 20px">好韌真衛生紙
											100抽6包</a>
									</h3>
									<div class="product-card-price">
										<span class="card-price-regular" style="font-size: 20px">$120</span>
										<span class="card-price-compare text-decoration-line-through"
											style="font-size: 18px">$150</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6" data-aos="fade-up" data-aos-duration="700">
							<div class="product-card">
								<div class="product-card-img">
									<a class="hover-switch" href="collection-left-sidebar.html">
										<img class="primary-img"
										src="/ScanGo/image/product/snack/cookies/3.jpeg" alt="product-img"
										style="width: 226px; height: 250px; border: 1.5px solid #00234D;">
									</a>

									<div class="product-badge">
										<span class="badge-label badge-percentage rounded">-15%</span>
									</div>

								</div>
								<div class="product-card-details">
									<h3 class="product-card-title">
										<a href="collection-left-sidebar.html" style="font-size: 20px">樂事美國經典原味</a>
									</h3>
									<div class="product-card-price">
										<span class="card-price-regular" style="font-size: 20px">$38</span>
										<span class="card-price-compare text-decoration-line-through"
											style="font-size: 18px">$45</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6" data-aos="fade-up" data-aos-duration="700">
							<div class="product-card">
								<div class="product-card-img">
									<a class="hover-switch" href="collection-left-sidebar.html">
										<img class="primary-img" src="/ScanGo/image/product/snack/soda/5.jpeg"
										alt="product-img"
										style="width: 226px; height: 250px; border: 1.5px solid #00234D;">
									</a>

									<div class="product-badge">
										<span class="badge-label badge-percentage rounded">-15%</span>
									</div>

								</div>
								<div class="product-card-details">
									<h3 class="product-card-title">
										<a href="collection-left-sidebar.html" style="font-size: 20px">可口可樂
											600ml</a>
									</h3>
									<div class="product-card-price">
										<span class="card-price-regular" style="font-size: 20px">$25</span>
										<span class="card-price-compare text-decoration-line-through"
											style="font-size: 18px">$30</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6" data-aos="fade-up" data-aos-duration="700">
							<div class="product-card">
								<div class="product-card-img">
									<a class="hover-switch" href="collection-left-sidebar.html">
										<img class="primary-img"
										src="/ScanGo/image/product/appliance/season/5.jpeg" alt="product-img"
										style="width: 226px; height: 250px; border: 1.5px solid #00234D;">
									</a>

									<div class="product-badge">
										<span class="badge-label badge-percentage rounded">-10%</span>
									</div>

								</div>
								<div class="product-card-details">
									<h3 class="product-card-title">
										<a href="collection-left-sidebar.html" style="font-size: 20px">SHARP夏普
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
							<a class="btn-primary" href="./imagemap.jsp">VIEW ALL</a>
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
						<h2 class="section-heading mb-5">一掃即得，無憂購物新體驗！</h2>
					</div>
					<div class="about-service-wrapper">
						<div class="row justify-content-center">
							<div class="col-lg-4 col-md-6 col-12 py-4" data-aos="fade-up"
								data-aos-duration="1000">
								<div class="about-service-inner text-center">
									<div class="about-service-icon">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
											xmlns="http://www.w3.org/2000/svg">
                                                <path
												d="M9 0C7.08984 0 5.54297 1.38672 5.15625 3.1875C2.82422 3.60547 1 5.55078 1 8C1 8.24609 1.02734 8.46484 1.0625 8.6875C0.417969 9.63672 0 10.7539 0 12C0 13.7969 0.894531 15.3086 2.15625 16.4062C2.06641 16.7617 2 17.1172 2 17.5C2 19.9727 4.02734 22 6.5 22C6.52734 22 6.53906 22 6.5625 22C7.14453 23.1289 8.15234 24 9.5 24C10.4766 24 11.3633 23.5898 12 22.9375C12.6367 23.5898 13.5234 24 14.5 24C15.8477 24 16.8555 23.1289 17.4375 22C17.4609 22 17.4727 22 17.5 22C19.8477 22 21.7734 20.1719 21.9688 17.875H22C22 17.8125 21.9727 17.75 21.9688 17.6875C21.9727 17.625 22 17.5625 22 17.5C22 17.1289 21.8672 16.8125 21.7812 16.4688C23.0781 15.3672 24 13.8281 24 12C24 10.7539 23.582 9.63672 22.9375 8.6875C22.9727 8.46484 23 8.24609 23 8C23 5.55078 21.1758 3.60547 18.8438 3.1875C18.457 1.38672 16.9102 0 15 0C13.8008 0 12.7344 0.558594 12 1.40625C11.2656 0.558594 10.1992 0 9 0ZM9 2C10.1172 2 11 2.88281 11 4V6C11 7.66797 9.66797 9 8 9V11C9.13281 11 10.1602 10.6094 11 9.96875V20.5C11 21.3398 10.3398 22 9.5 22C8.75391 22 8.15625 21.4844 8.03125 20.7812L7.84375 19.8125L6.875 19.9688C6.69922 19.9961 6.58984 20 6.5 20C5.10938 20 4 18.8906 4 17.5C4 17.1914 4.05078 16.9023 4.15625 16.625C4.16406 16.6016 4.17969 16.5859 4.1875 16.5625C4.49609 15.793 5.16797 15.2305 6 15.0625L5.59375 13.0938C4.55078 13.3047 3.64453 13.8594 3 14.6562C2.37109 13.9531 2 13.0234 2 12C2 11.0625 2.32031 10.2266 2.875 9.53125L3.1875 9.15625L3.09375 8.65625C3.03906 8.42188 3 8.21484 3 8C3 6.33203 4.33203 5 6 5H7V4C7 2.88281 7.88281 2 9 2ZM15 2C16.1172 2 17 2.88281 17 4V5H18C19.668 5 21 6.33203 21 8C21 8.21484 20.9609 8.42188 20.9062 8.65625L20.8125 9.15625L21.125 9.53125C21.6797 10.2266 22 11.0625 22 12C22 13.1992 21.4883 14.2695 20.6562 15C19.9727 14.3945 19.1016 14 18.125 14C17.1797 14 16.3281 14.3359 15.6562 14.9062L16.9375 16.4375C17.2617 16.1641 17.6602 16 18.125 16C19.0898 16 19.8594 16.7227 19.9688 17.6562C19.8867 18.9727 18.8359 20 17.5 20C17.4102 20 17.3008 19.9961 17.125 19.9688L16.1562 19.8125L15.9688 20.7812C15.8438 21.4844 15.2461 22 14.5 22C13.6602 22 13 21.3398 13 20.5V9.96875C13.8398 10.6094 14.8672 11 16 11V9C14.332 9 13 7.66797 13 6V4C13 2.88281 13.8828 2 15 2Z"
												fill="black" />
                                            </svg>
									</div>
									<div class="about-service-content">
										<h4 class="about-service-title">Convenient Service</h4>
										<p class="about-service-subtitle">Through True Rich
											Attended does no end it his mother since real had half every
											him end it his mother</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12 py-4" data-aos="fade-up"
								data-aos-duration="1400">
								<div class="about-service-inner text-center">
									<div class="about-service-icon">
										<svg width="26" height="27" viewBox="0 0 26 27" fill="none"
											xmlns="http://www.w3.org/2000/svg">
                                                <path
												d="M10 0C6.1 0 3 3.1 3 7C3 9.4375 4.20996 11.5615 6.07031 12.8125C2.51001 14.3473 0 17.8936 0 22H2C2 17.6 5.6 14 10 14C13.9 14 17 10.9 17 7C17 3.1 13.9 0 10 0ZM10 2C12.8 2 15 4.2 15 7C15 9.8 12.8 12 10 12C7.2 12 5 9.8 5 7C5 4.2 7.2 2 10 2ZM18.0996 13V15.0996C17.4996 15.1996 16.9004 15.5008 16.4004 15.8008L14.9004 14.3008L13.5 15.6992L15 17.1992C14.6 17.6992 14.4008 18.3 14.3008 19H12V21H14.0996C14.1996 21.6 14.5008 22.2008 14.8008 22.8008L13.3008 24.3008L14.6992 25.6992L16.1992 24.1992C16.6992 24.4992 17.3004 24.8004 17.9004 24.9004V27H19.9004V24.9004C20.5004 24.8004 21.0996 24.4992 21.5996 24.1992L23.0996 25.6992L24.5 24.3008L23 22.8008C23.4 22.3008 23.5992 21.7 23.6992 21H26V19H23.9004C23.8004 18.4 23.4992 17.7992 23.1992 17.1992L24.6992 15.6992L23.3008 14.3008L21.8008 15.8008C21.3008 15.5008 20.6996 15.1996 20.0996 15.0996V13H18.0996ZM19 17C20.7 17 22 18.3 22 20C22 21.7 20.7 23 19 23C17.3 23 16 21.7 16 20C16 18.3 17.3 17 19 17ZM19 19C18.875 19 18.75 19.0312 18.6328 19.0859C18.5156 19.1406 18.4062 19.2188 18.3125 19.3125C18.2188 19.4062 18.1406 19.5156 18.0859 19.6328C18.0312 19.75 18 19.875 18 20C18 20.375 18.2812 20.75 18.6328 20.9141C18.75 20.9688 18.875 21 19 21C19.5 21 20 20.5 20 20C20 19.5 19.5 19 19 19Z"
												fill="black" />
                                            </svg>
									</div>
									<div class="about-service-content">
										<h4 class="about-service-title">Expert Mechanics</h4>
										<p class="about-service-subtitle">Through True Rich
											Attended does no end it his mother since real had half every
											him end it his mother</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12 py-4" data-aos="fade-up"
								data-aos-duration="1700">
								<div class="about-service-inner text-center">
									<div class="about-service-icon">
										<svg width="27" height="25" viewBox="0 0 27 25" fill="none"
											xmlns="http://www.w3.org/2000/svg">
                                                <path
												d="M14 0V1.18945C13.855 1.24195 13.7141 1.30611 13.5801 1.37891C13.3121 1.52449 13.0691 1.70855 12.8574 1.92383C12.6457 2.1391 12.4654 2.38465 12.3262 2.6543C12.1173 3.05877 12 3.51625 12 4C12 4.205 12.0221 4.40547 12.0625 4.59961C12.1433 4.98789 12.3005 5.35039 12.5176 5.66992C12.6261 5.82969 12.7485 5.97898 12.8848 6.11523C13.021 6.25148 13.1703 6.37391 13.3301 6.48242C13.8094 6.80797 14.385 7 15 7C15.1425 7 15.276 7.02695 15.3965 7.07617C15.517 7.12539 15.6235 7.19773 15.7129 7.28711C15.8023 7.37648 15.8746 7.48305 15.9238 7.60352C15.973 7.72398 16 7.8575 16 8C16 8.4275 15.7579 8.77617 15.3965 8.92383C15.276 8.97305 15.1425 9 15 9C14.8575 9 14.724 8.97305 14.6035 8.92383C14.483 8.87461 14.3765 8.80227 14.2871 8.71289C14.1977 8.62352 14.1254 8.51695 14.0762 8.39648C14.027 8.27602 14 8.1425 14 8H12C12 8.16125 12.0138 8.32025 12.0391 8.47461C12.0643 8.62897 12.1 8.77828 12.1484 8.92383C12.2938 9.36047 12.5398 9.75326 12.8574 10.0762C12.9633 10.1838 13.0763 10.2838 13.1973 10.375C13.3182 10.4662 13.4461 10.5483 13.5801 10.6211C13.7141 10.6939 13.855 10.758 14 10.8105V12H16V10.8105C17.16 10.3905 18 9.29 18 8C18 6.565 16.9586 5.34523 15.5996 5.0625C15.4055 5.02211 15.205 5 15 5C14.8575 5 14.724 4.97305 14.6035 4.92383C14.483 4.87461 14.3765 4.80227 14.2871 4.71289C14.1977 4.62352 14.1254 4.51695 14.0762 4.39648C14.027 4.27602 14 4.1425 14 4C14 3.8575 14.027 3.72398 14.0762 3.60352C14.1254 3.48305 14.1977 3.37648 14.2871 3.28711C14.4659 3.10836 14.715 3 15 3C15.57 3 16 3.43 16 4H18C18 3.83875 17.9862 3.67975 17.9609 3.52539C17.9357 3.37104 17.9 3.22172 17.8516 3.07617C17.5609 2.20289 16.87 1.50445 16 1.18945V0H14ZM7.51562 14C6.48462 14.004 5.69922 14.2656 5.69922 14.2656L5.67969 14.2734L0.0078125 16.4492L1.99219 22.0195L6.92188 20.1289L14.0586 24.0586L26.3828 18.9531L25.6172 17.1094L14.1797 21.8438L7.07812 17.9336L3.1875 19.4219L2.54688 17.6172L6.34375 16.1602C6.35275 16.1562 6.81962 16 7.51562 16C8.21863 16 9.03828 16.1561 9.73828 16.7891L9.75195 16.7969L9.75586 16.8008C10.7869 17.6958 11.5645 18.3212 12.6465 18.6602C13.7285 19.0002 14.9559 19.0392 17.0059 19.0312L16.9961 17.0312C14.9841 17.0392 13.9331 16.968 13.2461 16.75C12.5581 16.539 12.0701 16.1598 11.0781 15.3008L11.0664 15.293C9.90941 14.254 8.53463 13.996 7.51562 14Z"
												fill="black" />
                                            </svg>
									</div>
									<div class="about-service-content">
										<h4 class="about-service-title">Transparent Pricing</h4>
										<p class="about-service-subtitle">Through True Rich
											Attended does no end it his mother since real had half every
											him end it his mother</p>
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
								<div class="col-lg-6 col-md-12 col-12 ">
									<div class="about-hero-img mb-5 mx-auto text-center"
										data-aos="fade-up" data-aos-duration="700">
										<img src="/ScanGo/image/reason.png" alt="img"
											style="max-width: 100%; border-radius: 20px;">
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-12 ">
									<div class="about-hero-content" data-aos="fade-up"
										data-aos-duration="700">
										<h2 class="about-hero-title">探索無人商店新境界，輕鬆購物，三步驟引領新體驗！</h2>
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