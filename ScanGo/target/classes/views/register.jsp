<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>

<main id="MainContent" class="content-for-layout">
	<div class="login-page mt-80">
		<div class="container">
			<sp:form modelAttribute="registerUser"
				action="${pageContext.request.contextPath}/mvc/register"
				cssClass="login-form common-form mx-auto" method="post">
				<p class="text-center text-danger">${ error }</p>
				<div class="section-header mb-3">
					<h2 class="section-heading text-center">Register</h2>
				</div>
				<div class="row">
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<label class="label d-inline">First name</label>
								<sp:errors path="firstName" cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="text" path="firstName" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<label class="label d-inline">Last name</label>
								<sp:errors path="lastName" cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="text" path="lastName" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<label class="label">Email address</label>
								<sp:errors path="email" cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="email" path="email" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<label class="label d-inline">Password</label>
								<sp:errors path="password" cssClass="text-danger text-nowrap text-end" />
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