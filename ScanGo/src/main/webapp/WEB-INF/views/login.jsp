<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ include file="/WEB-INF/header.jspf" %>

<!-- drawer menu start -->
    <div class="offcanvas offcanvas-start d-flex d-lg-none" tabindex="-1" id="drawer-menu">
        <div class="offcanvas-wrapper">
            <div class="offcanvas-header border-btm-black">
                <h5 class="drawer-heading">Menu</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
            </div>
            <div class="offcanvas-body p-0 d-flex flex-column justify-content-between">
                <nav class="site-navigation">
                    <ul class="main-menu list-unstyled">
                        <li class="menu-list-item nav-item hover">
                            <div class="mega-menu-header">
                                <a class="nav-link active" href="index.html">
                                    商品地圖
                                </a>
                            </div>
                        </li>

                        <li class="menu-list-item nav-item has-dropdown hover">
                            <div class="mega-menu-header">
                                <a class="nav-link active" href="index.html">
                                    會員資訊
                                </a>
                            </div>
                        </li>

                        <li class="menu-list-item nav-item hover">
                            <a class="nav-link" href="blog.html">優惠券</a>
                        </li>

                        <li class="menu-list-item nav-item hover">
                            <a class="nav-link" href="contact.html">購物紀錄</a>
                        </li>
                    </ul>
                </nav>
                <ul class="utility-menu list-unstyled ">

                    <li class="utilty-menu-item">
                        <a class="announcement-login announcement-text" href="login.html">
                            <span class="utilty-icon-wrapper">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                    class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                        d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0z" />
                                    <path fill-rule="evenodd"
                                        d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z" />
                                </svg>
                            </span>
                            <span>登入</span>
                        </a>
                    </li>
                    <li class="utilty-menu-item">
                        <a class="announcement-login announcement-text" href="login.html">
                            <span class="utilty-icon-wrapper">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                    class="bi bi-person" viewBox="0 0 16 16">
                                    <path
                                        d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664z" />
                                </svg>
                            </span>
                            <span>註冊</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- login area -->
        <main id="MainContent" class="content-for-layout">
            <div class="login-page mt-100">
                <div class="container">
                    <form action="#" class="login-form common-form mx-auto">
                        <div class="section-header mb-3">
                            <h2 class="section-heading text-center">會員登入</h2>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <fieldset>
                                    <label class="label">帳號</label>
                                    <input type="text" />
                                </fieldset>
                            </div>
                            <div class="col-12">
                                <fieldset>
                                    <label class="label">密碼</label>
                                    <input type="password" />
                                </fieldset>
                            </div>
                            <div class="col-12 mt-3">
                                <a href="#" class="text_14 d-block">忘記密碼？</a>
                                <button type="submit" class="btn-primary d-block mt-4 btn-signin">會員登入</button>
                                <a href="register.html" class="btn-secondary mt-2 btn-signin">建立會員</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>            
        </main>

</main>
<%@ include file="/WEB-INF/footer.jspf" %>