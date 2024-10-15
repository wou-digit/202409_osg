<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store | Edit</title>
</head>
<body>
	<div class="container">
	
		<c:if test="${not empty store}">
		<h2>Edit Store</h2>
		
		<form:form action="/stores/${store.id}/update" method="POST" modelattribute="store">
			<div class="form-group">
				<label for="name">Name</label>
				<input type="text" name="name" value="${store.name}" required />
			</div>
			
			<div class="form-group">
				<label for="description">Description</label>
				<input type="text" name="description" value="${store.description}" required />
			</div>
			
			<div class="form-group">
				<label for="address">Address</label>
				<input type="text" name="address" value="${store.address}" required />
			</div>
			
			<div class="form-group">
				<label for="phone">Phone</label>
				<input type="text" name="phone" value="${store.phone}" required />
			</div>
			
			<div class="form-group">
				<button><a href="/stores">Cancel</a></button>
				<button type="submit">Update</button>
			</div>
		</form:form>
		
		</c:if>
		
		<c:if test="${not empty errorMessage}">
		<p>${errorMessage}</p>
		</c:if>
	</div>
</body>
</html>