<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>
<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
				<div class="col-sm-9 mt-5">
					<p class=" bg-dark text-white p-2">List of Courses</p>
<%
	ResultSet result = con.createStatement().executeQuery("select * from course, instructor where course.inst_id = instructor.inst_id");
	if(result.next()){
%>	
					<table id="example" class="table table-striped table-bordered">
				    <thead>
				    <tr>
				        <th scope="col">Course ID</th>
				        <th scope="col">Name</th>
				        <th scope="col">Author</th>
				        <th scope="col">Action</th>
				   	</tr>
				    </thead>
				    <tbody>
<%
		do{
%>    
					<tr>
						<th scope="row"><%=result.getString("course_id")%></th>
				       	<td><%=result.getString("course_name")%></td>
						<td><a href="editinst.jsp?id=<%=result.getString("course.inst_id")%>" class="btn btn-danger"><%=result.getString("inst_name")%></a></td>
						<td>
							<a href='admineditcourse.jsp?id=<%=result.getString("course_id")%>' class="btn btn-info mr-3" title="Edit"><i class="fas fa-eye"></i></a>  
				          	<a href='admin-courses.jsp?del=<%=result.getString("course_id")%>' class="btn btn-secondary" onclick="return confirm('Are you sure?')" title="Delete"><i class="far fa-trash-alt"></i></a>
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
		response.sendRedirect("admin-courses.jsp");
	}
%>
				</div>
 			</div>
		</div>
		<%@include file="admin-footer.jsp"%>