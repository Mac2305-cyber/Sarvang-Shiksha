<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>

<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String msg = "";
	
	if(request.getParameter("submit")!=null){
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String eligilility = request.getParameter("eligibility");
		String syllabus = request.getParameter("syllabus");
		String website = request.getParameter("website");
		
		PreparedStatement ps = con.prepareStatement("update scholarship set name=?, eligibility=?, syllabus=?, website=? where id=?");
		ps.setString(1, name);
		ps.setString(2, eligilility);
		ps.setString(3, syllabus);
		ps.setString(4, website);
		ps.setString(5, id);
		ps.executeUpdate();
		
		msg = "Scholarship updated successfully";
	}
	
	ResultSet r = con.createStatement().executeQuery("select * from scholarship where id="+request.getParameter("id"));
	r.next();
%>
				<div class="col-sm-6 mt-5  mx-3 jumbotron">
  					<h3 class="text-center">Edit Scholarship</h3>
  					<%if(msg.length()>0){%><div class="alert alert-danger" role="alert"><%=msg%></div><%} %>
  					
  					<form method="POST">
	    				<div class="form-group">
					   		<label for="course_name"><b>ID</b></label>
					      	<input type="text" class="form-control" name="id" value='<%=r.getString("id")%>' readOnly>
	    				</div>
	    				<div class="form-group">
					   		<label for="course_name"><b>Scholarship Name</b></label>
					      	<input type="text" class="form-control" name="name" value='<%=r.getString("name")%>' required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_desc"><b>Eligibility</b></label>
	      					<input type="text" class="form-control" name="eligibility" value='<%=r.getString("eligibility")%>' required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_duration"><b>Syllabus</b></label>
	      					<input type="text" class="form-control" name="syllabus" value='<%=r.getString("syllabus")%>' required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_original_price"><b>Website</b></label>
	      					<input type="text" class="form-control" name="website" value='<%=r.getString("website")%>' required>
	    				</div>
	    				<div class="text-center">
	      					<button type="submit" class="btn btn-danger" id="courseSubmitBtn" name="submit">Submit</button>
	      					<a href="admin-scholarships.jsp" class="btn btn-secondary">Close</a>
	    				</div>
					</form>
				</div>
				<%@include file="admin-footer.jsp"%>
