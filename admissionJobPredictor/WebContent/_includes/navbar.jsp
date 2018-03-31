<div class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="topnav">
	<div class="container-fluid">
        <div class="navbar-header">
	        <a class="navbar-brand" href="index.jsp"><img src="assets/images/logo.png" alt="NSEC" height="33px" /></a>
        </div>
        <button class="navbar-toggler" 
        		type="button" data-toggle="collapse" 
        		data-target="#Navbar"
        		aria-controls="Navbar" 
        		aria-expanded="false" aria-label="Toggle navigation">
        	<span class="navbar-toggler-icon"></span>	
        </button>
 
	    <div class="collapse navbar-collapse " id="Navbar">
	        <ul class="nav navbar-nav mr-auto">
	          	<li class="nav-item active"><a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
	          	<li class="nav-item"><a class="nav-link" href="about_us.jsp"><i class="fas fa-info"></i> About Us</a></li>
	          	<li class="nav-item"><a class="nav-link" href="contact.jsp"><i class="fas fa-question"></i> Contact</a></li>
	            <% if(session.getAttribute("UserID") == null){ %>
		            <li class="nav navbar-nav navbar-right">
		         	   	<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a class="nav-link" href="signup.jsp"><i class="fas fa-user-plus"></i> Sign Up</a></li>
					  		<li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
						</ul>
					</li>
				<% } else{ %>
					<li class="nav-item"><a href="my_account.jsp">My Account</a></li>
	            	<li class="nav-item"><a href="logout.jsp">Log Out</a></li>
					<p class="navbar-text navbar-right">Signed in as <a href="my_account.jsp" class="navbar-link"><strong>
						<% out.print(session.getAttribute("UserID")); %>
					</strong></a></p>
	           	<% } %>
	     	</ul>
	   	</div>
	</div>
</div>