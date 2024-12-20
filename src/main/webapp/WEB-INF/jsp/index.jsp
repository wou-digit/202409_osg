<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>
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
footer {
	margin-top: 100px;
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
				
				<sec:authorize access="hasAnyAuthority('USER','ADMIN')">
				<a href="/stores">Stores</a>
				</sec:authorize>
				
			</div>
			<div class="navbar-right">
				
				<sec:authorize access="isAuthenticated()">
				<a href="#">@<sec:authentication property="name" /></a>
				</sec:authorize>
				
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
	
		<footer><a href="/">OneStopGroceries</a>&copy; 2024. Made with love in Penang.</footer>
	</div>
</body>
</html>