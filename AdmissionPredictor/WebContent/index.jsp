<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admission and Job prediction</title>
	<%@include file="_includes/scripts.jsp" %>
</head>
<style>
.jumbotron{
	background-image: url("assets/images/back.jpg");
	background-repeat: no-repeat;
	background-size:  cover;	
	}
</style>
<body data-target="#topnav">
	<%@include file="_includes/navbar.jsp" %>
	
	<header class="jumbotron">
				<div class="container">
					<div class="row row-header">
						<div class="col-12 col-sm-8">
							<h1>Admission and Job Prediction</h1>
							<p>An application which predicts </p>
						</div class="col col-sm">
						<div class="col col-sm align-self-center">
							<img src="img/logo.png" class="img-fluid">
						</div>
						<div class="col col-sm align-self-center">
							<a class=" btn btn-outline-warning text-light res-card-header" href="#reserve-table"> Reserve Table </a>
						</div>
					</div>
				</div>
			</header>
	<br/><br/><br/><br/>
	
	<br/>
	
	<br/><br/>
	<%@include file="_includes/footer.jsp" %>
</body>
</html>