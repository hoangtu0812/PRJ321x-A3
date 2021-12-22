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
				<a href="${pageContext.request.contextPath}">X-Mobile</a>
			</header>
			<ul class="sidenav">
				<li><a
					href="${pageContext.request.contextPath}/admin/dashboard.jsp?action=dashboard">Dashboard</a></li>
				<li><a href="#">Staff Manager</a></li>
				<li><a href="${pageContext.request.contextPath}/adminlist">Product</a></li>
			</ul>
		</div>
		<div class="content">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<form action="${pageContext.request.contextPath}/adminsearch" class="form-inline">
					<input type="text" name="search" class="form-control mr-sm-2" placeholder="Search"/>
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">${user}</li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/logout">Logout</a></li>
				</ul>
			</nav>
			<div class="container-fluid right-side">
				<c:if test='${param.action == "dashboard"}'>
					<h1>Welcome ${user}</h1>
					<p>This is my dashboard.</p>
				</c:if>
				<c:if test='${param.action == "list" }'>
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
				</c:if>
				<c:if test='${param.action == "searchresults" }'>
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
				</c:if>
			</div>
		</div>
	</div>

</body>
</html>