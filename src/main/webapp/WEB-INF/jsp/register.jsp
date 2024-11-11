<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style>
.form-group {
	display: flex;
	align-items: center;
	margin: 10px 0;
}
.form-group label{
	width: 80px;
} 
.form-group button{
	margin: 10px 0;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Register</h2>
		<form:form action="/register/new" method="post" modelAttribute="user">
			<div class="form-group">
				<label for="username">Username:</label>
				<input type="text" name="username" required />
			</div>
			<div class="form-group">
				<label for="email">Email:</label>
				<input type="text" name="email" required />
			</div>
			<div class="form-group">
				<label for="password">Password:</label>
				<input type="password" name="password" required />
			</div>
			<div class="form-group">
				<button type="submit">Register</button>
			</div>
			
			<c:if test="${not empty errmsg}">
			<div class="form-group">
				<p>${errmsg}. Please signin <a href="/signin">here</a></p>
			</div>
			</c:if>
			
		</form:form>
		
		<footer><a href="/">OneStopGroceries</a>&copy; 2024.</footer>
	</div>
	
</body>
</html>