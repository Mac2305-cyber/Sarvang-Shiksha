<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>

<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	ResultSet r = con.createStatement().executeQuery("select * from lesson where lesson_id="+request.getParameter("id"));
	r.next();
%>
<div class="col-sm-6 mt-5  mx-3 jumbotron">
	<h3 class="text-center">Lesson Details</h3>
	<form>
	    <div class="form-group">
			<label for="lesson_id"><b>Lesson ID</b></label>
	      	<input type="text" class="form-control" id="lesson_id" name="lesson_id" value='<%=r.getString("lesson_id")%>' readonly>
	    </div>
	    <div class="form-group">
			<label for="lesson_name"><b>Lesson Name</b></label>
	      	<input type="text" class="form-control" id="lesson_name" name="lesson_name" value='<%=r.getString("lesson_name")%>' readOnly>
	    </div>
	    <div class="form-group">
	      	<label for="lesson_desc"><b>Lesson Description</b></label>
	      	<textarea class="form-control" id="lesson_desc" name="lesson_desc" row=2 readOnly><%=r.getString("lesson_desc")%></textarea>
	    </div>
	    <div class="form-group">
			<label for="course_id"><b>Course ID</b></label>
	      	<input type="text" class="form-control" id="course_id" name="course_id" value='<%=r.getString("course_id")%>' readonly>
	    </div>
	    <div class="form-group">
	      	<label for="course_name"><b>Course Name</b></label>
	      	<input type="text" class="form-control" id="course_name" name="course_name" value='<%=r.getString("course_name")%>' readonly>
	    </div>
	    <div class="form-group">
			<label for="lesson_link"><b>Lesson Link</b></label>
	      	<div class="embed-responsive embed-responsive-16by9">
	       	<iframe class="embed-responsive-item" src='<%=r.getString("lesson_link")%>' allowfullscreen></iframe>
	   	</div>	
		<div class="text-center">
	    	<a href="admin-lessons.jsp" class="btn btn-secondary">Close</a>
	    </div>
	</form>
</div>

<%@include file="admin-footer.jsp"%>