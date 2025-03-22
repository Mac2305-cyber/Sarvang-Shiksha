<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>
<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
				<div class="col-sm-9 mt-5">
					<p class=" bg-dark text-white p-2">List of Scholarships</p>
<%
	ResultSet result = con.createStatement().executeQuery("select * from scholarship");
	if(result.next()){
%>	
					<table id="example" class="table table-striped table-bordered">
				    <thead>
				    <tr>
				        <th>ID</th>
				        <th>Name</th>
				        <th>Eligibility</th>
				        <th>Syllabus</th>
				        <th>Website</th>
				        <th width="150">Action</th>
				   	</tr>
				    </thead>
				    <tbody>
<%
		do{
%>    
					<tr>
						<th><%=result.getString("id")%></th>
				       	<td><%=result.getString("name")%></td>
						<td><%=result.getString("eligibility")%></td>
						<td><%=result.getString("syllabus")%></td>
						<td><a href='<%=result.getString("website")%>'><%=result.getString("website")%></a></td>
						<td>
							<a href='editscholarship.jsp?id=<%=result.getString("id")%>' class="btn btn-info mr-3" title="Edit"><i class="fas fa-pen"></i></a>  
				          	<a href='admin-scholarships.jsp?del=<%=result.getString("id")%>' class="btn btn-secondary" onclick="return confirm('Are you sure?')" title="Delete"><i class="far fa-trash-alt"></i></a>
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
		con.createStatement().executeUpdate("DELETE FROM scholarship WHERE id = "+request.getParameter("del"));
		response.sendRedirect("admin-scholarships.jsp");
	}
%>
				</div>
 			</div>
 			<div><a class="btn btn-danger box" href="addScholarship.jsp" title="Add scholarship"><i class="fas fa-plus fa-2x"></i></a></div>
		</div>
		<%@include file="admin-footer.jsp"%>