<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>
<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
				<div class="col-sm-9 mt-5">
					<p class=" bg-dark text-white p-2">List of Instructors</p>
<%
	ResultSet result = con.createStatement().executeQuery("select * from instructor");
	if(result.next()){
%>	
					<table id="example" class="table table-striped table-bordered">
				    <thead>
				    <tr>
				        <th scope="col">ID</th>
				        <th scope="col">Name</th>
				        <th scope="col">Email</th>
				        <th scope="col">Status</th>
				        <th scope="col">Action</th>
				   	</tr>
				    </thead>
				    <tbody>
<%
		do{
%>    
					<tr>
						<th scope="row"><%=result.getString("inst_id")%></th>
				       	<td><%=result.getString("inst_name")%></td>
						<td><%=result.getString("inst_email")%></td>
						<td><%=result.getInt("inst_is_active")==0?"Inactive":"Active"%></td>
						<td>
							<a href='editinst.jsp?id=<%=result.getString("inst_id")%>' class="btn btn-info mr-3" title="View"><i class="fas fa-eye"></i></a>  
				          	<a href='admin-inst.jsp?del=<%=result.getString("inst_id")%>' class="btn btn-secondary" onclick="return confirm('Are you sure?')" title="Delete"><i class="far fa-trash-alt"></i></a>
				          	<a href='admin-inst.jsp?sid=<%=result.getString("inst_id")%>&status=<%=result.getString("inst_is_active")%>' class="btn btn-danger" title='<%=result.getInt("inst_is_active")==0?"Activate":"Deactivate"%>'><i class='fa <%=result.getInt("inst_is_active")==0?"fa-check":"fa-times"%>'></i></a>
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
		con.createStatement().executeUpdate("DELETE FROM instructor WHERE inst_id = "+request.getParameter("del"));
		response.sendRedirect("admin-inst.jsp");
	}
	if(request.getParameter("sid")!=null){
		int status = Integer.parseInt(request.getParameter("status"));
		status = status==0?1:0;
		con.createStatement().executeUpdate("UPDATE instructor set inst_is_active="+status+" where inst_id = "+request.getParameter("sid"));
		response.sendRedirect("admin-inst.jsp");
	}
%>
				</div>
 			</div>
		</div>
		<%@include file="admin-footer.jsp"%>