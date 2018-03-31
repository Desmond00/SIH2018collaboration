<jsp:useBean id="State" class="admission.State" scope="page"></jsp:useBean>
<jsp:useBean id="subState" class="admission.Institute" scope="page"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admission Predictor</title>
<%@include file="_includes/scripts.jsp"%>

<script src="assets/js/jquery.js"></script>
<script>
	$(document).ready(function() {
		
		$("#showChartsButton").hide();
		$("#download").hide();
	    $('#showChartsButton').click(function(event) {
	    	
	        var formData = {
		            'institute'		    : $("#institute").val(),
		            'subCategory'             : $('#subCategory').val(),
		            'stateQuota'             : $('#stateQuota').val()	
		        };
	        
		
		         $.ajax({
		            type        : 'GET', 
		            url         : "RankList",
		            data        : formData, 
		            dataType    : 'json', 
		        })
		            .done(function(datarec) {
		                if (!(datarec === null)) { 
		                	var ctx = document.getElementById("myChart").getContext('2d');
		                	console.log(datarec.branchName);
		                	var labels = [];
		                	datarec.branchName.forEach(function (packet){
		                		labels.push(packet)
		                	});
		                	var datagen = [];
		                	datarec.gr.forEach(function (packet){
		                		datagen.push(packet)
		                	});
		                	var dataobc = [];
		                	datarec.obcr.forEach(function (packet){
		                		dataobc.push(packet)
		                	});
		                	var datast = [];
		                	datarec.str.forEach(function (packet){
		                		datast.push(packet)
		                	});
		                	var datasc = [];
		                	datarec.scr.forEach(function (packet){
		                		datasc.push(packet)
		                	});
		                	
		                	var myChart = new Chart(ctx, {
		                	    type: 'bar',
		                	    data: {
		                	        labels: labels,

		                	        datasets : [{
		                	        	label: 'General Rank',
		                	        	fill: true,
		                	        	fillColor : "rgba(12,45,250,1)",
		                	        	backgroundColor: 'rgba(0, 99, 132, 0.6)',
		                	        	borderColor: 'rgba(0, 99, 132, 1)',
		                	            strokeColor           : "rgba(151,187,205,1)",
		                	            pointColor            : "rgba(100,255,100,1)",
		                	            pointStrokeColor      : "#fff",
		                	            pointHighlightFill    : "#fff",
		                	            pointHighlightStroke  : "rgba(151,187,205,1)",
		                	            data                  : datagen
		                	        },
		                	        {
		                	        	label: 'OBC Rank',
		                	        	fill: false,
		                	        	backgroundColor: 'rgba(99, 132, 0, 0.6)',
		                	        	  borderColor: 'rgba(99, 132, 0, 1)',
		                	            strokeColor           : "rgba(0,187,205,1)",
		                	            pointColor            : "rgba(100,255,100,1)",
		                	            pointStrokeColor      : "rgba(100,255,100,1)",
		                	            pointHighlightFill    : "#rgba(100,255,100,1)",
		                	            pointHighlightStroke  : "rgba(0,187,205,1)",
		                	            data                  : dataobc
		                	        },
		                	        {
		                	        	label: 'ST Rank',
		                	        	fill: false,
		                	        	backgroundColor: 'rgba(0, 132, 96, 0.6)',
		                	        	  borderColor: 'rgba(0, 132, 96, 1)',
		                	            strokeColor           : "rgba(0,187,205,1)",
		                	            pointColor            : "rgba(100,255,100,1)",
		                	            pointStrokeColor      : "rgba(100,255,100,1)",
		                	            pointHighlightFill    : "#rgba(100,255,100,1)",
		                	            pointHighlightStroke  : "rgba(0,187,205,1)",
		                	            data                  : datast
		                	        },
		                	        {
		                	        	label: 'SC Rank',
		                	        	fill: true,
		                	        	backgroundColor: 'rgba(132, 0, 45, 0.6)',
		                	        	  borderColor: 'rgba(132, 0, 45, 1)',
		                	        	
		                	            strokeColor           : "rgba(0,187,205,1)",
		                	            pointColor            : "rgba(100,255,100,1)",
		                	            pointStrokeColor      : "rgba(100,255,100,1)",
		                	            pointHighlightFill    : "#rgba(100,255,100,1)",
		                	            pointHighlightStroke  : "rgba(0,187,205,1)",
		                	            data                  : datasc
		                	        }]
		                	    },
		                	    options: {
		                	    	title: {
		            					display: true,
		            					text: 'Please hover on the bar for more details'
		            				},
		            				tooltips: {
		            					mode: 'index',
		            					intersect: true	,
		            				},
		            				hover: {
		            					mode: 'nearest',
		            					intersect: true
		            				},
		            				scales: {
		            					xAxes: [{
		            						display: false,
		            						ticks:{
		            					        maxTicksLimit: 20
		            					    },
		            						scaleLabel: {
		            							display: true,
		            							labelString: 'Institutes'
		            						}
		            					}],
		            					yAxes: [{
		            						display: true,
		            						scaleLabel: {
		            							display: true,
		            							labelString: 'Rank'
		            						}
		            					}]
		            				}
		                	    }
		                	});
		                	$("#download").show();
		                	}	
		                 else {
		                	$('#message').html("Unsucess")
		                }
		
		            }); 
		        event.preventDefault();
	    });
	   

	})  ;
	function download(){
        var download = document.getElementById("download");
        var image = document.getElementById("myChart").toDataURL("image/jpg")
                    .replace("image/jpg", "image/octet-stream");
        download.setAttribute("href", image);

    }
</script>
</head>
<body>
<%@include file="_includes/navbar.jsp"%>
		<br><br><br>
		<div id="admissionDetails">
			
			<div id="states">
			<label>State</label>
				<select class="form-control" name="state" id="state" onchange="setState()">
					<%
						try {
							out.println(State.getStateList());
						} catch (Exception e) {
							out.println(e);
						}
						String[] sub_category = subState.getSubCategoryList();
						String[] state_quota = subState.getStateQuotaList();

						//Storig database sub category list into javaScript array
						int i;
						out.println("<script>");
						String subCat = "<option disabled selected value> -- select a category -- </option>";
						for (i = 0; i < sub_category.length; ++i) {
							subCat += "<option value=" + sub_category[i] + ">" + sub_category[i] + "</option>";
						}

						out.println("var subCat = \"" + subCat + "\"");
						//Storing database state quota list into javaScript array
						String stateQt = "<option disabled selected value> -- select a quota  -- </option>";
						String state_val  = null;
						for (i = 0; i < state_quota.length; ++i) {
							state_val = state_quota[i].equals("HS")?"HOMESTATE":"OTHERSTATE";
							stateQt += "<option value=" + state_quota[i] + ">" +state_val+ "</option>";
						}

						out.println("var stateQt = \"" + stateQt + "\"</script>");
					%>
				</select>
			</div>
			<br>
			<div id="institutes">
			</div><br>
			<div id="divSubCategory">
			</div><br>
			<div id="divStateQuota"></div><br>

			<button class="btn btn-primary" id="showChartsButton" name="showChartsButton" type="submit">Show
				Statistics</button>
			<div  id="mychart">
				<canvas id="myChart"></canvas>
			</div>
			<br>
<a class="btn btn-primary btn-sm " id="download" download="image.jpg">
<button type="button" class="btn btn-primary btn-sm" onClick="download()">Download as Image</button>
</a>
			
			
		</div>
<%@include file="_includes/footer.jsp" %>
</body>
<script>


</script>
<script src="assets/js/admission/StateOperation.js"></script>
<script src="assets/js/admission/InstituteOperation.js"></script>
</form>
</html>