<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Signup page</title>
<%@include file="_includes/scripts.jsp"%>
</head>
<body>
	<%@include file="_includes/navbar.jsp"%>
	<div class="container">
		
		<br />
		<br />
		<br />
		<br />
		<div class="page-header">
			<h1>Sign Up</h1>
		</div>
		<br />
		<br />
		<div>
			<form method="post" id="signup-form" class="needs-validation"
				novalidate>

				<input class="form-control" placeholder="Email" name="email" id="email"
					type="text" required />
				<div class="invalid-feedback">Enter your Email ID</div>
				</br>
				<div class="form-group">
					<input class="form-control" placeholder="Password" name="password"  id="password"
						type="password" required />
					<div class="invalid-feedback">Enter your password</div>

				</div>

				<div>
					<input class="form-control" placeholder="Confirm Password"
						name="cpassword" id="cpassword" type="password" required />
					<div class="invalid-feedback">Renter your password</div>
					<br />
				</div>
				<div id="message"></div>
				<br>
				<button class="btn btn-primary" type="submit">Submit</button>
			</form>
		</div>
	</div>
<%@include file="_includes/footer.jsp" %>
<script>
	$(document).ready(function() {
		console.log("Signup page")

	    $('#signup-form').submit(function(event) {
	    	if($('#signup-form')[0].checkValidity() === true){
		        var formData = {
		            'email'             : $('#email').val(),
		            'password'		    : $('#password').val(),
		            'cpassword'			: $('#cpassword').val()
		        };
		        
		        $.ajax({
		            type        : 'POST', 
		            url         : 'SignupServlet',
		            data        : formData, 
		            dataType    : 'json', 
		            encode       : true
		        })
		            .done(function(data) {
		                console.log(data); 
		                if (data.success) {
		                	$('#message').html("Sign Up Sucessful.</br> Redirecting to Homepage");
		                	setTimeout(function(){$(location).attr('href','index.jsp'); }, 2000);
		   	
		                }
		                else {
		                	$('#message').html(data.error.message);
		                }

		            });
		        event.preventDefault();
	    	}
	    	else{
	    		event.preventDefault();
	            event.stopPropagation();
	    	}
	    	$('#signup-form').addClass('was-validated');
		});
		

	});
	
	</script>
</body>
</html>
