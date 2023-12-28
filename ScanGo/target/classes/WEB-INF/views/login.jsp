<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>
    
<%@ include file="/WEB-INF/header.jspf" %>

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
                                <a href="register" class="btn-secondary mt-2 btn-signin">建立會員</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>            
        </main>

<%@ include file="/WEB-INF/footer.jspf" %>