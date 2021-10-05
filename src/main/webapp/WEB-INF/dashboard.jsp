<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


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
		<h1 class="text-light">Welcome,  <c:out value="${ user.firstName } ${ user.lastName} " /></h1>
		<a href="/logout" class="btn btn btn-warning">Logout</a>
		<a href="/add" class="btn btn btn-primary">Add Event</a>
	</header>
	<main class="w-75 m-auto">
		<div class="mb-5">
			<h4>Events in your state:</h4>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Name</th>
						<th>Date</th>
						<th>Location</th>
						<th>Host</th>
						<th>Action | Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ localEvents }" var="event">
					<tr>
						<td><a href="/events/${ event.id  }"><c:out value="${ event.name }"/></a></td>
						<td><fmt:formatDate value="${ event.date }" type="date"/></td>
						<td><c:out value="${ event.city }"/></td>
						<td><c:out value="${ event.creator.firstName } ${ event.creator.lastName }"/></td>
						<td>
							<c:choose>
							<c:when test="${ event.creator.id == user.id }">
								<a href="/events/${ event.id }/edit" class="badge badge-warning">Edit</a>
								<form action="/events/${ event.id }" method="POST">
									<input type="hidden" name="_method" value="DELETE">
									<button type="submit" class="btn badge badge-danger">Delete</button>
								</form>
							</c:when>
							<c:otherwise>
								<c:choose>
								<c:when test="${ event.checkUser(user) }">
									Attending | <a href="/cancel/${ event.id }/${ user.id} ">Cancel</a>
								</c:when>
								<c:otherwise>
									<a href="/events/${ event.id }/${ user.id}" class="badge badge-success">Attend</a>
								</c:otherwise>
								</c:choose>
							</c:otherwise>
							</c:choose>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="mb-5">
			<h4>Events in other states:</h4>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Name</th>
						<th>Date</th>
						<th>Location</th>
						<th>State</th>
						<th>Host</th>
						<th>Action | Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ nonLocalEvents }" var="event">
					<tr>
						<td><a href="/events/${ event.id  }"><c:out value="${ event.name }"/></a></td>
						<td><fmt:formatDate value="${ event.date }" type="date"/></td>
						<td><c:out value="${ event.city }"/></td>
						<td><c:out value="${ event.state }"/></td>
						<td><c:out value="${ event.creator.firstName } ${ event.creator.lastName }"/></td>
						<td>
							<c:choose>
							<c:when test="${ event.creator.id == user.id }">
								<a href="/events/${ event.id }/edit" class="badge badge-warning">Edit</a>
								<form action="/events/${ event.id }" method="POST">
									<input type="hidden" name="_method" value="DELETE">
									<button type="submit" class="btn badge badge-danger">Delete</button>
								</form>
							</c:when>
							<c:otherwise>
								<c:choose>
								<c:when test="${ event.checkUser(user) }">
									Attending | <a href="/cancel/${ event.id }/${ user.id} ">Cancel</a>
								</c:when>
								<c:otherwise>
									<a href="/events/${ event.id }/${ user.id}" class="badge badge-success">Attend</a>
								</c:otherwise>
								</c:choose>
							</c:otherwise>
							</c:choose>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>