<%@page import="java.util.List"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Register new user</title>

<spring:url value="/resources/css" var="baseUrlCss" />
<spring:url value="/resources/js" var="baseUrlJS" />
<spring:url value="/" var="baseUrl" />

<link href="${baseUrlCss}/bootstrap.min.css" rel="stylesheet" />
<link href="${baseUrlCss}/base.css" rel="stylesheet" />

</head>
<body>
	<div id="wrap-login">
		<form:form method="POST" commandName="user" id="register">
			<h1>Create your personal account</h1>



			<spring:hasBindErrors name="user">

				<c:set var="errorUsername" value="has-success" />
				<c:if test="${errors.hasFieldErrors('username')}">
					<c:set var="errorUsername" value="has-error" />
				</c:if>

				<c:set var="errorEmail" value="has-success" />
				<c:if test="${errors.hasFieldErrors('email')}">
					<c:set var="errorEmail" value="has-error" />
				</c:if>

				<c:set var="errorPassword" value="has-success" />
				<c:if test="${errors.hasFieldErrors('password')}">
					<c:set var="errorPassword" value="has-error" />
				</c:if>

				<c:set var="errorConfirmPassword" value="has-success" />
				<c:if test="${errors.hasFieldErrors('confirmPassword')}">
					<c:set var="errorConfirmPassword" value="has-error" />
				</c:if>
			</spring:hasBindErrors>





			<div class="form-group ${errorUsername}">
				<form:label path="username" cssClass="control-label">Username:</form:label>
				<div class="row">
					<div class="col-md-6">
						<div class="input-field">
							<form:input path="username" cssClass="form-control" id="username"
								placeholder="Username" />
							<c:if test="${errorUsername.equals('has-error')}">
								<span class="glyphicon glyphicon-remove error"
									aria-hidden="true"></span>
							</c:if>
							<c:if test="${errorUsername.equals('has-success')}">
								<span class="glyphicon glyphicon-ok no-error" aria-hidden="true"></span>
							</c:if>
						</div>
					</div>
					<div class="col-md-6">
						<div class="text-error table" id="username-error">
							<span class="table-cell"> <span><form:errors
										path="username" /></span>
							</span>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group ${errorEmail}">
				<form:label path="email" cssClass="control-label">Email</form:label>
				<div class="row">
					<div class="col-md-6">
						<div class="input-field">
							<form:input path="email" id="email" cssClass="form-control"
								placeholder="Email@example.com" />
							<c:if test="${errorEmail.equals('has-error')}">
								<span class="glyphicon glyphicon-remove error"
									aria-hidden="true"></span>
							</c:if>
							<c:if test="${errorEmail.equals('has-success')}">
								<span class="glyphicon glyphicon-ok no-error" aria-hidden="true"></span>
							</c:if>
						</div>
					</div>
					<div class="col-md-6">
						<div class="text-error table">
							<span class="table-cell"> 
								<span><form:errors path="email" /></span>
							</span>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group ${errorPassword}">
				<form:label path="password" cssClass="control-label">Password:</form:label>
				<div class="row">
					<div class="col-md-6">
						<div class="input-field">
							<form:password path="password" id="password"
								cssClass="form-control" placeholder="Password" />
							<c:if test="${errorPassword.equals('has-error')}">
								<span class="glyphicon glyphicon-remove error"
									aria-hidden="true"></span>
							</c:if>
							<c:if test="${errorPassword.equals('has-success')}">
								<span class="glyphicon glyphicon-ok no-error" aria-hidden="true"></span>
							</c:if>
						</div>
					</div>
					<div class="col-md-6">
						<div class="text-error table">
							<span class="table-cell"> 
								<span> <form:errors path="password" /></span>
							</span>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group ${errorConfirmPassword}">
				<form:label path="confirmPassword" cssClass="control-label">Confirm password:</form:label>
				<div class="row">
					<div class="col-md-6">
						<div class="input-field">
							<form:password path="confirmPassword" cssClass="form-control"
								placeholder="ConfirmPassword" />
							<c:if test="${errorConfirmPassword.equals('has-error')}">
								<span class="glyphicon glyphicon-remove error"
									aria-hidden="true"></span>
							</c:if>
							<c:if test="${errorConfirmPassword.equals('no-error')}">
								<span class="glyphicon glyphicon-ok no-error" aria-hidden="true"></span>
							</c:if>
						</div>
					</div>
					<div class="col-md-6">
						<div class="text-error table">
							<span class="table-cell"> 
								<span> <form:errors path="confirmPassword" /></span>
							</span>
						</div>
					</div>
				</div>
			</div>

			<form:button id="signup" class="btn btn-success">Create an account</form:button>
		</form:form>

	</div>
	<!-- wrap-login  -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="${baseUrlJS}/bootstrap.min.js"></script>
</body>
</html>
<script>
	jQuery(document).ready(function($) {


	
	$("#username").on('blur', function(){
		searchSameUsername();
	});
	function searchSameUsername() {

		$.ajax({
			type : "GET",
			contentType : "application/text",
			url : "${baseUrl}user/controlusername",
			data : "username=" + $(username).val(),
			timeout : 100000,
			success : function(data) {
				if (data == "yes"){
					$("#username").parent().append("<span class='glyphicon glyphicon-remove error' aria-hidden='true'></span>");
					$("#username-error .table-cell").html("<span>username already excite</span>");
					enableSearchButton(true);
				} else{
					$("#username").parent().find('span').remove();
					$("#username-error .table-cell").html("");
					enableSearchButton(false);
				}
				
			},
			error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("DONE");
				alert("DONE");
				
			}
		})
	}

	function enableSearchButton(flag) {
		$("#signup").prop("disabled", flag);
	}
	
	})
</script>