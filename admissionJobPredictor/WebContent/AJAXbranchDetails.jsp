<jsp:useBean id="branchDetails" class="admission.BranchDetails" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="branchDetails"/>

<%= branchDetails.calculateNoOfBranches() %>