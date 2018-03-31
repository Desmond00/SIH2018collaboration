<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Signup page</title>
	<%@include file="_includes/scripts.jsp" %>	
</head>
<body>
<div class="container">
 	<%@include file="_includes/navbar.jsp" %>
	<br/><br/><br/><br/>
	<div class="page-header">
		<h1>Sign Up if you are a recruiter</h1>
	</div>
	<br/><br/>
	<div align="center">
	<form method="post" action="SignupServlet">
	
		<div><input class="form-control" placeholder="Name" name="name" type="text"/><br/></div>
		<div><input class="form-control"placeholder="Email"  name="email" type="text"/><br/></div>
		<div><input class="form-control" placeholder="Contact" name="phone" type="text"/><br/></div>
		<div><input class="form-control" placeholder="Password"  name="passwd" type="password"/><br/></div>
		<div><input class="form-control" placeholder="ConfirmPassword"  name="cpasswd" type="password"/><br/><br/></div>
		<button class="btn btn-default"  type="submit" >Submit</button>
	</form>
	</div>
	</div>
</body>
</html>

<!-- 
		Base Salary: <input name="jsalary" type="text"/><br/>
		Min. CPI: <input name="jmincpi" type="text"/><br/>
		Branch preffered: <input name="jbranch" type="text"/><br/>
		Date of visit: <input name="jdov" type="text"/><br/> -->