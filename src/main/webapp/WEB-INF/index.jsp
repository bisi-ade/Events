<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://bootswatch.com/4/flatly/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<header class="bg-dark p-2 mb-5">
		<h1 class="text-light">Welcome</h1>
	</header>
	<main class="row text-center">
		<div class="col">
			<h3 class="mb-3">Register</h3>
			<form:form class="w-75 m-auto" action="/register" method="POST" modelAttribute="user">
				<div class="form-group row">
					<form:input class="col-6 form-control" path="firstName" placeholder="first name"/>
					<form:errors class="col-6 text-danger" path="firstName"/>
				</div>
				<div class="form-group row">
					<form:input class="col-6 form-control" path="lastName" placeholder="last name"/>
					<form:errors class="col-6 text-danger" path="lastName"/>
				</div>
				<div class="form-group row">
					<form:input class="col-6 form-control" type="email" path="email" placeholder="email"/>
					<form:errors class="col-6 text-danger" path="email"/>
				</div>
				<div class="form-group row">
					<form:input class="col-6 form-control" path="city" placeholder="city"/>
					<form:errors class="col-6 text-danger" path="city"/>
				</div>
				<div class="form-group row">
					<form:select class="col-6 form-control" path="state">
						<option value="AL">Alabama</option>
						<option value="AK">Alaska</option>
						<option value="AZ">Arizona</option>
						<option value="AR">Arkansas</option>
						<option value="CA">California</option>
						<option value="CO">Colorado</option>
						<option value="CT">Connecticut</option>
						<option value="DE">Delaware</option>
						<option value="DC">District Of Columbia</option>
						<option value="FL">Florida</option>
						<option value="GA">Georgia</option>
						<option value="HI">Hawaii</option>
						<option value="ID">Idaho</option>
						<option value="IL">Illinois</option>
						<option value="IN">Indiana</option>
						<option value="IA">Iowa</option>
						<option value="KS">Kansas</option>
						<option value="KY">Kentucky</option>
						<option value="LA">Louisiana</option>
						<option value="ME">Maine</option>
						<option value="MD">Maryland</option>
						<option value="MA">Massachusetts</option>
						<option value="MI">Michigan</option>
						<option value="MN">Minnesota</option>
						<option value="MS">Mississippi</option>
						<option value="MO">Missouri</option>
						<option value="MT">Montana</option>
						<option value="NE">Nebraska</option>
						<option value="NV">Nevada</option>
						<option value="NH">New Hampshire</option>
						<option value="NJ">New Jersey</option>
						<option value="NM">New Mexico</option>
						<option value="NY">New York</option>
						<option value="NC">North Carolina</option>
						<option value="ND">North Dakota</option>
						<option value="OH">Ohio</option>
						<option value="OK">Oklahoma</option>
						<option value="OR">Oregon</option>
						<option value="PA">Pennsylvania</option>
						<option value="RI">Rhode Island</option>
						<option value="SC">South Carolina</option>
						<option value="SD">South Dakota</option>
						<option value="TN">Tennessee</option>
						<option value="TX">Texas</option>
						<option value="UT">Utah</option>
						<option value="VT">Vermont</option>
						<option value="VA">Virginia</option>
						<option value="WA">Washington</option>
						<option value="WV">West Virginia</option>
						<option value="WI">Wisconsin</option>
						<option value="WY">Wyoming</option>
					</form:select>
				</div>
				<div class="form-group row">
					<form:input class="col-6 form-control" type="password" path="password" placeholder="password"/>
					<form:errors class="col-6 text-danger" path="password"/>
				</div>
				<div class="form-group row">
					<form:input class="col-6 form-control" type="password" path="passwordConfirm" placeholder="confirm password"/>
					<form:errors class="col-6 text-danger" path="passwordConfirm"/>
				</div>
				<input type="submit" class="btn btn-primary" value="Register">
			</form:form>
		</div>
		<div class="col">
			<h3 class="mb-3">Login</h3>
			<form:form class="w-75 m-auto" action="/login" method="POST" modelAttribute="loginUser">
				<div class="form-group row">
					<form:input class="col-6 form-control" type="email" path="email" placeholder="email"/>
					<form:errors class="col-6 text-danger" path="email"/>
				</div>
				<div class="form-group row">
					<form:input class="col-6 form-control" type="password" path="password" placeholder="password"/>
					<form:errors class="col-6 text-danger" path="password"/>
				</div>
				<input type="submit" class="btn btn-primary mb-2" value="Login">
			</form:form>
			<c:if test="${ error != null }">
				<p class="text-danger"><c:out value="${ error }"/></p>
			</c:if>
		</div>
	</main>
</body>
</html>