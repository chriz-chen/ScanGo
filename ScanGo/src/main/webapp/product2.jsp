<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jspf"%>


<main id="MainContent" class="content-for-layout">
            <div class="collection mt-100">
                <div class="container">
                    <div class="row">
                        <!-- product area start -->
                        <div class="col-lg-12 col-md-12 col-12">
                            <div class="filter-sort-wrapper d-flex justify-content-between flex-wrap">
                                <div class="collection-title-wrap d-flex align-items-end">
                                    <h2 class="collection-title heading_24 mb-0">All products</h2>
                                    <p class="collection-counter text_16 mb-0 ms-2">(237 items)</p>
                                </div>
                            </div>
                            <div class="collection-product-container">
                                <div class="row">
                                    <!-- product1 -->
                                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                                        <div class="product-card" id="productCard1">
                                            <div class="product-card-img">
                                                <a class="hover-switch" href="javascript:void(0);" onclick="openModal1()">
                                                    <img class="secondary-img" src="/ScanGo/assets/img/logo.png" alt="product-img">
                                                    <img class="primary-img" src="/ScanGo/assets/img/logo.png" alt="product-img">
                                                </a>
                                                
                                            </div>

                                    
                                            
                                            <div class="product-card-details">
                                                <h3 class="product-card-title">
                                                    <a href="collection-left-sidebar.html">11111111111</a>
                                                </h3>
                                                <div class="product-card-price">
                                                    <span class="card-price-regular">$1529</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product2 -->
                                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                                        <div class="product-card" id="productCard2">
                                            <div class="product-card-img">
                                                <a class="hover-switch" href="javascript:void(0);" onclick="openModal2()">
                                                    <img class="secondary-img"
                                                        src="/ScanGo/assets/img/logo.png" alt="product-img">
                                                    <img class="primary-img" src="/ScanGo/assets/img/logo.png"
                                                        alt="product-img">
                                                </a>
                                            </div>
                                            <div class="product-card-details">
                                                <h3 class="product-card-title">
                                                    <a href="collection-left-sidebar.html">222222222222</a>
                                                </h3>
                                                <div class="product-card-price">
                                                    <span class="card-price-regular">$1529</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product3 -->
                                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                                        <div class="product-card" id="productCard3">
                                            <div class="product-card-img">
                                                <a class="hover-switch" href="javascript:void(0);" onclick="openModal3()">
                                                    <img class="secondary-img"
                                                        src="/ScanGo/assets/img/logo.png" alt="product-img">
                                                    <img class="primary-img" src="/ScanGo/assets/img/logo.png"
                                                        alt="product-img">
                                                </a>
                                            </div>
                                            <div class="product-card-details">
                                                <h3 class="product-card-title">
                                                    <a href="collection-left-sidebar.html">222222222222</a>
                                                </h3>
                                                <div class="product-card-price">
                                                    <span class="card-price-regular">$1529</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product4 -->
                                    <div class="col-lg-3 col-md-6 col-6" data-aos="fade-up" data-aos-duration="700">
                                        <div class="product-card" id="productCard4">
                                            <div class="product-card-img">
                                                <a class="hover-switch" href="javascript:void(0);" onclick="openModal4()">
                                                    <img class="secondary-img"
                                                        src="/ScanGo/assets/img/logo.png" alt="product-img">
                                                    <img class="primary-img" src="/ScanGo/assets/img/logo.png"
                                                        alt="product-img">
                                                </a>
                                            </div>
                                            <div class="product-card-details">
                                                <h3 class="product-card-title">
                                                    <a href="collection-left-sidebar.html">222222222222</a>
                                                </h3>
                                                <div class="product-card-price">
                                                    <span class="card-price-regular">$1529</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pagination justify-content-center mt-100">
                                <nav>
                                    <ul class="pagination m-0 d-flex align-items-center">
                                        <li class="item disabled">
                                            <a class="link">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"
                                                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                    class="icon icon-left">
                                                    <polyline points="15 18 9 12 15 6"></polyline>
                                                </svg>
                                            </a>
                                        </li>
                                        <li class="item"><a class="link" href="#">1</a></li>
                                        <li class="item active"><a class="link" href="#">2</a></li>
                                        <li class="item"><a class="link" href="#">3</a></li>
                                        <li class="item"><a class="link" href="#">4</a></li>
                                        <li class="item">
                                            <a class="link" href="#">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"
                                                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                    class="icon icon-right">
                                                    <polyline points="9 18 15 12 9 6"></polyline>
                                                </svg>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <!-- product area end -->

                        <!-- sidebar start -->
                        <div class="col-lg-3 col-md-12 col-12">
                            <div class="collection-filter filter-drawer">
                                <div class="filter-widget d-lg-none d-flex align-items-center justify-content-between">
                                    <h5 class="heading_24">Sorting By</h4>
                                    <button type="button" class="btn-close text-reset filter-drawer-trigger d-lg-none"></button>
                                </div>

                                <div class="filter-widget d-lg-none">
                                    <div class="filter-header faq-heading heading_18 d-flex align-items-center justify-content-between border-bottom"
                                        data-bs-toggle="collapse" data-bs-target="#filter-mobile-sort">
                                        <span>
                                            <span class="sorting-title me-2">Sort by:</span>
                                            <span class="active-sorting">Featured</span>
                                        </span>
                                        <span class="faq-heading-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round" class="icon icon-down">
                                                <polyline points="6 9 12 15 18 9"></polyline>
                                            </svg>
                                        </span>
                                    </div>
                                    <div id="filter-mobile-sort" class="accordion-collapse collapse show">
                                        <ul class="sorting-lists-mobile list-unstyled m-0">
                                            <li><a href="#" class="text_14">Featured</a></li>
                                            <li><a href="#" class="text_14">Best Selling</a></li>
                                            <li><a href="#" class="text_14">Alphabetically, A-Z</a></li>
                                            <li><a href="#" class="text_14">Alphabetically, Z-A</a></li>
                                            <li><a href="#" class="text_14">Price, low to high</a></li>
                                            <li><a href="#" class="text_14">Price, high to low</a></li>
                                            <li><a href="#" class="text_14">Date, old to new</a></li>
                                            <li><a href="#" class="text_14">Date, new to old</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- sidebar end -->
                    </div>
                </div>
            </div>
        </main>
        
        
        <!-- 模態框 model area -->

        <!-- model1 -->
        <div class="modal-content-xl">
            <div id="myModal1" class="modal" style="display: none;">
                <div class="modal-content" style="justify-content: center;">
                    <span class="close" onclick="closeModal1()" style="font-size: 40px;">&times;</span>
                    <h3>森O牛奶糖</h3>
                    <img src="/ScanGo/assets/img/logo.png" alt="">
                    <p style="max-height: 300px; overflow-y: auto;">
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc
                        aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc

                    </p>
                </div>
            </div>
        </div>

        <!-- model2 -->
        <div class="modal-content-xl">
            <div id="myModal2" class="modal" style="display: none;">
                <div class="modal-content" style="justify-content: center;">
                    <span class="close" onclick="closeModal2()" style="font-size: 40px;">&times;</span>
                    <h3>森O牛奶糖</h3>
                    <img src="/ScanGo/assets/img/logo.png" alt="">
                    <p style="max-height: 300px; overflow-y: auto;">
                        147845426216298

                    </p>
                </div>
            </div>
        </div>

        <!-- model3 -->
        <div class="modal-content-xl">
            <div id="myModal3" class="modal" style="display: none;">
                <div class="modal-content" style="justify-content: center;">
                    <span class="close" onclick="closeModal3()" style="font-size: 40px;">&times;</span>
                    <h3>森O牛奶糖</h3>
                    <img src="/ScanGo/assets/img/logo.png" alt="">
                    <p style="max-height: 300px; overflow-y: auto;">
                        {{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}
                    </p>
                </div>
            </div>
        </div>

        <!-- model4 -->
        <div class="modal-content-xl">
            <div id="myModal4" class="modal" style="display: none;">
                <div class="modal-content" style="justify-content: center;">
                    <span class="close" onclick="closeModal4()" style="font-size: 40px;">&times;</span>
                    <h3>森O牛奶糖</h3>
                    <img src="/ScanGo/assets/img/logo.png" alt="">
                    <p style="max-height: 300px; overflow-y: auto;">
                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                    </p>
                </div>
            </div>
        </div>
        

        <!-- all js product funtion -->
        <script>
        
            // productCard1
            function openModal1() {
                document.getElementById("myModal1").style.display = "flex";
                document.body.classList.add("modal-open");
            }
        
            function closeModal1() {
                document.getElementById("myModal1").style.display = "none";
                document.body.classList.remove("modal-open");
            }
        
            // 模態框顯示時禁用背景頁面滾動
            document.getElementById("myModal1").addEventListener("wheel", function (e) {
                e.stopPropagation();
            });
        
            // 點擊按鈕時顯示模態框
            document.getElementById("openModalBtn").addEventListener("click", function (event) {
                event.preventDefault(); // 防止點擊按鈕時跳轉到 "#"
                openModal1();
            });

            // productCard2
            function openModal2() {
                document.getElementById("myModal2").style.display = "flex";
                document.body.classList.add("modal-open");
            }
        
            function closeModal2() {
                document.getElementById("myModal2").style.display = "none";
                document.body.classList.remove("modal-open");
            }
        
            // 模態框顯示時禁用背景頁面滾動
            document.getElementById("myModal").addEventListener("wheel", function (e) {
                e.stopPropagation();
            });
        
            // 點擊按鈕時顯示模態框
            document.getElementById("openModalBtn").addEventListener("click", function (event) {
                event.preventDefault(); // 防止點擊按鈕時跳轉到 "#"
                openModal();
            });

            // productCard3
            function openModal3() {
                document.getElementById("myModal3").style.display = "flex";
                document.body.classList.add("modal-open");
            }
        
            function closeModal3() {
                document.getElementById("myModal3").style.display = "none";
                document.body.classList.remove("modal-open");
            }
        
            // 模態框顯示時禁用背景頁面滾動
            document.getElementById("myModal").addEventListener("wheel", function (e) {
                e.stopPropagation();
            });
        
            // 點擊按鈕時顯示模態框
            document.getElementById("openModalBtn").addEventListener("click", function (event) {
                event.preventDefault(); // 防止點擊按鈕時跳轉到 "#"
                openModal();
            });

            // productCard4
            function openModal4() {
                document.getElementById("myModal4").style.display = "flex";
                document.body.classList.add("modal-open");
            }
        
            function closeModal4() {
                document.getElementById("myModal4").style.display = "none";
                document.body.classList.remove("modal-open");
            }
        
            // 模態框顯示時禁用背景頁面滾動
            document.getElementById("myModal").addEventListener("wheel", function (e) {
                e.stopPropagation();
            });
        
            // 點擊按鈕時顯示模態框
            document.getElementById("openModalBtn").addEventListener("click", function (event) {
                event.preventDefault(); // 防止點擊按鈕時跳轉到 "#"
                openModal();
            });
        </script>



<%@ include file="/WEB-INF/footer.jspf"%>