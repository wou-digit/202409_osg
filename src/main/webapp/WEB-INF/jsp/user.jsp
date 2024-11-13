<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User | Profile</title>
<style>
form {
	display: flex;
	flex-direction: column;
}
form .form-group{
	display: flex;
	justify-content: space-between;
	width: 300px;
	padding: 10px 0;
	border: 1px solid red;
}
form .form-group button{
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
	
		<c:if test="${not empty user}">
		<h2>Update Profile</h2>
		<form:form action="users/${user.id}" method="post" modelattribute="user">
			<div class="form-group">
				<label>Username:</label>
				<input type="text" name="username" value="${user.username}" required />
			</div>
			
			<div class="form-group">
				<label>Email:</label>
				<input type="text" name="email" value="${user.email}" required />
			</div>
			
			<div class="form-group">
				<label>Password:</label>
				<input type="password" name="password" placeholder="Type new password" required />
			</div>
			
			<sec:authorize access="hasAuthority('ADMIN')">
			<div class="form-group">
				<label>Role:</label>
				
				<input type="checkbox" id="role1" name="role1" value="user" checked disabled>
				<label for="userRole">User</label><br>
				<input type="checkbox" id="role2" name="role2" value="admin" >
				<label for="adminRole">Admin</label><br>
				
				<c:forEach var="role" items="${roles}" varStatus="row">
					<c:if test="${role.name.contains('ADMIN')}">
						<script>
							document.addEventListener("DOMContentLoaded", function() {
								const checkbox1 = document.getElementById("role2");
								checkbox1.checked = true;
							});
						</script>
					</c:if>
				</c:forEach>
			</div>
			</sec:authorize>

			<div class="form-group">
				<button type="submit">Save</button>
			</div>
		</form:form>
		</c:if>
		
		<c:if test="${not empty errmsg}">
		<p>${errmsg}</p>
		</c:if>
	</div>
</body>
</html> 