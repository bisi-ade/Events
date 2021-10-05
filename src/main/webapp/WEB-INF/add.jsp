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
		<h1 class="text-light">Create an event</h1>
		<a href="/logout" class="btn btn btn-warning">Logout</a>
		<a href="/dashboard" class="btn btn btn-primary">Dashboard</a>
	</header>
	<main class="w-75 m-auto">
		<form:form  class="ml-5" action="/events" method="POST" modelAttribute="event">
			<form:hidden value="${ user.id }" path="creator" />
			<div class="form-group row">
				<form:label class="col-3" path="name">Name</form:label>
				<form:input class="form-control col-5" path="name"/>
				<form:errors class="text-danger col-4" path="name"/>
			</div>
			<div class="form-group row">
				<form:label class="col-3" path="date">Date</form:label>
				<form:input type="date" class="form-control col-5" path="date"/>
				<form:errors class="text-danger col-4" path="date"/>
			</div>
			<div class="form-group row">
				<form:label class="col-3" path="city">City</form:label>
				<form:input class="form-control col-5" path="city"/>
				<form:errors class="text-danger col-4" path="city"/>
			</div>
			<div class="form-group row">
				<form:label class="col-3" path="state">State</form:label>
				<form:select class="col-5 form-control" path="state">
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
			<input type="submit" class="btn btn-success" value="Add Event">
		</form:form>
	</main>
</body>
</html>