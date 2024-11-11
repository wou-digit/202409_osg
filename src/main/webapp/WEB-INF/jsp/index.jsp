<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			</div>
			<div class="navbar-right">
				<a href="/signin">Signin</a>
			</div>
		</div>
	
		<footer><a href="/">OneStopGroceries</a>&copy; 2024. Made with love in Penang.</footer>
	</div>
</body>
</html>