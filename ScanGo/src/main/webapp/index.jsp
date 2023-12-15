<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ include file="/WEB-INF/header.jspf" %>

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
                                Discover The Best Furniture
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
                                Discover The Best Furniture
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
                                Discover The Best Furniture
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

    <!-- trusted badge start -->
    <div class="trusted-section mt-100 overflow-hidden">
        <div class="trusted-section-inner">
            <div class="container">
                <div class="row justify-content-center trusted-row">
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="trusted-badge rounded p-0">
                            <div class="trusted-icon">
                                <img class="icon-trusted" src="assets/img/trusted/1.png" alt="icon-1">
                            </div>
                            <div class="trusted-content">
                                <h2 class="heading_18 trusted-heading">Free Shipping & Return</h2>
                                <p class="text_16 trusted-subheading trusted-subheading-2">On all order over
                                    $99.00</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="trusted-badge rounded p-0">
                            <div class="trusted-icon">
                                <img class="icon-trusted" src="assets/img/trusted/2.png" alt="icon-2">
                            </div>
                            <div class="trusted-content">
                                <h2 class="heading_18 trusted-heading">Customer Support 24/7</h2>
                                <p class="text_16 trusted-subheading trusted-subheading-2">Instant access to
                                    support</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="trusted-badge rounded p-0">
                            <div class="trusted-icon">
                                <img class="icon-trusted" src="assets/img/trusted/3.png" alt="icon-3">
                            </div>
                            <div class="trusted-content">
                                <h2 class="heading_18 trusted-heading">100% Secure Payment</h2>
                                <p class="text_16 trusted-subheading trusted-subheading-2">We ensure secure
                                    payment!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- trusted badge end -->

    <!-- banner start -->
    <div class="grid-banner mt-100 overflow-hidden">
        <div class="collection-tab-inner mt-0">
            <div class="container">
                <div class="grid-container-2">
                    <a class="grid-item grid-item-1 position-relative rounded mt-0 d-flex" href="collection-left-sidebar.html"
                        data-aos="fade-right" data-aos-duration="700">
                        <img class="banner-img rounded" src="assets/img/banner/f1.jpg" alt="banner-1">
                        <div class="content-absolute content-slide">
                            <div class="container height-inherit d-flex">
                                <div class="content-box banner-content p-4">
                                    <h2 class="heading_34 primary-color">20% Off On <br>New Chair</h2>
                                    <p class="text_14 mt-2 primary-color">Get Instant Cashback</p>
                                    <span class="text_12 mt-4 link-underline d-block primary-color">
                                        VIEW MORE
                                    </span>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a class="grid-item grid-item-2 position-relative rounded mt-0 d-flex" href="collection-left-sidebar.html"
                        data-aos="fade-right" data-aos-duration="700">
                        <img class="banner-img rounded" src="assets/img/banner/f3.jpg" alt="banner-1">
                        <div class="content-absolute content-slide">
                            <div class="container height-inherit d-flex justify-content-end">
                                <div class="content-box banner-content p-4 text-end">
                                    <h2 class="heading_34 primary-color">Letâs buy <br>New Chair</h2>
                                    <p class="text_14 mt-2 primary-color">Get Instant Cashback</p>
                                    <span class="text_12 mt-4 link-underline d-block primary-color">
                                        VIEW MORE
                                    </span>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a class="grid-item grid-item-3 position-relative rounded mt-0 d-flex" href="collection-left-sidebar.html"
                        data-aos="fade-left" data-aos-duration="700">
                        <img class="banner-img rounded" src="assets/img/banner/f2.jpg" alt="banner-1">
                        <div class="content-absolute content-slide">
                            <div class="container height-inherit d-flex">
                                <div class="content-box banner-content p-4">
                                    <h2 class="heading_34 primary-color">Letâs buy <br>New Chair</h2>
                                    <p class="text_14 mt-2 primary-color">Get Instant Cashback</p>
                                    <span class="text_12 mt-4 link-underline d-block primary-color">
                                        VIEW MORE
                                    </span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- banner end -->

    <!-- collection start -->
    <div class="featured-collection mt-100 overflow-hidden">
        <div class="collection-tab-inner">
            <div class="container">
                <div class="section-header text-center">
                    <h2 class="section-heading primary-color">Featured Products</h2>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
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

                                <div class="product-card-action product-card-action-2 justify-content-center">
                                    <a href="#quickview-modal" class="action-card action-quickview"
                                        data-bs-toggle="modal">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M10 0C15.5117 0 20 4.48828 20 10C20 12.3945 19.1602 14.5898 17.75 16.3125L25.7188 24.2812L24.2812 25.7188L16.3125 17.75C14.5898 19.1602 12.3945 20 10 20C4.48828 20 0 15.5117 0 10C0 4.48828 4.48828 0 10 0ZM10 2C5.57031 2 2 5.57031 2 10C2 14.4297 5.57031 18 10 18C14.4297 18 18 14.4297 18 10C18 5.57031 14.4297 2 10 2ZM11 6V9H14V11H11V14H9V11H6V9H9V6H11Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-wishlist">
                                        <svg class="icon icon-wishlist" width="26" height="22"
                                            viewBox="0 0 26 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.96429 0.000183105C3.12305 0.000183105 0 3.10686 0 6.84843C0 8.15388 0.602121 9.28455 1.16071 10.1014C1.71931 10.9181 2.29241 11.4425 2.29241 11.4425L12.3326 21.3439L13 22.0002L13.6674 21.3439L23.7076 11.4425C23.7076 11.4425 26 9.45576 26 6.84843C26 3.10686 22.877 0.000183105 19.0357 0.000183105C15.8474 0.000183105 13.7944 1.88702 13 2.68241C12.2056 1.88702 10.1526 0.000183105 6.96429 0.000183105ZM6.96429 1.82638C9.73912 1.82638 12.3036 4.48008 12.3036 4.48008L13 5.25051L13.6964 4.48008C13.6964 4.48008 16.2609 1.82638 19.0357 1.82638C21.8613 1.82638 24.1429 4.10557 24.1429 6.84843C24.1429 8.25732 22.4018 10.1584 22.4018 10.1584L13 19.4036L3.59821 10.1584C3.59821 10.1584 3.14844 9.73397 2.69866 9.07411C2.24888 8.41426 1.85714 7.55466 1.85714 6.84843C1.85714 4.10557 4.13867 1.82638 6.96429 1.82638Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-addtocart">
                                        <svg class="icon icon-cart" width="24" height="26" viewBox="0 0 24 26"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 0.000183105C9.25391 0.000183105 7 2.25409 7 5.00018V6.00018H2.0625L2 6.93768L1 24.9377L0.9375 26.0002H23.0625L23 24.9377L22 6.93768L21.9375 6.00018H17V5.00018C17 2.25409 14.7461 0.000183105 12 0.000183105ZM12 2.00018C13.6562 2.00018 15 3.34393 15 5.00018V6.00018H9V5.00018C9 3.34393 10.3438 2.00018 12 2.00018ZM3.9375 8.00018H7V11.0002H9V8.00018H15V11.0002H17V8.00018H20.0625L20.9375 24.0002H3.0625L3.9375 8.00018Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="product-card-details">
                                <ul class="color-lists list-unstyled d-flex align-items-center">
                                    <li><a href="javascript:void(0)"
                                            class="color-swatch swatch-black active"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-cyan"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-purple"></a>
                                    </li>
                                </ul>
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
                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                        <div class="product-card">
                            <div class="product-card-img">
                                <a class="hover-switch" href="collection-left-sidebar.html">
                                    <img class="secondary-img" src="assets/img/products/furniture/10.jpg"
                                        alt="product-img">
                                    <img class="primary-img" src="assets/img/products/furniture/2.jpg"
                                        alt="product-img">
                                </a>

                                <div class="product-card-action product-card-action-2 justify-content-center">
                                    <a href="#quickview-modal" class="action-card action-quickview"
                                        data-bs-toggle="modal">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M10 0C15.5117 0 20 4.48828 20 10C20 12.3945 19.1602 14.5898 17.75 16.3125L25.7188 24.2812L24.2812 25.7188L16.3125 17.75C14.5898 19.1602 12.3945 20 10 20C4.48828 20 0 15.5117 0 10C0 4.48828 4.48828 0 10 0ZM10 2C5.57031 2 2 5.57031 2 10C2 14.4297 5.57031 18 10 18C14.4297 18 18 14.4297 18 10C18 5.57031 14.4297 2 10 2ZM11 6V9H14V11H11V14H9V11H6V9H9V6H11Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-wishlist">
                                        <svg class="icon icon-wishlist" width="26" height="22"
                                            viewBox="0 0 26 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.96429 0.000183105C3.12305 0.000183105 0 3.10686 0 6.84843C0 8.15388 0.602121 9.28455 1.16071 10.1014C1.71931 10.9181 2.29241 11.4425 2.29241 11.4425L12.3326 21.3439L13 22.0002L13.6674 21.3439L23.7076 11.4425C23.7076 11.4425 26 9.45576 26 6.84843C26 3.10686 22.877 0.000183105 19.0357 0.000183105C15.8474 0.000183105 13.7944 1.88702 13 2.68241C12.2056 1.88702 10.1526 0.000183105 6.96429 0.000183105ZM6.96429 1.82638C9.73912 1.82638 12.3036 4.48008 12.3036 4.48008L13 5.25051L13.6964 4.48008C13.6964 4.48008 16.2609 1.82638 19.0357 1.82638C21.8613 1.82638 24.1429 4.10557 24.1429 6.84843C24.1429 8.25732 22.4018 10.1584 22.4018 10.1584L13 19.4036L3.59821 10.1584C3.59821 10.1584 3.14844 9.73397 2.69866 9.07411C2.24888 8.41426 1.85714 7.55466 1.85714 6.84843C1.85714 4.10557 4.13867 1.82638 6.96429 1.82638Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-addtocart">
                                        <svg class="icon icon-cart" width="24" height="26" viewBox="0 0 24 26"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 0.000183105C9.25391 0.000183105 7 2.25409 7 5.00018V6.00018H2.0625L2 6.93768L1 24.9377L0.9375 26.0002H23.0625L23 24.9377L22 6.93768L21.9375 6.00018H17V5.00018C17 2.25409 14.7461 0.000183105 12 0.000183105ZM12 2.00018C13.6562 2.00018 15 3.34393 15 5.00018V6.00018H9V5.00018C9 3.34393 10.3438 2.00018 12 2.00018ZM3.9375 8.00018H7V11.0002H9V8.00018H15V11.0002H17V8.00018H20.0625L20.9375 24.0002H3.0625L3.9375 8.00018Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="product-card-details">
                                <ul class="color-lists list-unstyled d-flex align-items-center">
                                    <li><a href="javascript:void(0)"
                                            class="color-swatch swatch-black active"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-cyan"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-purple"></a>
                                    </li>
                                </ul>
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
                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                        <div class="product-card">
                            <div class="product-card-img">
                                <a class="hover-switch" href="collection-left-sidebar.html">
                                    <img class="secondary-img" src="assets/img/products/furniture/11.jpg"
                                        alt="product-img">
                                    <img class="primary-img" src="assets/img/products/furniture/3.jpg"
                                        alt="product-img">
                                </a>

                                <div class="product-badge">
                                    <span class="badge-label badge-new rounded">New</span>
                                </div>

                                <div class="product-card-action product-card-action-2 justify-content-center">
                                    <a href="#quickview-modal" class="action-card action-quickview"
                                        data-bs-toggle="modal">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M10 0C15.5117 0 20 4.48828 20 10C20 12.3945 19.1602 14.5898 17.75 16.3125L25.7188 24.2812L24.2812 25.7188L16.3125 17.75C14.5898 19.1602 12.3945 20 10 20C4.48828 20 0 15.5117 0 10C0 4.48828 4.48828 0 10 0ZM10 2C5.57031 2 2 5.57031 2 10C2 14.4297 5.57031 18 10 18C14.4297 18 18 14.4297 18 10C18 5.57031 14.4297 2 10 2ZM11 6V9H14V11H11V14H9V11H6V9H9V6H11Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-wishlist">
                                        <svg class="icon icon-wishlist" width="26" height="22"
                                            viewBox="0 0 26 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.96429 0.000183105C3.12305 0.000183105 0 3.10686 0 6.84843C0 8.15388 0.602121 9.28455 1.16071 10.1014C1.71931 10.9181 2.29241 11.4425 2.29241 11.4425L12.3326 21.3439L13 22.0002L13.6674 21.3439L23.7076 11.4425C23.7076 11.4425 26 9.45576 26 6.84843C26 3.10686 22.877 0.000183105 19.0357 0.000183105C15.8474 0.000183105 13.7944 1.88702 13 2.68241C12.2056 1.88702 10.1526 0.000183105 6.96429 0.000183105ZM6.96429 1.82638C9.73912 1.82638 12.3036 4.48008 12.3036 4.48008L13 5.25051L13.6964 4.48008C13.6964 4.48008 16.2609 1.82638 19.0357 1.82638C21.8613 1.82638 24.1429 4.10557 24.1429 6.84843C24.1429 8.25732 22.4018 10.1584 22.4018 10.1584L13 19.4036L3.59821 10.1584C3.59821 10.1584 3.14844 9.73397 2.69866 9.07411C2.24888 8.41426 1.85714 7.55466 1.85714 6.84843C1.85714 4.10557 4.13867 1.82638 6.96429 1.82638Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-addtocart">
                                        <svg class="icon icon-cart" width="24" height="26" viewBox="0 0 24 26"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 0.000183105C9.25391 0.000183105 7 2.25409 7 5.00018V6.00018H2.0625L2 6.93768L1 24.9377L0.9375 26.0002H23.0625L23 24.9377L22 6.93768L21.9375 6.00018H17V5.00018C17 2.25409 14.7461 0.000183105 12 0.000183105ZM12 2.00018C13.6562 2.00018 15 3.34393 15 5.00018V6.00018H9V5.00018C9 3.34393 10.3438 2.00018 12 2.00018ZM3.9375 8.00018H7V11.0002H9V8.00018H15V11.0002H17V8.00018H20.0625L20.9375 24.0002H3.0625L3.9375 8.00018Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="product-card-details">
                                <ul class="color-lists list-unstyled d-flex align-items-center">
                                    <li><a href="javascript:void(0)"
                                            class="color-swatch swatch-black active"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-cyan"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-purple"></a>
                                    </li>
                                </ul>
                                <h3 class="product-card-title">
                                    <a href="collection-left-sidebar.html">Sarno Dining Chair</a>
                                </h3>
                                <div class="product-card-price">
                                    <span class="card-price-regular">$1529</span>
                                    <span class="card-price-compare text-decoration-line-through">$1759</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                        <div class="product-card">
                            <div class="product-card-img">
                                <a class="hover-switch" href="collection-left-sidebar.html">
                                    <img class="secondary-img" src="assets/img/products/furniture/14.jpg"
                                        alt="product-img">
                                    <img class="primary-img" src="assets/img/products/furniture/4.jpg"
                                        alt="product-img">
                                </a>

                                <div class="product-card-action product-card-action-2 justify-content-center">
                                    <a href="#quickview-modal" class="action-card action-quickview"
                                        data-bs-toggle="modal">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M10 0C15.5117 0 20 4.48828 20 10C20 12.3945 19.1602 14.5898 17.75 16.3125L25.7188 24.2812L24.2812 25.7188L16.3125 17.75C14.5898 19.1602 12.3945 20 10 20C4.48828 20 0 15.5117 0 10C0 4.48828 4.48828 0 10 0ZM10 2C5.57031 2 2 5.57031 2 10C2 14.4297 5.57031 18 10 18C14.4297 18 18 14.4297 18 10C18 5.57031 14.4297 2 10 2ZM11 6V9H14V11H11V14H9V11H6V9H9V6H11Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-wishlist">
                                        <svg class="icon icon-wishlist" width="26" height="22"
                                            viewBox="0 0 26 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.96429 0.000183105C3.12305 0.000183105 0 3.10686 0 6.84843C0 8.15388 0.602121 9.28455 1.16071 10.1014C1.71931 10.9181 2.29241 11.4425 2.29241 11.4425L12.3326 21.3439L13 22.0002L13.6674 21.3439L23.7076 11.4425C23.7076 11.4425 26 9.45576 26 6.84843C26 3.10686 22.877 0.000183105 19.0357 0.000183105C15.8474 0.000183105 13.7944 1.88702 13 2.68241C12.2056 1.88702 10.1526 0.000183105 6.96429 0.000183105ZM6.96429 1.82638C9.73912 1.82638 12.3036 4.48008 12.3036 4.48008L13 5.25051L13.6964 4.48008C13.6964 4.48008 16.2609 1.82638 19.0357 1.82638C21.8613 1.82638 24.1429 4.10557 24.1429 6.84843C24.1429 8.25732 22.4018 10.1584 22.4018 10.1584L13 19.4036L3.59821 10.1584C3.59821 10.1584 3.14844 9.73397 2.69866 9.07411C2.24888 8.41426 1.85714 7.55466 1.85714 6.84843C1.85714 4.10557 4.13867 1.82638 6.96429 1.82638Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-addtocart">
                                        <svg class="icon icon-cart" width="24" height="26" viewBox="0 0 24 26"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 0.000183105C9.25391 0.000183105 7 2.25409 7 5.00018V6.00018H2.0625L2 6.93768L1 24.9377L0.9375 26.0002H23.0625L23 24.9377L22 6.93768L21.9375 6.00018H17V5.00018C17 2.25409 14.7461 0.000183105 12 0.000183105ZM12 2.00018C13.6562 2.00018 15 3.34393 15 5.00018V6.00018H9V5.00018C9 3.34393 10.3438 2.00018 12 2.00018ZM3.9375 8.00018H7V11.0002H9V8.00018H15V11.0002H17V8.00018H20.0625L20.9375 24.0002H3.0625L3.9375 8.00018Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="product-card-details">
                                <ul class="color-lists list-unstyled d-flex align-items-center">
                                    <li><a href="javascript:void(0)"
                                            class="color-swatch swatch-black active"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-cyan"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-purple"></a>
                                    </li>
                                </ul>
                                <h3 class="product-card-title">
                                    <a href="collection-left-sidebar.html">bisum tea table</a>
                                </h3>
                                <div class="product-card-price">
                                    <span class="card-price-regular">$1529</span>
                                    <span class="card-price-compare text-decoration-line-through">$1759</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                        <div class="product-card">
                            <div class="product-card-img">
                                <a class="hover-switch" href="collection-left-sidebar.html">
                                    <img class="secondary-img" src="assets/img/products/furniture/15.jpg"
                                        alt="product-img">
                                    <img class="primary-img" src="assets/img/products/furniture/5.jpg"
                                        alt="product-img">
                                </a>

                                <div class="product-card-action product-card-action-2 justify-content-center">
                                    <a href="#quickview-modal" class="action-card action-quickview"
                                        data-bs-toggle="modal">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M10 0C15.5117 0 20 4.48828 20 10C20 12.3945 19.1602 14.5898 17.75 16.3125L25.7188 24.2812L24.2812 25.7188L16.3125 17.75C14.5898 19.1602 12.3945 20 10 20C4.48828 20 0 15.5117 0 10C0 4.48828 4.48828 0 10 0ZM10 2C5.57031 2 2 5.57031 2 10C2 14.4297 5.57031 18 10 18C14.4297 18 18 14.4297 18 10C18 5.57031 14.4297 2 10 2ZM11 6V9H14V11H11V14H9V11H6V9H9V6H11Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-wishlist">
                                        <svg class="icon icon-wishlist" width="26" height="22"
                                            viewBox="0 0 26 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.96429 0.000183105C3.12305 0.000183105 0 3.10686 0 6.84843C0 8.15388 0.602121 9.28455 1.16071 10.1014C1.71931 10.9181 2.29241 11.4425 2.29241 11.4425L12.3326 21.3439L13 22.0002L13.6674 21.3439L23.7076 11.4425C23.7076 11.4425 26 9.45576 26 6.84843C26 3.10686 22.877 0.000183105 19.0357 0.000183105C15.8474 0.000183105 13.7944 1.88702 13 2.68241C12.2056 1.88702 10.1526 0.000183105 6.96429 0.000183105ZM6.96429 1.82638C9.73912 1.82638 12.3036 4.48008 12.3036 4.48008L13 5.25051L13.6964 4.48008C13.6964 4.48008 16.2609 1.82638 19.0357 1.82638C21.8613 1.82638 24.1429 4.10557 24.1429 6.84843C24.1429 8.25732 22.4018 10.1584 22.4018 10.1584L13 19.4036L3.59821 10.1584C3.59821 10.1584 3.14844 9.73397 2.69866 9.07411C2.24888 8.41426 1.85714 7.55466 1.85714 6.84843C1.85714 4.10557 4.13867 1.82638 6.96429 1.82638Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-addtocart">
                                        <svg class="icon icon-cart" width="24" height="26" viewBox="0 0 24 26"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 0.000183105C9.25391 0.000183105 7 2.25409 7 5.00018V6.00018H2.0625L2 6.93768L1 24.9377L0.9375 26.0002H23.0625L23 24.9377L22 6.93768L21.9375 6.00018H17V5.00018C17 2.25409 14.7461 0.000183105 12 0.000183105ZM12 2.00018C13.6562 2.00018 15 3.34393 15 5.00018V6.00018H9V5.00018C9 3.34393 10.3438 2.00018 12 2.00018ZM3.9375 8.00018H7V11.0002H9V8.00018H15V11.0002H17V8.00018H20.0625L20.9375 24.0002H3.0625L3.9375 8.00018Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="product-card-details">
                                <ul class="color-lists list-unstyled d-flex align-items-center">
                                    <li><a href="javascript:void(0)"
                                            class="color-swatch swatch-black active"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-cyan"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-purple"></a>
                                    </li>
                                </ul>
                                <h3 class="product-card-title">
                                    <a href="collection-left-sidebar.html">Eliot Reversible tool</a>
                                </h3>
                                <div class="product-card-price">
                                    <span class="card-price-regular">$1529</span>
                                    <span class="card-price-compare text-decoration-line-through">$1759</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                        <div class="product-card">
                            <div class="product-card-img">
                                <a class="hover-switch" href="collection-left-sidebar.html">
                                    <img class="secondary-img" src="assets/img/products/furniture/16.jpg"
                                        alt="product-img">
                                    <img class="primary-img" src="assets/img/products/furniture/6.jpg"
                                        alt="product-img">
                                </a>

                                <div class="product-card-action product-card-action-2 justify-content-center">
                                    <a href="#quickview-modal" class="action-card action-quickview"
                                        data-bs-toggle="modal">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M10 0C15.5117 0 20 4.48828 20 10C20 12.3945 19.1602 14.5898 17.75 16.3125L25.7188 24.2812L24.2812 25.7188L16.3125 17.75C14.5898 19.1602 12.3945 20 10 20C4.48828 20 0 15.5117 0 10C0 4.48828 4.48828 0 10 0ZM10 2C5.57031 2 2 5.57031 2 10C2 14.4297 5.57031 18 10 18C14.4297 18 18 14.4297 18 10C18 5.57031 14.4297 2 10 2ZM11 6V9H14V11H11V14H9V11H6V9H9V6H11Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-wishlist">
                                        <svg class="icon icon-wishlist" width="26" height="22"
                                            viewBox="0 0 26 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.96429 0.000183105C3.12305 0.000183105 0 3.10686 0 6.84843C0 8.15388 0.602121 9.28455 1.16071 10.1014C1.71931 10.9181 2.29241 11.4425 2.29241 11.4425L12.3326 21.3439L13 22.0002L13.6674 21.3439L23.7076 11.4425C23.7076 11.4425 26 9.45576 26 6.84843C26 3.10686 22.877 0.000183105 19.0357 0.000183105C15.8474 0.000183105 13.7944 1.88702 13 2.68241C12.2056 1.88702 10.1526 0.000183105 6.96429 0.000183105ZM6.96429 1.82638C9.73912 1.82638 12.3036 4.48008 12.3036 4.48008L13 5.25051L13.6964 4.48008C13.6964 4.48008 16.2609 1.82638 19.0357 1.82638C21.8613 1.82638 24.1429 4.10557 24.1429 6.84843C24.1429 8.25732 22.4018 10.1584 22.4018 10.1584L13 19.4036L3.59821 10.1584C3.59821 10.1584 3.14844 9.73397 2.69866 9.07411C2.24888 8.41426 1.85714 7.55466 1.85714 6.84843C1.85714 4.10557 4.13867 1.82638 6.96429 1.82638Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-addtocart">
                                        <svg class="icon icon-cart" width="24" height="26" viewBox="0 0 24 26"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 0.000183105C9.25391 0.000183105 7 2.25409 7 5.00018V6.00018H2.0625L2 6.93768L1 24.9377L0.9375 26.0002H23.0625L23 24.9377L22 6.93768L21.9375 6.00018H17V5.00018C17 2.25409 14.7461 0.000183105 12 0.000183105ZM12 2.00018C13.6562 2.00018 15 3.34393 15 5.00018V6.00018H9V5.00018C9 3.34393 10.3438 2.00018 12 2.00018ZM3.9375 8.00018H7V11.0002H9V8.00018H15V11.0002H17V8.00018H20.0625L20.9375 24.0002H3.0625L3.9375 8.00018Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="product-card-details">
                                <ul class="color-lists list-unstyled d-flex align-items-center">
                                    <li><a href="javascript:void(0)"
                                            class="color-swatch swatch-black active"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-cyan"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-purple"></a>
                                    </li>
                                </ul>
                                <h3 class="product-card-title">
                                    <a href="collection-left-sidebar.html">Vita Lounge wardrobe</a>
                                </h3>
                                <div class="product-card-price">
                                    <span class="card-price-regular">$1529</span>
                                    <span class="card-price-compare text-decoration-line-through">$1759</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                        <div class="product-card">
                            <div class="product-card-img">
                                <a class="hover-switch" href="collection-left-sidebar.html">
                                    <img class="secondary-img" src="assets/img/products/furniture/17.jpg"
                                        alt="product-img">
                                    <img class="primary-img" src="assets/img/products/furniture/7.jpg"
                                        alt="product-img">
                                </a>

                                <div class="product-card-action product-card-action-2 justify-content-center">
                                    <a href="#quickview-modal" class="action-card action-quickview"
                                        data-bs-toggle="modal">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M10 0C15.5117 0 20 4.48828 20 10C20 12.3945 19.1602 14.5898 17.75 16.3125L25.7188 24.2812L24.2812 25.7188L16.3125 17.75C14.5898 19.1602 12.3945 20 10 20C4.48828 20 0 15.5117 0 10C0 4.48828 4.48828 0 10 0ZM10 2C5.57031 2 2 5.57031 2 10C2 14.4297 5.57031 18 10 18C14.4297 18 18 14.4297 18 10C18 5.57031 14.4297 2 10 2ZM11 6V9H14V11H11V14H9V11H6V9H9V6H11Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-wishlist">
                                        <svg class="icon icon-wishlist" width="26" height="22"
                                            viewBox="0 0 26 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.96429 0.000183105C3.12305 0.000183105 0 3.10686 0 6.84843C0 8.15388 0.602121 9.28455 1.16071 10.1014C1.71931 10.9181 2.29241 11.4425 2.29241 11.4425L12.3326 21.3439L13 22.0002L13.6674 21.3439L23.7076 11.4425C23.7076 11.4425 26 9.45576 26 6.84843C26 3.10686 22.877 0.000183105 19.0357 0.000183105C15.8474 0.000183105 13.7944 1.88702 13 2.68241C12.2056 1.88702 10.1526 0.000183105 6.96429 0.000183105ZM6.96429 1.82638C9.73912 1.82638 12.3036 4.48008 12.3036 4.48008L13 5.25051L13.6964 4.48008C13.6964 4.48008 16.2609 1.82638 19.0357 1.82638C21.8613 1.82638 24.1429 4.10557 24.1429 6.84843C24.1429 8.25732 22.4018 10.1584 22.4018 10.1584L13 19.4036L3.59821 10.1584C3.59821 10.1584 3.14844 9.73397 2.69866 9.07411C2.24888 8.41426 1.85714 7.55466 1.85714 6.84843C1.85714 4.10557 4.13867 1.82638 6.96429 1.82638Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-addtocart">
                                        <svg class="icon icon-cart" width="24" height="26" viewBox="0 0 24 26"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 0.000183105C9.25391 0.000183105 7 2.25409 7 5.00018V6.00018H2.0625L2 6.93768L1 24.9377L0.9375 26.0002H23.0625L23 24.9377L22 6.93768L21.9375 6.00018H17V5.00018C17 2.25409 14.7461 0.000183105 12 0.000183105ZM12 2.00018C13.6562 2.00018 15 3.34393 15 5.00018V6.00018H9V5.00018C9 3.34393 10.3438 2.00018 12 2.00018ZM3.9375 8.00018H7V11.0002H9V8.00018H15V11.0002H17V8.00018H20.0625L20.9375 24.0002H3.0625L3.9375 8.00018Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="product-card-details">
                                <ul class="color-lists list-unstyled d-flex align-items-center">
                                    <li><a href="javascript:void(0)"
                                            class="color-swatch swatch-black active"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-cyan"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-purple"></a>
                                    </li>
                                </ul>
                                <h3 class="product-card-title">
                                    <a href="collection-left-sidebar.html">Sarno Dining Chair</a>
                                </h3>
                                <div class="product-card-price">
                                    <span class="card-price-regular">$1529</span>
                                    <span class="card-price-compare text-decoration-line-through">$1759</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                        <div class="product-card">
                            <div class="product-card-img">
                                <a class="hover-switch" href="collection-left-sidebar.html">
                                    <img class="secondary-img" src="assets/img/products/furniture/19.jpg"
                                        alt="product-img">
                                    <img class="primary-img" src="assets/img/products/furniture/8.jpg"
                                        alt="product-img">
                                </a>

                                <div class="product-card-action product-card-action-2 justify-content-center">
                                    <a href="#quickview-modal" class="action-card action-quickview"
                                        data-bs-toggle="modal">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M10 0C15.5117 0 20 4.48828 20 10C20 12.3945 19.1602 14.5898 17.75 16.3125L25.7188 24.2812L24.2812 25.7188L16.3125 17.75C14.5898 19.1602 12.3945 20 10 20C4.48828 20 0 15.5117 0 10C0 4.48828 4.48828 0 10 0ZM10 2C5.57031 2 2 5.57031 2 10C2 14.4297 5.57031 18 10 18C14.4297 18 18 14.4297 18 10C18 5.57031 14.4297 2 10 2ZM11 6V9H14V11H11V14H9V11H6V9H9V6H11Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-wishlist">
                                        <svg class="icon icon-wishlist" width="26" height="22"
                                            viewBox="0 0 26 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.96429 0.000183105C3.12305 0.000183105 0 3.10686 0 6.84843C0 8.15388 0.602121 9.28455 1.16071 10.1014C1.71931 10.9181 2.29241 11.4425 2.29241 11.4425L12.3326 21.3439L13 22.0002L13.6674 21.3439L23.7076 11.4425C23.7076 11.4425 26 9.45576 26 6.84843C26 3.10686 22.877 0.000183105 19.0357 0.000183105C15.8474 0.000183105 13.7944 1.88702 13 2.68241C12.2056 1.88702 10.1526 0.000183105 6.96429 0.000183105ZM6.96429 1.82638C9.73912 1.82638 12.3036 4.48008 12.3036 4.48008L13 5.25051L13.6964 4.48008C13.6964 4.48008 16.2609 1.82638 19.0357 1.82638C21.8613 1.82638 24.1429 4.10557 24.1429 6.84843C24.1429 8.25732 22.4018 10.1584 22.4018 10.1584L13 19.4036L3.59821 10.1584C3.59821 10.1584 3.14844 9.73397 2.69866 9.07411C2.24888 8.41426 1.85714 7.55466 1.85714 6.84843C1.85714 4.10557 4.13867 1.82638 6.96429 1.82638Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>

                                    <a href="#" class="action-card action-addtocart">
                                        <svg class="icon icon-cart" width="24" height="26" viewBox="0 0 24 26"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 0.000183105C9.25391 0.000183105 7 2.25409 7 5.00018V6.00018H2.0625L2 6.93768L1 24.9377L0.9375 26.0002H23.0625L23 24.9377L22 6.93768L21.9375 6.00018H17V5.00018C17 2.25409 14.7461 0.000183105 12 0.000183105ZM12 2.00018C13.6562 2.00018 15 3.34393 15 5.00018V6.00018H9V5.00018C9 3.34393 10.3438 2.00018 12 2.00018ZM3.9375 8.00018H7V11.0002H9V8.00018H15V11.0002H17V8.00018H20.0625L20.9375 24.0002H3.0625L3.9375 8.00018Z"
                                                fill="#00234D" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="product-card-details">
                                <ul class="color-lists list-unstyled d-flex align-items-center">
                                    <li><a href="javascript:void(0)"
                                            class="color-swatch swatch-black active"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-cyan"></a></li>
                                    <li><a href="javascript:void(0)" class="color-swatch swatch-purple"></a>
                                    </li>
                                </ul>
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
                <div class="view-all text-center" data-aos="fade-up" data-aos-duration="700">
                    <a class="btn-primary" href="#">VIEW ALL</a>
                </div>
            </div>
        </div>
    </div>
    <!-- collection end -->

    <!-- shop by category start -->
    <div class="shop-category mt-100 overflow-hidden">
        <div class="collection-tab-inner mt-0">
            <div class="container">
                <div class="section-header text-center">
                    <h2 class="section-heading primary-color">Shop By Category</h2>
                </div>
                <div class="shop-category-2 shop-category-inner">
                    <div class="scattered-item" data-aos="fade-left" data-aos-duration="700">
                        <div class="scattered-wrapper">
                            <div class="scattered-content">
                                <img class="scattered-img" src="assets/img/banner/f4.jpg" alt="img">
                            </div>
                            <div class="scattered-details">
                                <h2 class="scattered-heading primary-color">Home Decor</h2>
                                <a href="collection-left-sidebar.html"
                                    class="text_12 link-underline d-block primary-color mt-2">
                                    SHOP COLLECTION
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="scattered-item" data-aos="fade-right" data-aos-duration="700">
                        <div class="scattered-wrapper">
                            <div class="scattered-content">
                                <img class="scattered-img" src="assets/img/banner/f5.jpg" alt="img">
                            </div>
                            <div class="scattered-details">
                                <h2 class="scattered-heading primary-color">Storage Furniture</h2>
                                <a href="#2" class="text_12 link-underline d-block primary-color mt-2">
                                    SHOP COLLECTION
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="scattered-item" data-aos="fade-left" data-aos-duration="700">
                        <div class="scattered-wrapper">
                            <div class="scattered-content">
                                <img class="scattered-img" src="assets/img/banner/f6.jpg" alt="img">
                            </div>
                            <div class="scattered-details">
                                <h2 class="scattered-heading primary-color">Black Cusion Chair</h2>
                                <a href="#3" class="text_12 link-underline d-block primary-color mt-2">
                                    SHOP COLLECTION
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- shop by category end -->

    <!-- video start -->
    <div class="video-section mt-100 overflow-hidden">
        <div class="overlay-furniture section-spacing"
            style="background: url('./assets/img/video/video-furniture.jpg') no-repeat fixed bottom center/cover">
            <div class="container video-container">
                <div class="row">
                    <div class="col-12">
                        <div class="video-tools d-flex align-items-center justify-content-center">
                            <div class="video-button-area">
                                <a class="video-button" href="#video-modal" data-bs-toggle="modal">
                                    <svg width="22" height="26" viewBox="0 0 22 26" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M21.5 12.134C22.1667 12.5189 22.1667 13.4811 21.5 13.866L2 25.1244C1.33333 25.5093 0.499999 25.0281 0.499999 24.2583L0.5 1.74167C0.5 0.971867 1.33333 0.490743 2 0.875643L21.5 12.134Z"
                                            fill="#FEFEFE" />
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" tabindex="-1" id="video-modal">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <iframe height="600" src="https://www.youtube.com/embed/tvPnrfQCiCo"
                            title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- video end -->

    <!-- testimonial start -->
    <div class="testimonial-section mt-100 overflow-hidden home-section">
        <div class="testimonial-inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-12 col-12" data-aos="fade-right" data-aos-duration="700">
                        <div class="section-header">
                            <h2 class="section-heading primary-color">What customer say</h2>
                            <p class="section-subheading">
                                The services provided by the officials was smooth and satisfactory. Products and
                                goods delivered were up to satisfaction.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-6 offset-lg-1 col-md-12 col-12" data-aos="fade-left"
                        data-aos-duration="700">
                        <div class="testimonial-container position-relative">
                            <div class="testimonial-slideshow common-slider" data-slick='{
                                    "slidesToShow": 1, 
                                    "slidesToScroll": 1,
                                    "dots": false,
                                    "arrows": true
                                }'>
                                <div class="testimonial-item">
                                    <div class="testimonial-icon-wrap d-flex align-items-center">
                                        <div class="testimonial-icon-quote">
                                            <svg width="40" height="29" viewBox="0 0 40 29" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M0 28.99L11.7 0H19.5L12.22 28.99H0ZM20.28 28.99L32.11 0H39.91L32.5 28.99H20.28Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </div>
                                        <div class="testimonial-icon-star d-flex align-items-center ms-3">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                        </div>
                                    </div>
                                    <p class="testimonial-review my-4 text_16">
                                        â I am purchasing furniture from Bisum since the last 6 years. I love
                                        their
                                        prompt service and so far I have faced no complaints with their
                                        furniture.â
                                    </p>
                                    <div class="testimonial-reviewer d-flex align-items-center">
                                        <div class="reviewer-img">
                                            <img src="assets/img/testimonial/john.jpg" alt="img">
                                        </div>
                                        <div class="reviewer-info ms-4">
                                            <h4 class="reviewer-name heading_18 mb-2 primary-color">Floyd Miles
                                            </h4>
                                            <p class="reviewer-desig text_14 m-0">Executive, Hypebeast</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="testimonial-item">
                                    <div class="testimonial-icon-wrap d-flex align-items-center">
                                        <div class="testimonial-icon-quote">
                                            <svg width="40" height="29" viewBox="0 0 40 29" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M0 28.99L11.7 0H19.5L12.22 28.99H0ZM20.28 28.99L32.11 0H39.91L32.5 28.99H20.28Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </div>
                                        <div class="testimonial-icon-star d-flex align-items-center ms-3">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                        </div>
                                    </div>
                                    <p class="testimonial-review my-4 text_16">
                                        â I am purchasing furniture from Bisum since the last 6 years. I love
                                        their
                                        prompt service and so far I have faced no complaints with their
                                        furniture.â
                                    </p>
                                    <div class="testimonial-reviewer d-flex align-items-center">
                                        <div class="reviewer-img">
                                            <img src="assets/img/testimonial/john.jpg" alt="img">
                                        </div>
                                        <div class="reviewer-info ms-4">
                                            <h4 class="reviewer-name heading_18 mb-2 primary-color">Floyd Miles
                                            </h4>
                                            <p class="reviewer-desig text_14 m-0">Executive, Hypebeast</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="testimonial-item">
                                    <div class="testimonial-icon-wrap d-flex align-items-center">
                                        <div class="testimonial-icon-quote">
                                            <svg width="40" height="29" viewBox="0 0 40 29" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M0 28.99L11.7 0H19.5L12.22 28.99H0ZM20.28 28.99L32.11 0H39.91L32.5 28.99H20.28Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </div>
                                        <div class="testimonial-icon-star d-flex align-items-center ms-3">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                            <img src="assets/img/icon/star.png" alt="img">
                                        </div>
                                    </div>
                                    <p class="testimonial-review my-4 text_16">
                                        â I am purchasing furniture from Bisum since the last 6 years. I love
                                        their
                                        prompt service and so far I have faced no complaints with their
                                        furniture.â
                                    </p>
                                    <div class="testimonial-reviewer d-flex align-items-center">
                                        <div class="reviewer-img">
                                            <img src="assets/img/testimonial/john.jpg" alt="img">
                                        </div>
                                        <div class="reviewer-info ms-4">
                                            <h4 class="reviewer-name heading_18 mb-2 primary-color">Floyd Miles
                                            </h4>
                                            <p class="reviewer-desig text_14 m-0">Executive, Hypebeast</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="activate-arrows show-arrows-always article-arrows arrows-white"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- testimonial end -->

    <!-- single banner start -->
    <div class="single-banner-section mt-100 overflow-hidden">
        <div class="position-relative overlay">
            <img class="single-banner-img" src="assets/img/banner/single-banner-2.jpg" alt="slide-1">

            <div class="content-absolute content-slide">
                <div class="container height-inherit d-flex align-items-center justify-content-center">
                    <div class="content-box single-banner-content py-4 text-center" data-aos="fade-up"
                        data-aos-duration="700">
                        <h2 class="single-banner-heading heading_42 text-white animate__animated animate__fadeInUp"
                            data-animation="animate__animated animate__fadeInUp" data-aos="fade-up"
                            data-aos-duration="700">
                            Created Furniture
                        </h2>
                        <p class="single-banner-text text_16 text-white animate__animated animate__fadeInUp"
                            data-animation="animate__animated animate__fadeInUp" data-aos="fade-up"
                            data-aos-duration="700">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus.
                        </p>
                        <a class="btn-primary single-banner-btn animate__animated animate__fadeInUp"
                            href="collection-left-sidebar.html"
                            data-animation="animate__animated animate__fadeInUp" data-aos="fade-up"
                            data-aos-duration="700">
                            DISCOVER NOW
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- single banner end -->

    <!-- latest blog start -->
    <div class="latest-blog-section mt-100 overflow-hidden home-section">
        <div class="latest-blog-inner">
            <div class="container">
                <div class="section-header text-center">
                    <h2 class="section-heading primary-color">Latest blogs</h2>
                </div>
                <div class="article-card-container position-relative">
                    <div class="common-slider" data-slick='{
                        "slidesToShow": 3, 
                        "slidesToScroll": 1,
                        "dots": false,
                        "arrows": true,
                        "responsive": [
                          {
                            "breakpoint": 1281,
                            "settings": {
                              "slidesToShow": 2
                            }
                          },
                          {
                            "breakpoint": 602,
                            "settings": {
                              "slidesToShow": 1
                            }
                          }
                        ]
                    }'>

                        <div class="article-slick-item" data-aos="fade-up" data-aos-duration="700">
                            <div class="article-card bg-transparent p-0 shadow-none">
                                <a class="article-card-img-wrapper" href="article.html">
                                    <img src="assets/img/blog/furniture-1.jpg" alt="img"
                                        class="article-card-img rounded">

                                    <span class="article-tag article-tag-absolute rounded">Decor</span>
                                </a>
                                <p class="article-card-published text_12 d-flex align-items-center">
                                    <span class="article-date d-flex align-items-center">
                                        <span class="icon-publish">
                                            <svg width="17" height="18" viewBox="0 0 17 18" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M3.46875 0.875V1.59375H0.59375V17.4063H16.4063V1.59375H13.5313V0.875H12.0938V1.59375H4.90625V0.875H3.46875ZM2.03125 3.03125H3.46875V3.75H4.90625V3.03125H12.0938V3.75H13.5313V3.03125H14.9688V4.46875H2.03125V3.03125ZM2.03125 5.90625H14.9688V15.9688H2.03125V5.90625ZM6.34375 7.34375V8.78125H7.78125V7.34375H6.34375ZM9.21875 7.34375V8.78125H10.6563V7.34375H9.21875ZM12.0938 7.34375V8.78125H13.5313V7.34375H12.0938ZM3.46875 10.2188V11.6563H4.90625V10.2188H3.46875ZM6.34375 10.2188V11.6563H7.78125V10.2188H6.34375ZM9.21875 10.2188V11.6563H10.6563V10.2188H9.21875ZM12.0938 10.2188V11.6563H13.5313V10.2188H12.0938ZM3.46875 13.0938V14.5313H4.90625V13.0938H3.46875ZM6.34375 13.0938V14.5313H7.78125V13.0938H6.34375ZM9.21875 13.0938V14.5313H10.6563V13.0938H9.21875Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </span>
                                        <span class="ms-2">30 December, 2022</span>
                                    </span>
                                    <span class="article-author d-flex align-items-center ms-4">
                                        <span class="icon-author"><svg width="15" height="17"
                                                viewBox="0 0 15 17" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.5 0.59375C4.72888 0.59375 2.46875 2.85388 2.46875 5.625C2.46875 7.3573 3.35315 8.89587 4.69238 9.80274C2.12903 10.9033 0.3125 13.447 0.3125 16.4063H1.75C1.75 13.2224 4.31616 10.6563 7.5 10.6563C10.6838 10.6563 13.25 13.2224 13.25 16.4063H14.6875C14.6875 13.447 12.871 10.9033 10.3076 9.80274C11.6469 8.89587 12.5313 7.3573 12.5313 5.625C12.5313 2.85388 10.2711 0.59375 7.5 0.59375ZM7.5 2.03125C9.49341 2.03125 11.0938 3.63159 11.0938 5.625C11.0938 7.61841 9.49341 9.21875 7.5 9.21875C5.50659 9.21875 3.90625 7.61841 3.90625 5.625C3.90625 3.63159 5.50659 2.03125 7.5 2.03125Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </span>
                                        <span class="ms-2">Lara Joe</span>
                                    </span>
                                </p>
                                <h2 class="article-card-heading heading_18">
                                    <a class="heading_18" href="article.html">
                                        Pure is the most furniture.
                                    </a>
                                </h2>
                            </div>
                        </div>
                        <div class="article-slick-item" data-aos="fade-up" data-aos-duration="700">
                            <div class="article-card bg-transparent p-0 shadow-none">
                                <a class="article-card-img-wrapper" href="article.html">
                                    <img src="assets/img/blog/furniture-2.jpg" alt="img"
                                        class="article-card-img rounded">
                                    <span class="article-tag article-tag-absolute rounded">Furniture</span>
                                </a>
                                <p class="article-card-published text_12 d-flex align-items-center">
                                    <span class="article-date d-flex align-items-center">
                                        <span class="icon-publish">
                                            <svg width="17" height="18" viewBox="0 0 17 18" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M3.46875 0.875V1.59375H0.59375V17.4063H16.4063V1.59375H13.5313V0.875H12.0938V1.59375H4.90625V0.875H3.46875ZM2.03125 3.03125H3.46875V3.75H4.90625V3.03125H12.0938V3.75H13.5313V3.03125H14.9688V4.46875H2.03125V3.03125ZM2.03125 5.90625H14.9688V15.9688H2.03125V5.90625ZM6.34375 7.34375V8.78125H7.78125V7.34375H6.34375ZM9.21875 7.34375V8.78125H10.6563V7.34375H9.21875ZM12.0938 7.34375V8.78125H13.5313V7.34375H12.0938ZM3.46875 10.2188V11.6563H4.90625V10.2188H3.46875ZM6.34375 10.2188V11.6563H7.78125V10.2188H6.34375ZM9.21875 10.2188V11.6563H10.6563V10.2188H9.21875ZM12.0938 10.2188V11.6563H13.5313V10.2188H12.0938ZM3.46875 13.0938V14.5313H4.90625V13.0938H3.46875ZM6.34375 13.0938V14.5313H7.78125V13.0938H6.34375ZM9.21875 13.0938V14.5313H10.6563V13.0938H9.21875Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </span>
                                        <span class="ms-2">30 December, 2022</span>
                                    </span>
                                    <span class="article-author d-flex align-items-center ms-4">
                                        <span class="icon-author"><svg width="15" height="17"
                                                viewBox="0 0 15 17" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.5 0.59375C4.72888 0.59375 2.46875 2.85388 2.46875 5.625C2.46875 7.3573 3.35315 8.89587 4.69238 9.80274C2.12903 10.9033 0.3125 13.447 0.3125 16.4063H1.75C1.75 13.2224 4.31616 10.6563 7.5 10.6563C10.6838 10.6563 13.25 13.2224 13.25 16.4063H14.6875C14.6875 13.447 12.871 10.9033 10.3076 9.80274C11.6469 8.89587 12.5313 7.3573 12.5313 5.625C12.5313 2.85388 10.2711 0.59375 7.5 0.59375ZM7.5 2.03125C9.49341 2.03125 11.0938 3.63159 11.0938 5.625C11.0938 7.61841 9.49341 9.21875 7.5 9.21875C5.50659 9.21875 3.90625 7.61841 3.90625 5.625C3.90625 3.63159 5.50659 2.03125 7.5 2.03125Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </span>
                                        <span class="ms-2">Lara Joe</span>
                                    </span>
                                </p>
                                <h2 class="article-card-heading heading_18">
                                    <a class="heading_18" href="article.html">
                                        Minimalism in your room.
                                    </a>
                                </h2>
                            </div>
                        </div>
                        <div class="article-slick-item" data-aos="fade-up" data-aos-duration="700">
                            <div class="article-card bg-transparent p-0 shadow-none">
                                <a class="article-card-img-wrapper" href="article.html">
                                    <img src="assets/img/blog/furniture-3.jpg" alt="img"
                                        class="article-card-img rounded">
                                    <span class="article-tag article-tag-absolute rounded">Kitchen</span>
                                </a>
                                <p class="article-card-published text_12 d-flex align-items-center">
                                    <span class="article-date d-flex align-items-center">
                                        <span class="icon-publish">
                                            <svg width="17" height="18" viewBox="0 0 17 18" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M3.46875 0.875V1.59375H0.59375V17.4063H16.4063V1.59375H13.5313V0.875H12.0938V1.59375H4.90625V0.875H3.46875ZM2.03125 3.03125H3.46875V3.75H4.90625V3.03125H12.0938V3.75H13.5313V3.03125H14.9688V4.46875H2.03125V3.03125ZM2.03125 5.90625H14.9688V15.9688H2.03125V5.90625ZM6.34375 7.34375V8.78125H7.78125V7.34375H6.34375ZM9.21875 7.34375V8.78125H10.6563V7.34375H9.21875ZM12.0938 7.34375V8.78125H13.5313V7.34375H12.0938ZM3.46875 10.2188V11.6563H4.90625V10.2188H3.46875ZM6.34375 10.2188V11.6563H7.78125V10.2188H6.34375ZM9.21875 10.2188V11.6563H10.6563V10.2188H9.21875ZM12.0938 10.2188V11.6563H13.5313V10.2188H12.0938ZM3.46875 13.0938V14.5313H4.90625V13.0938H3.46875ZM6.34375 13.0938V14.5313H7.78125V13.0938H6.34375ZM9.21875 13.0938V14.5313H10.6563V13.0938H9.21875Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </span>
                                        <span class="ms-2">30 December, 2022</span>
                                    </span>
                                    <span class="article-author d-flex align-items-center ms-4">
                                        <span class="icon-author"><svg width="15" height="17"
                                                viewBox="0 0 15 17" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.5 0.59375C4.72888 0.59375 2.46875 2.85388 2.46875 5.625C2.46875 7.3573 3.35315 8.89587 4.69238 9.80274C2.12903 10.9033 0.3125 13.447 0.3125 16.4063H1.75C1.75 13.2224 4.31616 10.6563 7.5 10.6563C10.6838 10.6563 13.25 13.2224 13.25 16.4063H14.6875C14.6875 13.447 12.871 10.9033 10.3076 9.80274C11.6469 8.89587 12.5313 7.3573 12.5313 5.625C12.5313 2.85388 10.2711 0.59375 7.5 0.59375ZM7.5 2.03125C9.49341 2.03125 11.0938 3.63159 11.0938 5.625C11.0938 7.61841 9.49341 9.21875 7.5 9.21875C5.50659 9.21875 3.90625 7.61841 3.90625 5.625C3.90625 3.63159 5.50659 2.03125 7.5 2.03125Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </span>
                                        <span class="ms-2">Lara Joe</span>
                                    </span>
                                </p>
                                <h2 class="article-card-heading heading_18">
                                    <a class="heading_18" href="article.html">
                                        Build up your kitchen.
                                    </a>
                                </h2>
                            </div>
                        </div>
                        <div class="article-slick-item" data-aos="fade-up" data-aos-duration="700">
                            <div class="article-card bg-transparent p-0 shadow-none">
                                <a class="article-card-img-wrapper" href="article.html">
                                    <img src="assets/img/blog/furniture-4.jpg" alt="img"
                                        class="article-card-img rounded">
                                    <span class="article-tag article-tag-absolute rounded">Furniture</span>
                                </a>
                                <p class="article-card-published text_12 d-flex align-items-center">
                                    <span class="article-date d-flex align-items-center">
                                        <span class="icon-publish">
                                            <svg width="17" height="18" viewBox="0 0 17 18" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M3.46875 0.875V1.59375H0.59375V17.4063H16.4063V1.59375H13.5313V0.875H12.0938V1.59375H4.90625V0.875H3.46875ZM2.03125 3.03125H3.46875V3.75H4.90625V3.03125H12.0938V3.75H13.5313V3.03125H14.9688V4.46875H2.03125V3.03125ZM2.03125 5.90625H14.9688V15.9688H2.03125V5.90625ZM6.34375 7.34375V8.78125H7.78125V7.34375H6.34375ZM9.21875 7.34375V8.78125H10.6563V7.34375H9.21875ZM12.0938 7.34375V8.78125H13.5313V7.34375H12.0938ZM3.46875 10.2188V11.6563H4.90625V10.2188H3.46875ZM6.34375 10.2188V11.6563H7.78125V10.2188H6.34375ZM9.21875 10.2188V11.6563H10.6563V10.2188H9.21875ZM12.0938 10.2188V11.6563H13.5313V10.2188H12.0938ZM3.46875 13.0938V14.5313H4.90625V13.0938H3.46875ZM6.34375 13.0938V14.5313H7.78125V13.0938H6.34375ZM9.21875 13.0938V14.5313H10.6563V13.0938H9.21875Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </span>
                                        <span class="ms-2">30 December, 2022</span>
                                    </span>
                                    <span class="article-author d-flex align-items-center ms-4">
                                        <span class="icon-author"><svg width="15" height="17"
                                                viewBox="0 0 15 17" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.5 0.59375C4.72888 0.59375 2.46875 2.85388 2.46875 5.625C2.46875 7.3573 3.35315 8.89587 4.69238 9.80274C2.12903 10.9033 0.3125 13.447 0.3125 16.4063H1.75C1.75 13.2224 4.31616 10.6563 7.5 10.6563C10.6838 10.6563 13.25 13.2224 13.25 16.4063H14.6875C14.6875 13.447 12.871 10.9033 10.3076 9.80274C11.6469 8.89587 12.5313 7.3573 12.5313 5.625C12.5313 2.85388 10.2711 0.59375 7.5 0.59375ZM7.5 2.03125C9.49341 2.03125 11.0938 3.63159 11.0938 5.625C11.0938 7.61841 9.49341 9.21875 7.5 9.21875C5.50659 9.21875 3.90625 7.61841 3.90625 5.625C3.90625 3.63159 5.50659 2.03125 7.5 2.03125Z"
                                                    fill="#00234D" />
                                            </svg>
                                        </span>
                                        <span class="ms-2">Lara Joe</span>
                                    </span>
                                </p>
                                <h2 class="article-card-heading heading_18">
                                    <a class="heading_18" href="article.html">
                                        Minimalism in your room.
                                    </a>
                                </h2>
                            </div>
                        </div>
                    </div>
                    <div class="activate-arrows show-arrows-always article-arrows arrows-white"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- latest blog end -->

    <!-- brand logo start -->
    <div class="brand-logo-section mt-100">
        <div class="brand-logo-inner">
            <div class="container">
                <div class="brand-logo-container overflow-hidden">
                    <div class="scroll-horizontal row align-items-center flex-nowrap">
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-6" data-aos="fade-up"
                            data-aos-duration="700">
                            <a href="index.html" class="brand-logo d-flex align-items-center justify-content-center">
                                <img src="assets/img/brand/1.png" alt="img">
                            </a>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-6" data-aos="fade-up"
                            data-aos-duration="700">
                            <a href="index.html" class="brand-logo d-flex align-items-center justify-content-center">
                                <img src="assets/img/brand/2.png" alt="img">
                            </a>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-6" data-aos="fade-up"
                            data-aos-duration="700">
                            <a href="index.html" class="brand-logo d-flex align-items-center justify-content-center">
                                <img src="assets/img/brand/3.png" alt="img">
                            </a>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-6" data-aos="fade-up"
                            data-aos-duration="700">
                            <a href="index.html" class="brand-logo d-flex align-items-center justify-content-center">
                                <img src="assets/img/brand/4.png" alt="img">
                            </a>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-6" data-aos="fade-up"
                            data-aos-duration="700">
                            <a href="index.html" class="brand-logo d-flex align-items-center justify-content-center">
                                <img src="assets/img/brand/5.png" alt="img">
                            </a>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-6" data-aos="fade-up"
                            data-aos-duration="700">
                            <a href="index.html" class="brand-logo d-flex align-items-center justify-content-center">
                                <img src="assets/img/brand/6.png" alt="img">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- brand logo end -->
</main>

<%@ include file="/WEB-INF/footer.jspf" %>