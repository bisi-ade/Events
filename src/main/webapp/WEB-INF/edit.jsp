<%@ page isErrorPage="true" %>    

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
		<h1 class="text-light">Edit an event</h1>
		<a href="/logout" class="btn btn btn-warning">Logout</a>
		<a href="/dashboard" class="btn btn btn-primary">Dashboard</a>
	</header>
	<main class="w-75 m-auto">
		<form:form  class="ml-5" action="/events/${ event.id }" method="POST" modelAttribute="event">
			<input type="hidden" name="_method" value="put"/>
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
					<option value="AL" ${event.state == "AL" ? 'selected = "true"' : ''}>Alabama</option>
					<option value="AK" ${event.state == "AK" ? 'selected = "true"' : ''}>Alaska</option>
					<option value="AZ" ${event.state == "AZ" ? 'selected = "true"' : ''}>Arizona</option>
					<option value="AR" ${event.state == "AR" ? 'selected = "true"' : ''}>Arkansas</option>
					<option value="CA" ${event.state == "CA" ? 'selected = "true"' : ''}>California</option>
					<option value="CO" ${event.state == "CO" ? 'selected = "true"' : ''}>Colorado</option>
					<option value="CT" ${event.state == "CT" ? 'selected = "true"' : ''}>Connecticut</option>
					<option value="DE" ${event.state == "DE" ? 'selected = "true"' : ''}>Delaware</option>
					<option value="DC" ${event.state == "DC" ? 'selected = "true"' : ''}>District Of Columbia</option>
					<option value="FL" ${event.state == "FL" ? 'selected = "true"' : ''}>Florida</option>
					<option value="GA" ${event.state == "GA" ? 'selected = "true"' : ''}>Georgia</option>
					<option value="HI" ${event.state == "HI" ? 'selected = "true"' : ''}>Hawaii</option>
					<option value="ID" ${event.state == "ID" ? 'selected = "true"' : ''}>Idaho</option>
					<option value="IL" ${event.state == "IL" ? 'selected = "true"' : ''}>Illinois</option>
					<option value="IN" ${event.state == "IN" ? 'selected = "true"' : ''}>Indiana</option>
					<option value="IA" ${event.state == "IA" ? 'selected = "true"' : ''}>Iowa</option>
					<option value="KS" ${event.state == "KS" ? 'selected = "true"' : ''}>Kansas</option>
					<option value="KY" ${event.state == "KY" ? 'selected = "true"' : ''}>Kentucky</option>
					<option value="LA" ${event.state == "LA" ? 'selected = "true"' : ''}>Louisiana</option>
					<option value="ME" ${event.state == "ME" ? 'selected = "true"' : ''}>Maine</option>
					<option value="MD" ${event.state == "MD" ? 'selected = "true"' : ''}>Maryland</option>
					<option value="MA" ${event.state == "MA" ? 'selected = "true"' : ''}>Massachusetts</option>
					<option value="MI" ${event.state == "MI" ? 'selected = "true"' : ''}>Michigan</option>
					<option value="MN" ${event.state == "MN" ? 'selected = "true"' : ''}>Minnesota</option>
					<option value="MS" ${event.state == "MS" ? 'selected = "true"' : ''}>Mississippi</option>
					<option value="MO" ${event.state == "MO" ? 'selected = "true"' : ''}>Missouri</option>
					<option value="MT" ${event.state == "MT" ? 'selected = "true"' : ''}>Montana</option>
					<option value="NE" ${event.state == "NE" ? 'selected = "true"' : ''}>Nebraska</option>
					<option value="NV" ${event.state == "NV" ? 'selected = "true"' : ''}>Nevada</option>
					<option value="NH" ${event.state == "NH" ? 'selected = "true"' : ''}>New Hampshire</option>
					<option value="NJ" ${event.state == "NJ" ? 'selected = "true"' : ''}>New Jersey</option>
					<option value="NM" ${event.state == "NM" ? 'selected = "true"' : ''}>New Mexico</option>
					<option value="NY" ${event.state == "NY" ? 'selected = "true"' : ''}>New York</option>
					<option value="NC" ${event.state == "NC" ? 'selected = "true"' : ''}>North Carolina</option>
					<option value="ND" ${event.state == "ND" ? 'selected = "true"' : ''}>North Dakota</option>
					<option value="OH" ${event.state == "OH" ? 'selected = "true"' : ''}>Ohio</option>
					<option value="OK" ${event.state == "OK" ? 'selected = "true"' : ''}>Oklahoma</option>
					<option value="OR" ${event.state == "OR" ? 'selected = "true"' : ''}>Oregon</option>
					<option value="PA" ${event.state == "PA" ? 'selected = "true"' : ''}>Pennsylvania</option>
					<option value="RI" ${event.state == "RI" ? 'selected = "true"' : ''}>Rhode Island</option>
					<option value="SC" ${event.state == "SC" ? 'selected = "true"' : ''}>South Carolina</option>
					<option value="SD" ${event.state == "SD" ? 'selected = "true"' : ''}>South Dakota</option>
					<option value="TN" ${event.state == "TN" ? 'selected = "true"' : ''}>Tennessee</option>
					<option value="TX" ${event.state == "TX" ? 'selected = "true"' : ''}>Texas</option>
					<option value="UT" ${event.state == "UT" ? 'selected = "true"' : ''}>Utah</option>
					<option value="VT" ${event.state == "VT" ? 'selected = "true"' : ''}>Vermont</option>
					<option value="VA" ${event.state == "VA" ? 'selected = "true"' : ''}>Virginia</option>
					<option value="WA" ${event.state == "WA" ? 'selected = "true"' : ''}>Washington</option>
					<option value="WV" ${event.state == "WV" ? 'selected = "true"' : ''}>West Virginia</option>
					<option value="WI" ${event.state == "WI" ? 'selected = "true"' : ''}>Wisconsin</option>
					<option value="WY" ${event.state == "WY" ? 'selected = "true"' : ''}>Wyoming</option>
				</form:select>
			</div>
			<input type="submit" class="btn btn-success" value="Update Event">
		</form:form>
	</main>
</body>
</html>