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
</style>
</head>
<body>
	<div class="container" style="margin-left: 10px;">
		<p>Add New Store <a href="/stores/new">+</a></p>
	</div>
	
	<div class="container-flex">
		
		<c:if test="${not empty stores}">
		<c:forEach var="store" items="${stores}" varStatus="status">
		<div class="card">
			<h2>${store.name}</h2>
			<p>${store.description}</p>
			<p>Address: ${store.address}<p>
			<p>Phone: ${store.phone}</p>
			<button>Edit</button>
			<button>Delete</button>
		</div>
		</c:forEach>
		</c:if>
		
	</div>

</body>
</html>