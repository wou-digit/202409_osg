<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stores</title>
<style>
.navbar {
	display: flex;
	background: #222831;
	justify-content: space-between;
}
.navbar a {
	margin-right: 10px;
	color: #eeeeee;
	text-decoration: none;
}
.navbar a:hover {
	text-decoration: underline;
}
.navbar-right {
	display: flex;
}
.navbar-right button {
	width: 60px;
	border: none;
	background: none;
	color: #eeeeee;
	text-decoration: none;
}
.navbar-right button:hover {
	text-decoration: underline;
}
.navbar-right a {
	justify-items: right;
}
.container-flex {
	display: flex;
	justify-content: left;
	flex-wrap: wrap;
}

.card {
	margin: 5px 10px;
	padding: 5px 5px;
	height: 240px;
	width: 300px;
	text-align: center;
	border: 1px solid #000;
	border-radius: 5px;
}

button {
	width: 100px;
}
footer {
	padding: 20px 0;
}
</style>
</head>
<body>
	<div class="container" style="margin-left: 10px;">
	
		<div class="navbar">
			<div class="navbar-left">
				<a href="/">Homepage</a>
				<a href="/about">About</a>
				<a href="/contact">Contact</a>
				<a href="/register">Register</a>
			</div>
			<div class="navbar-right">
				<c:if test="${not empty username}">
				<a href="#">@${username}</a>
				</c:if>
				
				<c:if test="${empty pageContext.request.remoteUser}">
				<a href="/signin">Signin</a>
				</c:if>
				
				<c:if test="${not empty pageContext.request.remoteUser}">
				<form:form action="${pageContext.request.contextPath}/logout" method="POST">
					<button type="submit">Logout</button>
				</form:form>
				</c:if>
			</div>
		</div>
	
		<p>Add New Store <a href="/stores/new">+</a></p>
	</div>
	
	<div class="container-flex">
		
		<c:if test="${not empty stores}">
		<c:forEach var="store" items="${stores}" varStatus="status">
		<div class="card">
			<h2><a href="/stores/${store.id}">${store.name}</a></h2>
			<p>${store.description}</p>
			<p>Address: ${store.address}<p>
			<p>Phone: ${store.phone}</p>
			<form:form action="/stores/${store.id}" method="post">
				<button type="submit">Delete</button>
			</form:form>
		</div>
		</c:forEach>
		</c:if>
		
	</div>
	
	<footer><a href="/">OneStopGroceries</a>&copy; 2024. Made with love in Penang.</footer>
</body>
</html>