<div class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="topnav">
	<div class="container-fluid">
        <div class="navbar-header">
	        <a class="navbar-brand" href="index.jsp"><img src="assets/images/logo_updated_0.png" alt="NSEC" height="33px" /></a>
        </div>
        <button class="navbar-toggler" 
        		type="button" data-toggle="collapse" 
        		data-target="#Navbar"
        		aria-controls="Navbar" 
        		aria-expanded="false" aria-label="Toggle navigation">
        	<span class="navbar-toggler-icon"></span>	
        </button>
 
	    <div class="collapse navbar-collapse " id="Navbar">
	        <ul class="navbar-nav mr-auto">
	          	<li class="nav-item active"><a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
	          	<li class="nav-item"><a class="nav-link" href="about_us.jsp"><i class="fas fa-info"></i> About Us</a></li>
	          	<li class="nav-item"><a class="nav-link" href="contact.jsp"><i class="fas fa-question"></i> Contact</a></li>
	       <% if(session.getAttribute("email") == null){ %>

				<li class="nav-item"><a class="nav-link" href="signup.jsp"><i class="fas fa-user-plus"></i> Sign Up</a></li>
				<li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
			</ul>
			<% } else{ %>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="navbar-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         		 <% out.print(session.getAttribute("email")); %>
	        		</a>
	        		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="my_account.jsp">My Account</a>
						<a class="dropdown-item" id="signout" href="Logout">LogOut</a>
					</div>
				</li>	
			</ul>	

	          <% } %>
	     	
	   	</div>
	</div>
</div>