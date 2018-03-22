$(document).ready(function() {

    $('#login-form').submit(function(event) {
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
                	$('#message').html("Login Sucessful.")
                	$(location).attr('href','index.jsp');
                	
                }
                else {
                	$('#message').html("Wrong Email/ Password")
                }

            });
        event.preventDefault();
    });

});