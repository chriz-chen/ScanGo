<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jspf"%>

<main id="MainContent" class="content-for-layout">
	<div class="about-page">

		<!-- about service start -->
		<div class="about-service pt-100 pb-100">
			<div class="container">
				<!-- 移除 data-aos 和 data-aos-duration 屬性 -->
				<div class="section-header about-service-header text-center">
					<h2 class="section-heading">會員資訊</h2>
				</div>
				<div class="about-service-wrapper">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 col-12 py-4">
							<div class="about-service-inner text-center">
								<!-- 新增放置會員照片的位置 -->
								<div class="member-photo rounded-circle">
									<!-- 這裡放置會員照片的元素 -->
									<img src="path/to/member/photo.jpg" alt="會員照片"
										class="img-fluid">
									<!-- 這裡添加了 text-center 類別以置中 -->
									<div class="about-service-content text-center">
										<h4 class="about-service-title">帳號</h4>
										<p class="about-service-subtitle">XXXXXXXXXXXXXXXXX</p>
									</div>
								</div>
								<div class="about-service-content text-center">
									<h4 class="about-service-title">信箱</h4>
									<p class="about-service-subtitle">XXXXXXXXXXXXXXXXX</p>
								</div>
								<div class="about-service-content text-center">
									<h4 class="about-service-title">手機</h4>
									<p class="about-service-subtitle">XXXXXXXXXXXXXXXXX</p>
								</div>
								<div class="about-service-content text-center">
									<h4 class="about-service-title">生日</h4>
									<p class="about-service-subtitle">XXXXXXXXXXXXXXXXX</p>
								</div>
								<button type="submit" class="btn btn-primary">更改密碼</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="/WEB-INF/footer.jspf"%>