<%@include file="config.jsp"%>
<%@include file="inst-header.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String instEmail = session.getAttribute("instLogEmail").toString();
	String instid = session.getAttribute("instid").toString();
	
	ResultSet r = con.createStatement().executeQuery("select count(*) from course where inst_id="+instid);
	r.next();
	int totalcourse = r.getInt(1);
	r = con.createStatement().executeQuery("select count(*) from courseorder where course_id in (select course_id from course where inst_id="+instid+")");
	r.next();
	int totalsold = r.getInt(1);
	r = con.createStatement().executeQuery("select count(distinct stu_id) from courseorder");
	r.next();
	int totalstu = r.getInt(1);
%>
				<div class="col-sm-9 mt-5">
    				<div class="row mx-5 text-center">
      					<div class="col-sm-4 mt-5">
        					<div class="card text-white bg-danger mb-3" style="max-width: 18rem;">
          						<div class="card-header">Courses</div>
          						<div class="card-body">
            						<h4 class="card-title"><%=totalcourse%></h4>
            						<a class="btn text-white" href="inst-courses.jsp">View</a>
          						</div>
        					</div>
      					</div>
      					<div class="col-sm-4 mt-5">
        					<div class="card text-white bg-success mb-3" style="max-width: 18rem;">
          						<div class="card-header">Students</div>
          						<div class="card-body">
            						<h4 class="card-title"><%=totalstu%></h4>
            						<a class="btn text-white" href="inst-students.jsp">View</a>            							
          						</div>
        					</div>
      					</div>
      					<div class="col-sm-4 mt-5">
        					<div class="card text-white bg-info mb-3" style="max-width: 18rem;">
          						<div class="card-header">Sold</div>
          						<div class="card-body">
            						<h4 class="card-title"><%=totalsold%></h4>
            						<a class="btn text-white" href="instSalesReport.jsp">View</a>
          						</div>
        					</div>
      					</div>
    				</div>
    				<div class="mx-5 mt-5 text-center">
						<p class=" bg-dark text-white p-2">Course Ordered</p>
<%
	r = con.createStatement().executeQuery("select * from courseorder, course, student where courseorder.stu_id = student.stu_id and courseorder.course_id = course.course_id  and courseorder.course_id in (select course_id from course where inst_id="+instid+")");
	if(r.next()){
%>
						<table id="example" class="table table-striped table-bordered">
					    <thead>
					    <tr>
					      <th scope="col">Order ID</th>
					      <th scope="col">Order Date</th>
					      <th scope="col">Course</th>
					      <th scope="col">Student</th>
					      <th scope="col">Amount</th>
					      <th scope="col">Action</th>
					    </tr>
					    </thead>
					    <tbody>
<%
		do{
%>
						<tr>
							<th scope="row"><%=r.getString("order_id")%></th>
							<td><%=r.getString("order_date")%></td>
							<td><%=r.getString("course_name")%></td>
							<td><%=r.getString("stu_name")%></td>
							<td><%=r.getString("amount")%></td>
							<td><a href='instDashboard.jsp?del=<%=r.getInt("co_id")%>' class="btn btn-secondary" onclick="return confirm('Are you sure?')" title='Delete'><i class="far fa-trash-alt"></i></a></td>
						</tr>
<%
		}while(r.next());
%>
						</tbody>
						</table>
<%
	}
%>						
					</div>
				</div>
			</div>
		</div>
		<%@include file="admin-footer.jsp"%>

<%
	if(request.getParameter("del")!=null){
		con.createStatement().executeUpdate("DELETE FROM courseorder WHERE co_id = " + request.getParameter("del"));
		response.sendRedirect("instDashboard.jsp");
	}
%>

