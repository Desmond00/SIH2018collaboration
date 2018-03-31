<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Statistics</title>
<%@include file="_includes/scripts.jsp"%>
</head>
<body>
	<%@include file="_includes/navbar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<div class="container" id="jobstatistics">

		<div id="states">
			<label>State</label> <select class="form-control" name="state"
				id="state">
				<option disabled selected value> -- select a state -- </option><option value=29>West Bengal</option>
				</select>
		</div>
		<br>

		<div id="institutes">
			<label>Institute</label> <select class="form-control" name="state"
				id="institute">
				<option disabled selected value> -- select a institution -- </option>
				<option value=45> Indian Institute of Technology Kharagpur</option></select>
		</div>
		<br>


		<div id="years">
			<label>Year</label> <select class="form-control" name="state"
				id="year">
				<option disabled selected value> -- select a year -- </option>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>

			</select>
		</div>
		<br>
		<button class="btn btn-primary" id="submit-button">Show Job
			Statistics</button><br><br>
			<div id="results" ></div>	<br>
			<table id="tabledata" class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name of the Institute</th>
					<th scope="col">Discipline</th>
					<th scope="col">DGPA</th>
					<th scope="col">Placed?</th>
				</tr>
			</thead>
			<tbody id="tablebody">
				
			</tbody>
		</table>
		<br><br>
		
	</div>
</body>
<%@include file="_includes/footer.jsp" %>

<script>
$(document).ready(function() {
	$('#institutes').hide();
	$('#years').hide();
	$('#submit-button').hide();
	$('#tabledata').hide();

	 
	
	$('#state').change(function(){
		//alert("I am clled");
		$("#institutes").show();
		$('#years').show();
		$('#submit-button').show();
		
	});
	$("#submit-button").click(function(){
		var i = 0;
		var formData = {
	            'state'             : "1",
	            'year'		    : $('#year').val()
	        };
	
	        $.ajax({
	            type        : 'POST', 
	            url         : 'jobStatistics',
	            data        : formData, 
	            dataType    : 'json', 
	            encode          : true
	        })
	            .done(function(data) {
	                console.log(data); 
	                if (!(data === null)) {
	                	console.log(data);
	                	for(i = 0; i < data.length; i++){
							console.log("i= "+i);
							$('#tablebody').append("<tr><th scope=\"row\">"+ i + "</th><td>"+data[i].instituteName+"</td><td>"+data[i].branch+"</td><td>"+data[i].DGPA+"</td><td>"+data[i].placed+"</td></tr>");			
						}
						 $('#tabledata').DataTable();
						 $('#tabledata').show();
	   	
	                }
	                
	
	            });
	        var formData2 = {
    	            'state'             : "0",
    	            'year'		    : $('#year').val()
    	        };   
	        $.ajax({
	            type        : 'POST', 
	            url         : 'jobStatistics',
	            data        : formData2, 
	            dataType    : 'json', 
	            encode          : true
	        })
	            .done(function(data) {
	                console.log(data); 
	                if (!(data === null)) {
	                	console.log(data);
	                	$('#results').html("<h3>Students With Minimum DGPA "+data.minGPA+" got placed.</h3> </br><h3>Among a total of "+data.totalCandidates+" students "+data.totalPlaced+" got placed <br>acquiring "+Math.round((data.totalPlaced/data.totalCandidates)*100,2)+" percent of Placement.</h3> </br>")
				
	   	
	                }
	               
	
	            });
	});

});

</script>
</html>