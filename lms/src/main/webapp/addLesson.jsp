<%@include file="config.jsp"%>
<%@include file="inst-header.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	
	ResultSet r = con.createStatement().executeQuery("select * from course where course_id="+request.getParameter("course_id"));
	r.next();
%>
<div class="col-sm-6 mt-5  mx-3 jumbotron">
	<h3 class="text-center">Add New Lesson</h3>
  	<form method="POST" action="AddLessonServlet" enctype="multipart/form-data">
  		<%=session.getAttribute("msg")!=null?session.getAttribute("msg"):""%>
    	<div class="form-group">
      		<label for="course_id"><b>Course ID</b></label>
      		<input type="text" class="form-control" id="course_id" name="course_id" value ='<%=r.getString("course_id")%>' readonly>
    	</div>
    	<div class="form-group">
      		<label for="course_name"><b>Course Name</b></label>
      		<input type="text" class="form-control" id="course_name" name="course_name" value ='<%=r.getString("course_name")%>' readonly>
    	</div>
    	<div class="form-group">
      		<label for="lesson_name"><b>Lesson Name</b></label>
      		<input type="text" class="form-control" id="lesson_name" name="lesson_name" required>
    	</div>
    	<div class="form-group">
      		<label for="lesson_desc"><b>Lesson Description</b></label>
      		<textarea class="form-control" id="lesson_desc" name="lesson_desc" row=2 required></textarea>
    	</div>
    	<div class="form-group">
      		<label for="lesson_link"><b>Lesson Video Link</b></label>
      		<input type="file" class="form-control-file" id="lesson_link" name="lesson_link" required>
    	</div>
    	<div class="text-center">
      		<button type="submit" class="btn btn-danger" id="lessonSubmitBtn" name="lessonSubmitBtn">Submit</button>
      		<a href="inst-lessons.jsp" class="btn btn-secondary">Close</a>
    	</div>
  	</form>
</div>
<%@include file="admin-footer.jsp"%>
<%
	session.removeAttribute("msg");
%>