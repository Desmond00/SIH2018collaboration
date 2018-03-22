<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="_includes/metatags.jsp"  %>
	<title>Admission and Job prediction</title>
	<%@include file="_includes/scripts.jsp" %>
</head>


<body data-target="#topnav">
	<%@include file="_includes/navbar.jsp" %>
	
	<header class="jumbotron">
		<div class="container">
			<div class="row row-header">
				<div class="col-12 col-sm-8">
					<h1> Prediction of Admission & Jobs in Engineering & Technology with respect to demographic locations </h1>
				</div class="col col-sm">
				<div class="col col-sm align-self-center">
					<img src="assets/images/logo.png" class="img-fluid">
				</div>
			</div>
		</div>
	</header>
	
	<div class="container">
				<div class="row row-content">
					<div class="col">
						<div id="mycarousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active">
									<div class="container">
										<img class="d-block img-fluid "
										src="assets/images/ban1.jpg"">
									</div>
								</div>
								<div class="carousel-item">
									<img class="d-block img-fluid "
									src="assets/images/ban2.jpg">

								</div>
								<div class="carousel-item ">
									<img class="d-block img-fluid "
									src="assets/images/ban3.jpg">
								</div>
								<ol class="carousel-indicators">
									<li data-target="#mycarousel" data-slide-to="0" class="active"></li>
									<li data-target="#mycarousel" data-slide-to="1"></li>
									<li data-target="#mycarousel" data-slide-to="2"></li>
								</ol>
								<a class="carousel-control-prev" href="#mycarousel" role="button" data-slide="prev">
									<span class="carousel-control-prev-icon"></span>
								</a>
								<a class="carousel-control-next" href="#mycarousel" role="button" data-slide="next">
									<span class="carousel-control-next-icon"></span>
								</a>	
							</div>
						</div>
					</div>
				</div>
			</div>
	
	
	<%@include file="_includes/footer.jsp" %>
</body>
</html>