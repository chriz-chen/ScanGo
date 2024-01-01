<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<!doctype html>
<html class="no-js">

<%@ include file="/WEB-INF/header.jspf" %>

<body>
    <main id="MainContent" class="content-for-layout">
        <!-- slideshow start -->
        <div class="slideshow-section position-relative">
            <div class="slideshow-active activate-slider" data-slick='{
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
                    <img class="slide-img d-none d-md-block" src="assets/img/slideshow/f1.jpg" alt="slide-1">
                    <img class="slide-img d-md-none" src="assets/img/slideshow/f1-m.jpg" alt="slide-1">
                    <div class="content-absolute content-slide">
                        <div class="container height-inherit d-flex align-items-center justify-content-end">
                            <div class="content-box slide-content slide-content-1 py-4">
                                <h2 class="slide-heading heading_72 animate__animated animate__fadeInUp"
                                    data-animation="animate__animated animate__fadeInUp">
                                    Discover The Best Product
                                </h2>
                                <p class="slide-subheading heading_24 animate__animated animate__fadeInUp"
                                    data-animation="animate__animated animate__fadeInUp">
                                    Look for your inspiration here
                                </p>
                                <a class="btn-primary slide-btn animate__animated animate__fadeInUp"
                                    href="collection-left-sidebar.html"
                                    data-animation="animate__animated animate__fadeInUp">SHOP
                                    NOW</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="slide-item slide-item-bag position-relative">
                    <img class="slide-img d-none d-md-block" src="assets/img/slideshow/f2.jpg" alt="slide-2">
                    <img class="slide-img d-md-none" src="assets/img/slideshow/f2-m.jpg" alt="slide-2">
                    <div class="content-absolute content-slide">
                        <div class="container height-inherit d-flex align-items-center justify-content-end">
                            <div class="content-box slide-content slide-content-1 py-4 text-center">
                                <h2 class="slide-heading heading_72 animate__animated animate__fadeInUp"
                                    data-animation="animate__animated animate__fadeInUp">
                                    Discover The Best Product
                                </h2>
                                <p class="slide-subheading heading_24 animate__animated animate__fadeInUp"
                                    data-animation="animate__animated animate__fadeInUp">
                                    Look for your inspiration here
                                </p>
                                <a class="btn-primary slide-btn animate__animated animate__fadeInUp"
                                    href="collection-left-sidebar.html"
                                    data-animation="animate__animated animate__fadeInUp">SHOP
                                    NOW</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="slide-item slide-item-bag position-relative">
                    <img class="slide-img d-none d-md-block" src="assets/img/slideshow/f3.jpg" alt="slide-3">
                    <img class="slide-img d-md-none" src="assets/img/slideshow/f3-m.jpg" alt="slide-3">
                    <div class="content-absolute content-slide">
                        <div class="container height-inherit d-flex align-items-center justify-content-center">
                            <div class="content-box slide-content slide-content-1 py-4 text-center">
                                <h2 class="slide-heading heading_72 animate__animated animate__fadeInUp"
                                    data-animation="animate__animated animate__fadeInUp">
                                    Discover The Best Product
                                </h2>
                                <p class="slide-subheading heading_24 animate__animated animate__fadeInUp"
                                    data-animation="animate__animated animate__fadeInUp">
                                    Look for your inspiration here
                                </p>
                                <a class="btn-primary slide-btn animate__animated animate__fadeInUp"
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
        <div class="featured-collection mt-100 overflow-hidden">
            <div class="collection-tab-inner">
                <div class="container">
                    <div class="section-header text-center">
                        <h2 class="section-heading primary-color">本月優惠商品</h2>
                    </div>
                    <div class="row mb-5">
                        <div class="col-6"  >
                            <div class="product-card">
                                <div class="product-card-img">
                                    <a class="hover-switch" href="collection-left-sidebar.html">
                                        <img class="secondary-img" src="assets/img/products/furniture/9.jpg"
                                            alt="product-img">
                                        <img class="primary-img" src="assets/img/products/furniture/1.jpg"
                                            alt="product-img">
                                    </a>

                                    <div class="product-badge">
                                        <span class="badge-label badge-percentage rounded">-44%</span>
                                    </div>

                                </div>
                                <div class="product-card-details">
                                    <h3 class="product-card-title">
                                        <a href="collection-left-sidebar.html">best wood furniture</a>
                                    </h3>
                                    <div class="product-card-price">
                                        <span class="card-price-regular">$1529</span>
                                        <span class="card-price-compare text-decoration-line-through">$1759</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6"  >
                            <div class="product-card">
                                <div class="product-card-img">
                                    <a class="hover-switch" href="collection-left-sidebar.html">
                                        <img class="secondary-img" src="assets/img/products/furniture/10.jpg"
                                            alt="product-img">
                                        <img class="primary-img" src="assets/img/products/furniture/2.jpg"
                                            alt="product-img">
                                    </a>
                                    
                                    <div class="product-badge">
                                        <span class="badge-label badge-percentage rounded">-44%</span>
                                    </div>

                                </div>
                                <div class="product-card-details">
                                    <h3 class="product-card-title">
                                        <a href="collection-left-sidebar.html">Vita Lounge Chair</a>
                                    </h3>
                                    <div class="product-card-price">
                                        <span class="card-price-regular">$1529</span>
                                        <span class="card-price-compare text-decoration-line-through">$1759</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6"  >
                            <div class="product-card">
                                <div class="product-card-img">
                                    <a class="hover-switch" href="collection-left-sidebar.html">
                                        <img class="secondary-img" src="assets/img/products/furniture/9.jpg"
                                            alt="product-img">
                                        <img class="primary-img" src="assets/img/products/furniture/1.jpg"
                                            alt="product-img">
                                    </a>

                                    <div class="product-badge">
                                        <span class="badge-label badge-percentage rounded">-44%</span>
                                    </div>

                                </div>
                                <div class="product-card-details">
                                    <h3 class="product-card-title">
                                        <a href="collection-left-sidebar.html">best wood furniture</a>
                                    </h3>
                                    <div class="product-card-price">
                                        <span class="card-price-regular">$1529</span>
                                        <span class="card-price-compare text-decoration-line-through">$1759</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6"  >
                            <div class="product-card">
                                <div class="product-card-img">
                                    <a class="hover-switch" href="collection-left-sidebar.html">
                                        <img class="secondary-img" src="assets/img/products/furniture/10.jpg"
                                            alt="product-img">
                                        <img class="primary-img" src="assets/img/products/furniture/2.jpg"
                                            alt="product-img">
                                    </a>
                                    
                                    <div class="product-badge">
                                        <span class="badge-label badge-percentage rounded">-44%</span>
                                    </div>

                                </div>
                                <div class="product-card-details">
                                    <h3 class="product-card-title">
                                        <a href="collection-left-sidebar.html">Vita Lounge Chair</a>
                                    </h3>
                                    <div class="product-card-price">
                                        <span class="card-price-regular">$1529</span>
                                        <span class="card-price-compare text-decoration-line-through">$1759</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <!-- collection end -->
    </main>
</body>

<%@ include file="/WEB-INF/fragments/scan.jspf" %>
<%@ include file="/WEB-INF/footer.jspf" %>
