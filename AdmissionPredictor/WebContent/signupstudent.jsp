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
		<h1>Student registration</h1>
	</div>
	<br/><br/>
	<div align="center">
	<form method="post" action="SignupServletStudent">
				<div><input class="form-control" placeholder="UserID" name="userid" type="text"/><br/></div>
	
		<div><input class="form-control" placeholder="First Name" name="fname" type="text"/><br/></div>
		<div><input class="form-control" placeholder="Last Name" name="lname" type="text"/><br/></div>
		<div><input class="form-control" placeholder="Roll Number" name="rollno" type="text"/><br/></div>
		<div><input class="form-control" placeholder="Branch" name="branch" type="text"/><br/></div>
		<div><input class="form-control" placeholder="CGPA" name="cgpa" type="text"/><br/></div>
		<div><input class="form-control"placeholder="Email"  name="email" type="text"/><br/></div>
		<div><input class="form-control" placeholder="DOB(DD/MM/YYYY)" name="dob" type="text"/><br/></div>
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