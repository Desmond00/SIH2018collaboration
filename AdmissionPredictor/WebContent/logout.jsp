<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Confirm logout</title>
	</head>
	<%@include file="_includes/scripts.jsp" %>
<body>
<div class="container">
 	<%@include file="_includes/navbar.jsp" %>
 	<br/><br/><br/><br/>
	<div align="center">
		<h4><strong>Confirm logout: </strong></h4>
		<form action="Logout" method="post">
			<input type="radio" class="radio-inline" name="confirm" value="yes">Yes
			<input type="radio" class="radio-inline" name="confirm" value="no">No
			<Button class="btn btn-default" type="submit" >Submit</Button> 
		</form>
	</div>
	</div>
</body>
</html>