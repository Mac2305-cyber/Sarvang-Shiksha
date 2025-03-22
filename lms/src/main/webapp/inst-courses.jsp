<%@include file="config.jsp"%>
<%@include file="inst-header.jsp"%>
<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
				<div class="col-sm-9 mt-5">
					<p class=" bg-dark text-white p-2">List of Courses</p>
<%
	ResultSet result = con.createStatement().executeQuery("select * from course where inst_id = "+session.getAttribute("instid"));
	if(result.next()){
%>	
					<table id="example" class="table table-striped table-bordered">
				    <thead>
				    <tr>
				        <th width="50">Course ID</th>
				        <th width="250">Name</th>
				        <th>Description</th>
				        <th width="150">Action</th>
				   	</tr>
				    </thead>
				    <tbody>
<%
		do{
%>    
					<tr>
						<th scope="row"><%=result.getString("course_id")%></th>
				       	<td><%=result.getString("course_name")%></td>
						<td><%=result.getString("course_desc")%></td>
						<td>
							<a href='editcourse.jsp?id=<%=result.getString("course_id")%>' class="btn btn-info mr-3" title="Edit"><i class="fas fa-pen"></i></a>  
				          	<a href='inst-courses.jsp?del=<%=result.getString("course_id")%>' class="btn btn-secondary" onclick="return confirm('Are you sure?')" title="Delete"><i class="far fa-trash-alt"></i></a>
				      	</td>
					</tr>
<%
		}while(result.next());
%>	
					</tbody>
				    </table>
<%
	}

	if(request.getParameter("del")!=null){
		con.createStatement().executeUpdate("DELETE FROM course WHERE course_id = "+request.getParameter("del"));
		response.sendRedirect("inst-courses.jsp");
	}
%>
				</div>
 			</div>
 			<div><a class="btn btn-danger box" href="addCourse.jsp" title="Add course"><i class="fas fa-plus fa-2x"></i></a></div>
		</div>
		<%@include file="admin-footer.jsp"%>