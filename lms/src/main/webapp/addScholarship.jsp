<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>

<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String msg = "";
	
	if(request.getParameter("submit")!=null){
		String name = request.getParameter("name");
		String eligilility = request.getParameter("eligibility");
		String syllabus = request.getParameter("syllabus");
		String website = request.getParameter("website");
		
		PreparedStatement ps = con.prepareStatement("insert into scholarship(name, eligibility, syllabus, website) values(?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, eligilility);
		ps.setString(3, syllabus);
		ps.setString(4, website);
		ps.executeUpdate();
		
		msg = "Scholarship added successfully";
	}
%>
				<div class="col-sm-6 mt-5  mx-3 jumbotron">
  					<h3 class="text-center">Add New Scholarship</h3>
  					<%if(msg.length()>0){%><div class="alert alert-danger" role="alert"><%=msg%></span></div><%}%>
  					
  					<form method="POST">
	    				<div class="form-group">
					   		<label for="course_name"><b>Scholarship Name</b></label>
					      	<input type="text" class="form-control" name="name" required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_desc"><b>Eligibility</b></label>
	      					<input type="text" class="form-control" name="eligibility" required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_duration"><b>Syllabus</b></label>
	      					<input type="text" class="form-control" name="syllabus" required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_original_price"><b>Website</b></label>
	      					<input type="text" class="form-control" name="website" required>
	    				</div>
	    				<div class="text-center">
	      					<button type="submit" class="btn btn-danger" id="courseSubmitBtn" name="submit">Submit</button>
	      					<a href="admin-scholarships.jsp" class="btn btn-secondary">Close</a>
	    				</div>
					</form>
				</div>
				<%@include file="admin-footer.jsp"%>
