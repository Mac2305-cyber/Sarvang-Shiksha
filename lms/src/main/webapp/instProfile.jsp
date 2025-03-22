<%@include file="config.jsp"%>
<%@include file="inst-header.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	
	ResultSet r = con.createStatement().executeQuery("SELECT * FROM instructor WHERE inst_id = "+session.getAttribute("instid"));
	r.next();
%>
				<div class="col-sm-6 mt-5  mx-3 jumbotron">
  					<h3 class="text-center">Edit Course</h3>
  					<%=session.getAttribute("msg")!=null?session.getAttribute("msg"):""%>
  					
  					<form action="EditInstructorServlet" method="POST" enctype="multipart/form-data">
					    <div class="form-group">
					      	<label for="course_id"><b>ID</b></label>
					      	<input type="text" class="form-control" name="inst_id" value='<%=r.getString("inst_id")%>' readonly>
					    </div>
	    				<div class="form-group">
					   		<label for="course_name"><b>Name</b></label>
					      	<input type="text" class="form-control" name="inst_name" value='<%=r.getString("inst_name")%>' required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_duration"><b>Email</b></label>
	      					<input type="email" class="form-control" name="inst_email" value='<%=r.getString("inst_email")%>' required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_original_price"><b>Phone</b></label>
	      					<input type="text" class="form-control" name="inst_phone" value='<%=r.getString("inst_phone")%>' maxlength=10 pattern="^\d{10}$" required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_price"><b>Qualification</b></label>
	      					<input type="text" class="form-control" name="inst_qual" value='<%=r.getString("inst_qual")%>' required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_price"><b>Occupation</b></label>
	      					<input type="text" class="form-control" name="inst_occ" value='<%=r.getString("inst_occ")%>' required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_img"><b>Photo</b></label>
	      					<img src='<%=r.getString("inst_img")%>' alt="courseimage" class="img-thumbnail" width="200" height="200">     	      			
	      					<input type="file" class="form-control-file" name="inst_img">
	      					<input type="hidden" name="inst_img" value='<%=r.getString("inst_img")%>'>
	    				</div>
	    				<div class="text-center">
	      					<button type="submit" class="btn btn-danger" id="courseSubmitBtn" name="courseSubmitBtn">Submit</button>
	      					<a href="instDashboard.jsp" class="btn btn-secondary">Close</a>
	    				</div>
					</form>
				</div>
				<%@include file="admin-footer.jsp"%>
<%
	session.removeAttribute("msg");
%>				
