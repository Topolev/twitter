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
				${errors.hasFieldErrors("userName")? 'true':'false'}
			</spring:hasBindErrors>
			
			<div class="form-group">
				<form:label path="username">Username:</form:label>
				<div class="row">
					<div class="col-md-9">
						<form:input path="username" cssClass="form-control"
							placeholder="Username" />
						<p class="help-block">This will be your username. This field
							shoul consist 3-10 character.</p>
					</div>
					<div class="col-md-3">
						<span><form:errors path="username" /></span>

						<form:errors path="username"></form:errors>


						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>

					</div>
				</div>


			</div>

			<div class="form-group">
				<form:label path="email">Email</form:label>
				<form:input path="email" id="email" cssClass="form-control"
					placeholder="Email@example.com" />
				<p class="help-block">You will occasionally receive account
					related emails. We promise not to share your email with anyone.</p>
			</div>

			<div class="form-group">
				<form:label path="password">Password:</form:label>
				<form:password path="password" id="password" cssClass="form-control"
					placeholder="Password" />
				<p class="help-block">Use at least one lowercase letter, one
					numeral, and seven characters.</p>
			</div>

			<div class="form-group">
				<form:label path="confirmPassword">Confirm password:</form:label>
				<form:password path="confirmPassword" cssClass="form-control"
					placeholder="ConfirmPassword" />
				<p class="help-block">This field will be same field Password</p>
				<span><form:errors path="confirmPassword" /></span>
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

		$("#register").submit(function(event) {
			searchSameUsername();
			enableSearchButton(false);
			return false;
		})
	})

	function searchSameUsername() {

		$.ajax({
			type : "GET",
			contentType : "application/text",
			url : "${baseUrl}user/controlusername",
			data : "username=" + $(username).val(),
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			}
		})
	}

	function enableSearchButton(flag) {
		$("#signup").prop("disabled", flag);
	}
</script>