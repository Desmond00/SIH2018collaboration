<jsp:useBean id="institute" class="admission.Institute" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="institute"/>
<%
	out.println(institute.getInstituteList());
%>