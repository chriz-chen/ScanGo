<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>

<!-- breadcrumb start -->
<div class="breadcrumb">
	<div class="container">
		<ul class="list-unstyled d-flex align-items-center m-0">
			<li><a href="/">Home</a></li>
			<li><svg class="icon icon-breadcrumb" width="64" height="64"
					viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g opacity="0.4">
                        <path
						d="M25.9375 8.5625L23.0625 11.4375L43.625 32L23.0625 52.5625L25.9375 55.4375L47.9375 33.4375L49.3125 32L47.9375 30.5625L25.9375 8.5625Z"
						fill="#000" />
                    </g>
                </svg></li>
			<li>Register</li>
		</ul>
	</div>
</div>
<!-- breadcrumb end -->

<main id="MainContent" class="content-for-layout">
	<div class="login-page mt-100">
		<div class="container">
			<sp:form modelAttribute="registerUser"
				action="${pageContext.request.contextPath}/mvc/register"
				cssClass="login-form common-form mx-auto" method="post">
				<div class="section-header mb-3">
					<h2 class="section-heading text-center">Register</h2>
				</div>
				<div class="row">
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<label class="label d-inline">First name</label>
								<sp:errors path="firstName" cssClass="text-danger text-nowrap" />
							</div>
							<sp:input type="text" path="firstName" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<label class="label d-inline">Last name</label>
								<sp:errors path="lastName" cssClass="text-danger text-nowrap" />
							</div>

							<sp:input type="text" path="lastName" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<label class="label">Email address</label>
								<sp:errors path="email" cssClass="text-danger text-nowrap" />
							</div>
							<sp:input type="email" path="email" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<label class="label d-inline">Password</label>
								<sp:errors path="password" cssClass="text-danger text-nowrap" />
							</div>

							<sp:input type="password" path="password" />
						</fieldset>
					</div>
					<div class="col-12 mt-3">
						<button type="submit" class="btn-primary d-block mt-3 btn-signin">CREATE</button>
					</div>
				</div>
			</sp:form>
		</div>
	</div>
</main>

<%@ include file="/WEB-INF/footer.jspf"%>