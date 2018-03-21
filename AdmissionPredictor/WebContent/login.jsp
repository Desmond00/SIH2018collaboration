<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login - Admission and Job PredictorS</title>
<%@include file="_includes/scripts.jsp"%>

</head>
<body>
	<div class="container">
		<%@include file="_includes/navbar.jsp"%>
		<br /> <br /> <br />
		<div align="center">
			<form class="needs-validation" novalidate>
				<label for="username">Email ID</label>
				<input	type="text" class="form-control" id="username" required>						
				<div class="invalid-feedback">Enter your Email ID</div>
				<br>
				<label for="password">Password</label>
				<input	type="text" class="form-control" id="password" required>						
				<div class="invalid-feedback">Enter your password</div>
				<br>
				<button class="btn btn-primary" type="submit">Login</button>
				<a class="btn btn-primary" href="./signup.jsp">Sign Up</a>
			</form>

			

		</div>
	</div>
</body>
</html>