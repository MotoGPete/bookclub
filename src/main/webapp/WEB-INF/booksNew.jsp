<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>books</title>
</head>
<body>
	<div class="container">
		<div class="container">
			<form:form action="/books/new" method="post" modelAttribute="newBook"
				class="form">
				<form:label path="title" class="form-label">Book Title:</form:label>
				<form:input path="title" type="text" class="form-control" />
				<form:errors path="title" class="text-danger" />

				<form:label path="author" class="form-label">Author:</form:label>
				<form:input path="author" type="text" class="form-control" />
				<form:errors path="author" class="text-danger" />

				<form:label path="description" class="form-label">Description</form:label>
				<form:textarea path="description" class="form-control"></form:textarea>

				<form:input type="hidden" path="user" value="${userName}"/>


				<button class="btn btn-primary">Submit</button>
			</form:form>
		</div>

	</div>
</body>
</html>

