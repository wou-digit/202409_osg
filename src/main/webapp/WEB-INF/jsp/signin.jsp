<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signin</title>
<style>
.form-group {
	display: flex;
	align-items: center;
	margin: 10px 0;
}
.form-group label {
	width: 80px;
}
</style>
</head>
<body>
	<div class="container">
	<h2>Sign In</h2>
	<form:form action="/login" method="post">
		<div class="form-group">
			<label for="username">Username:</label>
			<input type="text" name="username" id="username" required />
		</div>
		<div class="form-group">
			<label for="password">Password:</label>
			<input type="password" name="password" id="password" required />
		</div>
		<div class="form-group">
			<button type="submit">Sign in</button>
		</div>
		<div class="form-group">
			<p><a href="#">Forgot password?</a></p>
		</div>
	</form:form>
	
	<footer><a href="/">OneStopGroceries</a>&copy; 2024.</footer>
	</div>
</body>
</html>