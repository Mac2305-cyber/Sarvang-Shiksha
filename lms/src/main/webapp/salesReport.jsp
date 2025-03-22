<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>

<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<div class="col-sm-9 mt-5">
	<form action="" method="POST" class="d-print-none">
    	<div class="form-row">
        	<div class="form-group col-md-2">
            	<input type="date" class="form-control" id="startdate" name="startdate" required>
          	</div> 
          	<span> to </span>
          	<div class="form-group col-md-2">
            	<input type="date" class="form-control" id="enddate" name="enddate" required>
          	</div>
          	<div class="form-group">
            	<input type="submit" class="btn btn-secondary" name="searchsubmit" value="Search">
          	</div>
		</div>
	</form>

<%
	if(request.getParameter("searchsubmit")!=null){
		String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        ResultSet r = con.createStatement().executeQuery("SELECT * FROM courseorder, student, course WHERE courseorder.stu_id = student.stu_id and courseorder.course_id = course.course_id and order_date BETWEEN '"+startdate+"' AND '"+enddate+"'");
		if(r.next()){
%>			
	<p class=" bg-dark text-white p-2 mt-4">Details</p>
    <table id="example" class="table table-striped table-bordered">
    <thead>
    <tr>
    	<th scope="col">Order ID</th>
        <th scope="col">Course</th>
        <th scope="col">Student</th>
        <th scope="col">Payment Status</th>
        <th scope="col">Order Date</th>
		<th scope="col">Amount</th>
  	</tr>
    </thead>
    <tbody>
<%
			do{
%>    
	<tr>
    	<th scope="row"><%=r.getString("order_id")%></th>
		<td><%=r.getString("course_name")%></td>
        <td><%=r.getString("stu_name")%></td>
        <td><%=r.getString("status")%></td>
        <td><%=r.getString("order_date")%></td>
        <td><%=r.getString("amount")%></td>
	</tr>
<%
			}while(r.next());
%>  	
	</tbody>
    </table>
    <table>
    <tr>
    	<td><form class="d-print-none"><input class="btn btn-danger" type="submit" value="Print" onClick="window.print()"></form></td>
	</tr>
    </table>
<%
		}
		else{
%>    
	<div class='alert alert-warning col-sm-6 ml-5 mt-2' role='alert'> No Records Found ! </div>";
<%
		}
	}
%>	
</div>
<%@include file="admin-footer.jsp"%>