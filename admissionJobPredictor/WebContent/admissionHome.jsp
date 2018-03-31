<jsp:useBean id="State" class="admission.State" scope="page"></jsp:useBean>
<jsp:useBean id="subState" class="admission.Institute" scope="page"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="assets/js/jquery.js"></script>
<script>
	$(document).ready(function() {
		$("#showChartsButton").hide();
	});
</script>
</head>
<body>
	<form action="#" method="post">
		<div id="admissionDetails">
			<div id="states">
				<select name="state" id="state" onchange="setState()">
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
						String subCat = "";
						for (i = 0; i < sub_category.length; ++i) {
							subCat += "<option value=" + sub_category[i] + ">" + sub_category[i] + "</option>";
						}

						out.println("var subCat = \"" + subCat + "\"");
						//Storing database state quota list into javaScript array
						String stateQt = "";
						for (i = 0; i < state_quota.length; ++i) {
							stateQt += "<option value=" + state_quota[i] + ">" + state_quota[i] + "</option>";
						}

						out.println("var stateQt = \"" + stateQt + "\"</script>");
					%>
				</select>
			</div>
			<div id="institutes"></div>
			<div id="divSubCategory"></div>
			<div id="divStateQuota"></div>
			<br>
			<button id="showChartsButton" name="showChartsButton" type="submit">Show
				Statistics</button>
		</div>
</body>
<script>
	
</script>
<script src="assets/js/admission/StateOperation.js"></script>
<script src="assets/js/admission/InstituteOperation.js"></script>
</form>
</html>