<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store | New</title>
<style>
.form-group {
	display: flex;
	padding: 5px 0;
}

.form-group label {
	width: 100px;
}

.form-group button {
	margin-right: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Create New Store</h2>
		
		<form:form action="/stores/new" method="POST" modelattribute="store">
			<div class="form-group">
				<label for="name">Name</label>
				<input type="text" name="name" required />
			</div>
			
			<div class="form-group">
				<label for="description">Description</label>
				<input type="text" name="description" required />
			</div>
			
			<div class="form-group">
				<label for="address">Address</label>
				<input type="text" name="address" required />
			</div>
			
			<div class="form-group">
				<label for="phone">Phone</label>
				<input type="text" name="phone" required />
			</div>
			
			<div class="form-group">
				<button><a href="/stores">Cancel</a></button>
				<button type="submit">Create</button>
			</div>
		</form:form>
	</div>
</body>
</html>