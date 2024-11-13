<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	height: 250px;
	width: 300px;
	text-align: center;
	border: 1px solid #a8e6cf;
	border-radius: 5px;
}
.card button {
	width: 100%;
	border: none;
	margin-bottom: 2px;
}
.card button:hover {
	background: #42b883;
}
.container-search {
	margin-top: 20px;
	margin-left: 5px;
	margin-bottom: 10px;
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
				<a href="/stores">Stores</a>
				
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
	
		<sec:authorize access="hasAuthority('ADMIN')">
		<p>Add New Store <a href="/stores/new">+</a></p>
		</sec:authorize>
	</div>
	
	<div class="container-search">
		<div class="container-search">
			<form:form action="/search" method="post">
				<input type="text" name="keyword" />
				<button type="submit">Search</button>
			</form:form>
		</div>
	</div>
	
	<div class="container-flex">
		<c:if test="${not empty stores}">
		<c:forEach var="store" items="${stores}" varStatus="status">
		<div class="card">
			<h2>${store.name}</h2>
			<p>${store.description}</p>
			<p>Address: ${store.address}<p>
			<p>Phone: ${store.phone}</p>
			
			<sec:authorize access="hasAuthority('ADMIN')">
			<a href="/stores/${store.id}"><button>Edit</button></a>
			<form:form action="/stores/${store.id}" method="post">
				<button type="submit">Delete</button>
			</form:form>
			</sec:authorize>
		</div>
		</c:forEach>
		</c:if>
		
		<c:if test="${empty stores}">
		<p style="color: red;">No Store found.</p>
		</c:if>
		
	</div>
	
	<footer><a href="/">OneStopGroceries</a>&copy; 2024. Made with love in Penang.</footer>
</body>
</html>