<%@include file="config.jsp"%>
<%@include file="inst-header.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
				<div class="col-sm-6 mt-5  mx-3 jumbotron">
  					<h3 class="text-center">Add New Course</h3>
  					<%=session.getAttribute("msg")!=null?session.getAttribute("msg"):""%>
  					
  					<form action="AddCourseServlet" method="POST" enctype="multipart/form-data">
	    				<div class="form-group">
					   		<label for="course_name"><b>Course Name</b></label>
					      	<input type="text" class="form-control" id="course_name" name="course_name" required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_desc"><b>Course Description</b></label>
	      					<textarea class="form-control" id="course_desc" name="course_desc" row=2 required></textarea>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_duration"><b>Course Duration</b></label>
	      					<input type="number" min=1 class="form-control" id="course_duration" name="course_duration" required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_original_price"><b>Course Original Price</b></label>
	      					<input type="number" class="form-control" id="course_original_price" name="course_original_price" min=0 required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_price"><b>Course Selling Price</b></label>
	      					<input type="text" class="form-control" id="course_price" name="course_price" min=0 required>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_img"><b>Course Image</b></label>
	      					<input type="file" class="form-control-file" id="course_img" name="course_img" required>
	    				</div>
	    				<div class="text-center">
	      					<button type="submit" class="btn btn-danger" id="courseSubmitBtn" name="courseSubmitBtn">Submit</button>
	      					<a href="admin-courses.jsp" class="btn btn-secondary">Close</a>
	    				</div>
						<input type="hidden" name="instid" value='<%=session.getAttribute("instid")%>'>
					</form>
				</div>
				<%@include file="admin-footer.jsp"%>
<%
	session.removeAttribute("msg");
%>				