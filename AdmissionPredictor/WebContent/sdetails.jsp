<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.awt.List"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student details</title>
<%@include file="_includes/scripts.jsp" %>	
</head>
<body>
<%@include file="_includes/navbar.jsp" %>
	<div class="container">
	<br/><br/><br/><br/><br/>
	<h1>Student Details</h1>
	
		<table class="table table-bordered" align="center">
		
		<tr>
			<th>Username</th>
			<th>${UserID}</th>
		</tr>
		<tr>
			<th>Name</th>
			<th>${name}</th>
		</tr>
		<tr>
			<th>Roll No</th>
			<th>${rollno}</th>
		</tr>
		<tr>
			<th>Date of Birth</th>
			<th>${dob}</th>
		</tr>
		<tr>
			<th>Branch</th>
			<th>${branch}</th>
		</tr>
		<tr>
			<th>CGPA</th>
			<th>${cgpa}</th>
		</tr>
		<tr>
			<th>Email Id</th>
			<th>${email}</th>
		</tr>
		</table>
	</div>
</body>
</html>
