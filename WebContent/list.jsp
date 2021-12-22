<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>X-Mobile|Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dashboard.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/293dbbaba2.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<div class="viewport">
		<div class="sidebar">
			<header>
				<a href="#">X-Mobile</a>
			</header>
			<ul class="sidenav">
				<li><a href="${pageContext.request.contextPath}/admin/dashboard.jsp">Dashboard</a></li>
				<li><a href="#">Staff Manager</a></li>
				<li><a href="">Product</a></li>
			</ul>
		</div>
		<div class="content">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<ul class="navbar-nav">
					<li class="nav-item">${user}</li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/logout">Logout</a></li>
				</ul>
			</nav>
			<div class="container-fluid">
				<table>
					<tr>
						<th>ID</th>
						<th>Product name</th>
						<th>Describe</th>
						<th>Price</th>
						<th>Source</th>
						<th>Type</th>
						<th>Brand</th>
					</tr>
					<c:forEach var="product" items="${products}">
						<tr>
							<td>${product.id}</td>
							<td>${product.name}</td>
							<td>${product.description }</td>
							<td>${product.price}</td>
							<td><a href="${product.src}">Img</a></td>
							<td>${product.type}</td>
							<td>${product.brand}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

</body>
</html>