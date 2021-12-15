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
		<div class="d-flex mt-10">
			<div class="flex-column mr-auto p-2 text-left mt-5">
				<h1>Welcome, ${userName}</h1>
				<h4>Books From Everyones Shelves</h4>
			</div>
			<div class="d-flex p-2 align-items-center justify-content-around" text-right mt-5">
				<a class="btn btn-primary"href="/logout">Logout</a> 
				<a class= "btn btn-primary" href="/books/new">+Add to my shelf!</a>
			</div>

		</div>

		<div>
			<div class="table-responsive">
				<table
					class="table table-striped table-hover table-bordered table-info ">
					<thead>
						<tr>
							<th scope="col">id</th>
							<th scope="col">Title</th>
							<th scope="col">Author Name</th>
							<th scope="col">Posted By</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="eachBook" items="${books}">
							<tr>
								<td scope="row">${eachBook.id}</td>
								<td><a href="/books/${eachBook.id}">${eachBook.title}</a></td>
								<td>${eachBook.author}</td>
								<td>${eachBook.user.userName}</td>
							</tr>
						</c:forEach>

					</tbody>

				</table>
			</div>
		</div>
	</div>
</body>
</html>

