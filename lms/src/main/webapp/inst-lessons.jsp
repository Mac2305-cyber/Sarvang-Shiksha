<%@include file="config.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String instid = session.getAttribute("instid").toString();
%>
<%@include file="inst-header.jsp"%>
<div class="col-sm-9 mt-5  mx-3">
	<form action="" class="mt-3 form-inline d-print-none">
    	<div class="form-group mr-3">
      		<label for="checkid"><b>Enter Course ID: </b></label>
      		<input type="text" class="form-control ml-3" id="checkid" name="checkid" onkeypress="isInputNumber(event)">
    	</div>
    	<button type="submit" class="btn btn-danger" name="search">Search</button>
  	</form>
  	
<%
	if(request.getParameter("search")!=null){
		ResultSet r = con.createStatement().executeQuery("SELECT * FROM course WHERE course_id = "+request.getParameter("checkid")+" and inst_id="+instid);
		if(r.next()){
%>
	<h3 class="mt-5 bg-dark text-white p-2">Course ID : <%=r.getString("course_id")%> Course Name: <%=r.getString("course_name")%></h3>
<%	
			ResultSet t = con.createStatement().executeQuery("SELECT * FROM lesson WHERE course_id = "+request.getParameter("checkid"));
%>
	<table class="table">
    <thead>
    <tr>
    	<th scope="col">Lesson ID</th>
        <th scope="col">Lesson Name</th>
        <th scope="col">Lesson Link</th>
        <th scope="col">Action</th>
	</tr>
    </thead>
    <tbody>
<%   
			int i = 1;
			while(t.next()){
%>				
	<tr>
    <th scope="row"><%=i++%></th>
   	<td><%=t.getString("lesson_name")%></td>
   	<td><%=t.getString("lesson_link")%></td>
   	<td>
   		<a href='editlesson.jsp?id=<%=t.getString("lesson_id")%>' class="btn btn-info mr-3" title="Edit"><i class="fas fa-pen"></i></a>  
		<a href='inst-lessons.jsp?id=<%=t.getString("lesson_id")%>' class="btn btn-secondary" title="Delete" onclick='return confirm("Are you sure?")' title='Delete'><i class="far fa-trash-alt"></i></a>
	</td>
    </tr>
<%
			}
%>    
	</tbody>
    </table>
    <div>
    	<a class="btn btn-danger box" href='addLesson.jsp?course_id=<%=r.getString("course_id")%>'><i class="fas fa-plus fa-2x"></i></a></div>
<%
		}
		else{
%>    
	<div class="alert alert-dark mt-4" role="alert">Course Not Found ! </div>
<%
		}
	}

	if(request.getParameter("id")!=null){
		con.createStatement().executeUpdate("DELETE FROM lesson WHERE lesson_id = "+request.getParameter("id"));
		response.sendRedirect("inst-lessons.jsp");
	} 
%>  
</div>
<%@include file="admin-footer.jsp"%>