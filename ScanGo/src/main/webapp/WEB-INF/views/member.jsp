<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="/WEB-INF/header.jspf"%>


<main id="MainContent" class="content-for-layout">

	<!-- breadcrumb start -->
	<!-- <div class="breadcrumb">
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
				<li>會員資訊</li>
			</ul>
		</div>
	</div> -->
	<!-- breadcrumb end -->
		<!-- about service start -->
		<div class="about-service pt-100 pb-100 vh-100">
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
									<!-- <img src="path/to/member/photo.jpg" alt="會員照片"
										class="img-fluid"> -->
									<!-- 這裡添加了 text-center 類別以置中 -->
									<div class="about-service-content text-center">
										
										<h4 class="about-service-title"> 帳號</h4>
										<p class="about-service-subtitle">${ user.username }</p>
									</div>
								</div>
								<div class="about-service-content text-center">
									<h4 class="about-service-title">信箱</h4>
									<p class="about-service-subtitle">${ user.email }</p>
								</div>
								<div class="about-service-content text-center">
									<h4 class="about-service-title">手機</h4>
									<p class="about-service-subtitle">${ user.phone }</p>
								</div>
								<div class="about-service-content text-center">
									<h4 class="about-service-title">生日</h4>
									<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" />
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