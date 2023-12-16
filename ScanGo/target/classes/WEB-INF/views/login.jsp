<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>
      
<%@ include file="/WEB-INF/header.jspf" %>

<main id="MainContent" class="content-for-layout">
    <div class="login-page mt-100">
        <div class="container">
            <sp:form modelAttribute="loginUser" 
                     method="post"
                     action="${ pageContext.request.contextPath }/mvc/login" 
                     class="login-form common-form mx-auto">
                <p class="text-center text-danger">${ error }</p>    
                <div class="section-header mb-3">
                    <h2 class="section-heading text-center">Login</h2>
                </div>
                
                <div class="row">
                    <div class="col-12">
                        <fieldset>
                        	<div class="d-flex justify-content-between">
								<label class="label">Email</label>
								<sp:errors path="email" cssClass="text-danger text-nowrap text-end" />
							</div>
                            <sp:input type="email" path="email" />
                        </fieldset>
                    </div>
                    <div class="col-12">
                        <fieldset>
                            <div class="d-flex justify-content-between">
                                <label class="label">Password</label>
								<sp:errors path="password" cssClass="text-danger text-nowrap text-end" />
							</div>
                            <sp:input type="password" path="password" />
                        </fieldset>
                    </div>
                    <div class="col-12 mt-3">
                        <button type="submit" class="btn-primary d-block mt-4 btn-signin">SIGN IN</button>
                        <a href="${ pageContext.request.contextPath }/mvc/register" class="btn-secondary mt-2 btn-signin">CREATE AN ACCOUNT</a>
                    </div>
                </div>
            </sp:form>
        </div>
    </div>            
</main>

<%@ include file="/WEB-INF/footer.jspf" %>