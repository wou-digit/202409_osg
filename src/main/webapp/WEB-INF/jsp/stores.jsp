<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stores</title>
</head>
<body>

	<div class="container">
		<c:if test="${empty stores}">
		<p>Store(s) not found.</p>
		</c:if>
		
		<c:if test="${not empty stores }">
		<table>
			<thead>
				<tr>
					<th>#</th>
					<th>name</th>
					<th>description</th>
					<th>address</th>
					<th>phone</th>
					<th>#action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="store" items="${stores}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${store.name}</td>
					<td>${store.description}</td>
					<td>${store.address}</td>
					<td>${store.phone}</td>
					<td><button>Edit</button> <button><a href="/stores/${store.id}">Delete</a></button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
	</div>
	
	<div class="container">
		<p>Add New Store <a href="/stores/new">+</a></p>
	</div>

</body>
</html>