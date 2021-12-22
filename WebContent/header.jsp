<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${param.title}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/infoProduct.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cart.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/createaccount.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/createsuccess.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/history.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/293dbbaba2.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="header">
		<div class="inside-header">
		<a href="${pageContext.request.contextPath}/index.jsp"><img
			src="${pageContext.request.contextPath}/media/logo.png" /></a> 
		<a href="${pageContext.request.contextPath}/index.jsp" class="header-link"><i class="fas fa-list"></i> Products</a> 
		<a href="#" class="header-link"><i class="fas fa-address-card"></i> About us</a>
		<c:if test="${user == null}">
			<a href="${pageContext.request.contextPath}/login.jsp" class="header-link"><i class="fas fa-sign-in-alt"></i> Login</a>
		</c:if>
		<c:if test="${user != null}">
			<a href="${pageContext.request.contextPath}/history.jsp" class="header-link"><i class="fas fa-history"></i> History</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/cart.jsp" class="header-link"><i class="fas fa-shopping-cart"></i> Cart</a>
		<c:if test='${role == "1" }'><a href="${pageContext.request.contextPath}/admin/dashboard.jsp" class="header-link"><i class="fas fa-user-cog"></i> Dashboard</a></c:if>
		<c:if test="${user != null}"><a href="${pageContext.request.contextPath}/history.jsp" class="header-link">${user}</a><a href="${pageContext.request.contextPath}/logout">(Logout)</a></c:if>
		<form action="${pageContext.request.contextPath}/search" class="search-form">
			<input type="text" name="search" placeholder="Search..."/>
			<button type="submit"><i class="fas fa-search" class="search-btn"></i></button>
		</form>
		</div>
	</div>
