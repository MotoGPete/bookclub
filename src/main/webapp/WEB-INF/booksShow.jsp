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
	<div class="container mt-5">
		<div class="d-flex">
			<div class="flex-column text-left">
				<h1>${book.title}</h1>
				<h5>Read By   ${book.user.userName}  </h5>
				<h5>by ${book.author}</h5>
				<h6>Heres are ${book.user.userName}'s thoughts....</h6>
				
			</div>
			<div class="flex-column text-right">
				<a class="btn btn-primary" href="/books">back to the shelves</a> <a class="btn btn-primary" href="/books/new">+Add
					to my shelf!</a>
			</div>
		</div>

		<div class="container text-center">
			<hr style="width: 90%"  size="3"  color=black>
			<div>${book.description}</div>
			<hr style="width: 50%"  size="3"  color=black>
			<a href="/books/${book.id}/edit">Edit Book</a>
		</div>
	</div>
</body>
</html>

