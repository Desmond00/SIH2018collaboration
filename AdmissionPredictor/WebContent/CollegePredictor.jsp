<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>College Predictor</title>
<%@include file="_includes/scripts.jsp"%>
</head>
<body>
	<%@include file="_includes/navbar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<form id="prediction-form" class="needs-validation" novalidate>

			<label for="rank">Enter your JEE Rank</label> <input type="text"
				class="form-control" id="rank" placeholder="" required>
			<div class="invalid-feedback">Enter your JEE Rank</div>
			<br> 
			<label for="category">Category</label>
			 <select class="form-control" id="userCategory">
			 	<option disabled selected value> -- select a category  -- </option>
     			 <option value="GE">General</option>
			      <option value="SC">SC</option>
			      <option value="ST">ST</option>
			      <option value="OBC">OBC</option>
   			</select>
			<br>
			<div id="message"></div>
			<br>
			<button class="btn btn-primary" type="submit">Submit</button>
		</form>
		<br>
		<table id="tabledata" class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name of the Institute</th>
					<th scope="col">Discipline</th>
					<th scope="col">Closing Rank</th>
					<th scope="col">Companies Visited in the past years</th>
				</tr>
			</thead>
			<tbody id="tablebody">
				
			</tbody>
		</table>
	</div>
	<br>
	<%@include file="_includes/footer.jsp" %>
</html>
<script>
	$(document).ready(function() {
		console.log("Hello college predictor")
		$('#tabledata').hide();

		$('#prediction-form').submit(function(event) {
			$('#tabledata').show();
			if ($('#prediction-form')[0].checkValidity() === true) {
				var i= 0;
				var formData = {
					'userRank' : $('#rank').val(),
					'userCategory' : $('#userCategory').val()
				};
				console.log(formData);	

				$.ajax({
					type : 'POST',
					url : 'admissionStyle2',
					data : formData,
					dataType : 'json',
					encode : true
				}).done(function(data) {
					console.log(data);
					if (!(data === null)) {
						for(i = 0; i < data.length; i++){
							console.log("i= "+i);
							$('#tablebody').append("<tr><th scope=\"row\">"+ i + "</th><td>"+data[i].instituteName+"</td><td>"+data[i].branch+"</td><td>"+data[i].rank+"</td><td>"+data[i].companies+"</td></tr>");			
						}
						 $('#tabledata').DataTable();
						
					} else {
						$('#message').html("Connection Problem")
					}

				});
				event.preventDefault();
			} else {
				event.preventDefault();
				event.stopPropagation();
			}
			$('#prediction-form').addClass('was-validated');
		});

	});
</script>