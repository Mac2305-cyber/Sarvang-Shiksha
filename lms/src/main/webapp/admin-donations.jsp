<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>
<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
				<div class="col-sm-9 mt-5">
					<p class=" bg-dark text-white p-2">List of Donations</p>
<%
	ResultSet result = con.createStatement().executeQuery("select * from donation");
	if(result.next()){
%>	
					<table id="example" class="table table-striped table-bordered">
				    <thead>
				    <tr>
				        <th scope="col">ID</th>
				        <th scope="col">Name</th>
				        <th scope="col">Phone</th>
				        <th scope="col">Email</th>
				        <th scope="col">Date</th>
				        <th scope="col">Amount</th>
				   	</tr>
				    </thead>
				    <tbody>
<%
		do{
%>    
					<tr>
						<th scope="row"><%=result.getString("id")%></th>
				       	<td><%=result.getString("name")%></td>
						<td><%=result.getString("phone")%></td>
						<td><%=result.getString("email")%></td>
						<td><%=result.getString("donate_date")%></td>
						<td><%=result.getString("amount")%></td>
					</tr>
<%
		}while(result.next());
%>	
					</tbody>
				    </table>
<%
	}
%>
				</div>
 			</div>
		</div>
		<%@include file="admin-footer.jsp"%>