<%@include file="config.jsp"%>
<%@include file="inst-header.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	ResultSet r = con.createStatement().executeQuery("SELECT * FROM student WHERE stu_id = "+request.getParameter("id"));
	r.next();
%>
<div class="col-sm-6 mt-5  mx-3 jumbotron">
	<h3 class="text-center">View Student Details</h3>
	<div class="form-group">
		<img alt="" src='<%=r.getString("stu_img")%>' width="250" height="250">
	</div>
	<div class="form-group">
		<label for="stu_id"><b>ID</b></label>
      	<input type="text" class="form-control" value='<%=r.getString("stu_id")%>' readonly>
    </div>
    <div class="form-group">
      	<label for="stu_name"><b>Name</b></label>
      	<input type="text" class="form-control" value='<%=r.getString("stu_name")%>' readOnly>
    </div>
    <div class="form-group">
      	<label for="stu_email"><b>Email</b></label>
      	<input type="text" class="form-control" value='<%=r.getString("stu_email")%>' readOnly>
    </div>
    <div class="form-group">
      	<label for="stu_email"><b>Phone</b></label>
      	<input type="text" class="form-control" value='<%=r.getString("stu_phone")%>' readOnly>
    </div>
    <div class="form-group">
      	<label for="stu_occ"><b>Occupation</b></label>
      	<input type="text" class="form-control" value='<%=r.getString("stu_occ")%>' readOnly>
    </div>
    <div class="text-center">
		<a href="inst-students.jsp" class="btn btn-secondary">Close</a>
    </div>
</div>
<%@include file="admin-footer.jsp"%>