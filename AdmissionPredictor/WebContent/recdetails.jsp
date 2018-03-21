<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="tpc.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="_includes/scripts.jsp" %>	
</head>
<body>
<%@include file="_includes/navbar.jsp" %>
	<div class="container">
<br/><br/><br/><br/><br/>
	<h1>Companies that came for job offers</h1>
<%
	Connect c = new Connect();
	Connection co = c.Conn();
	Statement stmt = co.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT Job_Name, EmailID, Contact, BaseSalary, MinCPI, BranchPreffered, DateofVisit FROM signup JOIN For_Job on signup.RecruiterID= For_Job.RecruiterID");
%>
<TABLE class="table table-bordered" id="tb01" border="1" style="width: 100%" style="backgroung-color:#E6E6FA">
<thead>
<TR>
	<TH>Name</TH>
	<th>Email ID</th>
	<th>Contact</th>
	<th>Base Salary</th>
	<th>Minimum CPI</th>
	<th>Branch Preffered</th>
	<th>Date of Visit</th>
	</TR>
	</thead>
	<%while(rs.next()){ %>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getFloat(4) %></td>
		<td><%=rs.getFloat(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7)%></td>
	</tr>
	<%} %>
</TABLE>
</div></div>
</body>
</html>