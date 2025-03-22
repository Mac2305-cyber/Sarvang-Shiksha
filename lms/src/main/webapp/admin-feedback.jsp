<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>
<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
				<div class="col-sm-9 mt-5">
					<p class=" bg-dark text-white p-2">List of Feedbacks</p>
<%
	ResultSet result = con.createStatement().executeQuery("select * from feedback, student where feedback.stu_id = student.stu_id");
	if(result.next()){
%>	
					<table id="example" class="table table-striped table-bordered">
				    <thead>
				    <tr>
				        <th scope="col">ID</th>
				        <th scope="col">Student Name</th>
				        <th scope="col">Feedback</th>
				        <th scope="col">Action</th>
				   	</tr>
				    </thead>
				    <tbody>
<%
		do{
%>    
					<tr>
						<th scope="row"><%=result.getString("f_id")%></th>
				       	<td><%=result.getString("stu_name")%></td>
						<td><%=result.getString("f_content")%></td>
						<td>
				          	<a href='admin-feedback.jsp?del=<%=result.getString("f_id")%>' class="btn btn-secondary" onclick="return confirm('Are you sure?')" title="Delete"><i class="far fa-trash-alt"></i></a>
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
		con.createStatement().executeUpdate("DELETE FROM feedback WHERE f_id = "+request.getParameter("del"));
		response.sendRedirect("admin-feedback.jsp");
	}	
%>
				</div>
 			</div>
		</div>
		<%@include file="admin-footer.jsp"%>