<%@include file="config.jsp"%>
<%@include file="inst-header.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	
	ResultSet r = con.createStatement().executeQuery("SELECT * FROM course WHERE course_id = "+request.getParameter("id"));
	r.next();
%>
				<div class="col-sm-6 mt-5  mx-3 jumbotron">
  					<h3 class="text-center">Edit Course</h3>
  					<%=session.getAttribute("msg")!=null?session.getAttribute("msg"):""%>
  					
  					<form action="EditCourseServlet" method="POST" enctype="multipart/form-data">
					    <div class="form-group">
					      	<label for="course_id"><b>Course ID</b></label>
					      	<input type="text" class="form-control" id="course_id" name="course_id" value='<%=r.getString("course_id")%>' readonly>
					    </div>
	    				<div class="form-group">
					   		<label for="course_name"><b>Course Name</b></label>
					      	<input type="text" class="form-control" id="course_name" name="course_name" value='<%=r.getString("course_name")%>' required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_desc"><b>Course Description</b></label>
	      					<textarea class="form-control" id="course_desc" name="course_desc" row=2 required><%=r.getString("course_desc")%></textarea>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_duration"><b>Course Duration (Months)</b></label>
	      					<input type="number" min=1 class="form-control" id="course_duration" name="course_duration" value='<%=r.getString("course_duration")%>' required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_original_price"><b>Course Original Price</b></label>
	      					<input type="number" class="form-control" id="course_original_price" name="course_original_price" value='<%=r.getString("course_original_price")%>' min=0 required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_price"><b>Course Selling Price</b></label>
	      					<input type="number" class="form-control" id="course_price" name="course_price" value='<%=r.getString("course_price")%>' min=0 required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_img"><b>Course Image</b></label>
	      					<img src='<%=r.getString("course_img")%>' alt="courseimage" class="img-thumbnail" width="200" height="200">     	      			
	      					<input type="file" class="form-control-file" id="course_img" name="course_img">
	      					<input type="hidden" name="course_img" value='<%=r.getString("course_img")%>'>
	    				</div>
	    				<div class="text-center">
	      					<button type="submit" class="btn btn-danger" id="courseSubmitBtn" name="courseSubmitBtn">Submit</button>
	      					<a href="inst-courses.jsp" class="btn btn-secondary">Close</a>
	    				</div>
	    				<input type="hidden" name="inst_id" value='<%=session.getAttribute("instid")%>'>	    				
					</form>
				</div>
				<%@include file="admin-footer.jsp"%>
<%
	session.removeAttribute("msg");
%>				
