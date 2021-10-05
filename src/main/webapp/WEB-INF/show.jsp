<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


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
		<h1 class="text-light"><c:out value="${ event.name }"/></h1>
		<a href="/logout" class="btn btn btn-warning">Logout</a>
		<a href="/dashboard" class="btn btn btn-primary">Dashboard</a>
	</header>
	<main class="row w-100">
		<div class="col pl-5">
			<h4>Host: <c:out value="${ event.creator.firstName } ${ event.creator.lastName }"/></h4>
			<h4>Date: <fmt:formatDate value="${ event.date }" type="date"/></h4>
			<h4>Location: <c:out value="${ event.city },  ${ event.state }"/></h4>
			<h4>People attending: <c:out value="${ event.attendees.size() }"/></h4>
			<table class="table table-striped mt-3 w-75">
				<thead>
					<tr>
						<th>Name</th>
						<th>Location</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ event.attendees }" var="attendee">
					<tr>
						<td><c:out value="${ attendee.firstName } ${ attendee.lastName }"/></td>
						<td><c:out value="${ attendee.city }, ${ attendee.state }"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col text-center m-auto">
			<h3 class="w-75">Message Wall</h3>
			<div id="messages">
				<c:forEach items="${ event.messages }" var="message">
				<p><c:out value="${ message.user.firstName} ${ message.user.lastName } says: ${ message.comment}"/></p>
				</c:forEach>
			</div>
			<h4 class="w-75 mt-5">Add Comment:</h4>
			<form:form class="w-75" action="/messages/${ event.id }" method="POST" modelAttribute="message">
				<form:hidden path="event" value="${ event.id }"/>
				<form:hidden path="user" value="${ user.id }"/>
				<form:input class="form-control" path="comment"/>
				<input type="submit" class="btn btn-success mt-2 float-right" value="Submit">
			</form:form>
		</div>
	</main>
</body>
</html>