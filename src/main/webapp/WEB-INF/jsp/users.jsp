<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users</title>
<style>
.container-users{
	margin: 10px;
	display: flex;
	flex-direction: column;
}
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
	width: 250px;
	text-align: center;
	border: 1px solid #000;
	border-radius: 5px;
}
.card .card-close {
	text-align: right;
	padding-right: 10px;
}
.card .card-close a {
	text-decoration: none;
}
.card .card-close a:hover {
	text-decoration: underline;
}
.card .card-item {
	padding-bottom: 10px;
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
	<div class="container">
		<div class="navbar">
			<div class="navbar-left">
				<a href="/">Homepage</a>
				<a href="/about">About</a>
				<a href="/contact">Contact</a>
				<a href="/register">Register</a>
				<a href="/stores">Stores</a>			
				<a href="/users">Users</a>	
				
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
	</div>
	<div class="container-users">
		<h2>People with access</h2>
		
		<c:if test="${not empty users }">
		<c:forEach var="user" items="${users}" varStatus="row">
		<div class="card">
			<div class="card-close"><a href="#">&times;</a></div>
			<div class="card-item">
				<a href="/users/${user.id}">${user.username}</a>
			</div>
			<div class="card-item">
				${user.email}
			</div>
		</div>
		</c:forEach>
		</c:if>
		
	</div>
</body>
</html>