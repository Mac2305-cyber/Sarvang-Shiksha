<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>

<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	
	ResultSet r = con.createStatement().executeQuery("SELECT * FROM course WHERE course_id = "+request.getParameter("id"));
	r.next();
	ResultSet t = con.createStatement().executeQuery("select * from instructor where inst_id="+r.getString("inst_id"));
	t.next();
%>
				<div class="col-sm-6 mt-5  mx-3 jumbotron">
  					<h3 class="text-center">Course Details</h3>
  					<form>
	    				<div class="form-group">
	      					<img src='<%=r.getString("course_img")%>' alt="courseimage" class="img-thumbnail" width="200" height="200">     	      			
	    				</div>
					    <div class="form-group">
					      	<label for="course_id"><b>Course ID</b></label>
					      	<input type="text" class="form-control" value='<%=r.getString("course_id")%>' readonly>
					    </div>
	    				<div class="form-group">
					   		<label for="course_name"><b>Course Name</b></label>
					      	<input type="text" class="form-control" value='<%=r.getString("course_name")%>' readonly>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_desc"><b>Course Description</b></label>
	      					<textarea class="form-control" row=2 readonly><%=r.getString("course_desc")%></textarea>
	    				</div>
	    				<div class="form-group">
					   		<label for="course_name"><b>Instructor</b></label>
					      	<input type="text" class="form-control" value='<%=t.getString("inst_name")%>' readonly>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_duration"><b>Course Duration (Months)</b></label>
	      					<input type="number" min=1 class="form-control" value='<%=r.getString("course_duration")%>' readonly>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_original_price"><b>Course Original Price</b></label>
	      					<input type="number" class="form-control" value='<%=r.getString("course_original_price")%>' readonly>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_price"><b>Course Selling Price</b></label>
	      					<input type="number" class="form-control" value='<%=r.getString("course_price")%>' readonly>
	    				</div>
	    				<div class="text-center">
	      					<a href="admin-courses.jsp" class="btn btn-secondary">Close</a>
	    				</div>
					</form>
				</div>
				<%@include file="admin-footer.jsp"%>
