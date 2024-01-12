<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>

<main id="MainContent" class="content-for-layout">
	<div class="container vh-100">
		<sp:form modelAttribute="loginUser" method="post"
			action="${ pageContext.request.contextPath }/mvc/login"
			class="login-form common-form mx-auto">
			<p class="text-center text-danger fs-5">${ errorMessage }</p>
			<div class="section-header mb-3">
				<h2 class="section-heading text-center">登入</h2>
			</div>
			<div class="row">
				<div class="col-12">
					<fieldset>
						<div class="d-flex justify-content-between">
							<label class="label">帳號</label>
							<sp:errors path="username"
								cssClass="text-danger text-nowrap text-end" />
						</div>
						<sp:input type="text" path="username" />
					</fieldset>
				</div>
				<div class="col-12">
					<fieldset>
						<div class="d-flex justify-content-between">
							<label class="label">密碼</label>
							<sp:errors path="password"
								cssClass="text-danger text-nowrap text-end" />
						</div>
						<sp:input type="password" path="password" />
					</fieldset>
				</div>
				<div class="col-12">
					<fieldset>
						<div class="d-flex justify-content-between">
							<label class="label">驗證碼</label>
							<sp:errors path="code"
								cssClass="text-danger text-nowrap text-end" />
						</div>
						<sp:input type="text" path="code" />
					</fieldset>
					<img src="${ pageContext.request.contextPath }/mvc/login/getcode"
						alt="驗證碼" class="mt-2" valign="middle">
				</div>
				<div class="col-12 mt-3">

					<button type="submit" class="btn-primary d-block mt-4 btn-signin">登入</button>
					<a href="${ pageContext.request.contextPath }/mvc/register"
						class="btn-secondary mt-2 btn-signin">註冊帳號</a>
				</div>
			</div>

		</sp:form>
	</div>
</main>
 
<%@ include file="/WEB-INF/footer.jspf"%>