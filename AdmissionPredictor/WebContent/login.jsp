<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login - Admission and Job PredictorS</title>
<%@include file="_includes/scripts.jsp"%>
</head>
<%@include file="_includes/navbar.jsp"%>
<script>
var captcha;
function generateCaptcha() {
    var a = Math.floor((Math.random() * 10));
    var b = Math.floor((Math.random() * 10));
    var c = Math.floor((Math.random() * 10));
    var d = Math.floor((Math.random() * 10));
 
    captcha=a.toString()+b.toString()+c.toString()+d.toString();
    
    document.getElementById("captcha").value = captcha;
}
function captchamatched(){
    var input=document.getElementById("inputText").value;
    if(input==captcha){
        return true;
    }
    else{
        return false;
    }
}
</script>
<body onload="generateCaptcha()">
	<div class="container">
		
		<br /> <br /> <br />
		<div align="left">
			<form  id="login-form" class="needs-validation " novalidate>
				<label for="email">Email ID</label>
				<input	type="text" class="form-control" id="email" placeholder="abc@xyz.com" required>						
				<div class="invalid-feedback">Enter your Email ID</div>
				<br>
				<label for="password">Password</label>
				<input	type="password" class="form-control" id="password" required>						
				<div class="invalid-feedback">Enter your password</div>
				<br>
				<label for="captcha">Verification Code</label>
				<input class="form-control" type="text" id="captcha" disabled/>
				<br>
				<label for="inputText">Enter The Above Code</label>
				<input class="form-control" type="text" id="inputText" required />
				<div class="invalid-feedback">Please Enter The Above Code</div><br>
				<br>
				<div id="message"></div>
				<br>			
				<button class="btn btn-primary" type="submit">Login</button>
				<a class="btn btn-primary" href="./signup.jsp">Sign Up</a>
			</form>

			

		</div>
	</div>

<%@include file="_includes/footer.jsp" %>
<script>
$(document).ready(function() {
	console.log("Hello yo login")
	
    $('#login-form').submit(function(event) {
    	if($('#login-form')[0].checkValidity() === true){
    		
    		if(!captchamatched()){
            	$('#message').html("Wrong Captcha");
            	 event.preventDefault();

    		}
    		else{
		        var formData = {
		            'email'             : $('#email').val(),
		            'password'		    : $('#password').val()
		        };
		
		        $.ajax({
		            type        : 'POST', 
		            url         : 'clogin.jsp',
		            data        : formData, 
		            dataType    : 'json', 
		            encode          : true
		        })
		            .done(function(data) {
		                console.log(data); 
		                if (data.success) {
		                	$('#message').html("Login Sucessful.</br> Redirecting to Homepage");
		                	setTimeout(function(){$(location).attr('href','index.jsp'); }, 2000);
		   	
		                }
		                else {
		                	$('#message').html("Wrong Email/ Password")
		                }
		
		            });
		        event.preventDefault();
	    	}
    	}
    	else{
    		event.preventDefault();
            event.stopPropagation();
    	}
    	$('#login-form').addClass('was-validated');
    });

});




</script>
</body>
</html>