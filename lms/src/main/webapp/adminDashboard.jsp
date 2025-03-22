<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>

<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String adminEmail = session.getAttribute("adminLogEmail").toString();
	ResultSet r = con.createStatement().executeQuery("select count(*) from course");
	r.next();
	int totalcourse = r.getInt(1);
	r = con.createStatement().executeQuery("select count(*) from courseorder");
	r.next();
	int totalsold = r.getInt(1);
	r = con.createStatement().executeQuery("select count(*) from student");
	r.next();
	int totalstu = r.getInt(1);
	r = con.createStatement().executeQuery("select sum(amount) from donation");
	r.next();
	int totaldonation = r.getInt(1);
	r = con.createStatement().executeQuery("select count(*) from instructor");
	r.next();
	int totalinst = r.getInt(1);	
	r = con.createStatement().executeQuery("select count(*) from scholarship");
	r.next();
	int totalscholarships = r.getInt(1);		
%>
				<div class="col-sm-9 mt-5">
    				<div class="row mx-5 text-center">
      					<div class="col-sm-4 mt-5">
        					<div class="card text-white bg-success mb-3" style="max-width: 18rem;">
          						<div class="card-header">Instructors</div>
          						<div class="card-body">
            						<h4 class="card-title"><%=totalinst%></h4>
            						<a class="btn text-white" href="admin-inst.jsp">View</a>
          						</div>
        					</div>
      					</div>
      					<div class="col-sm-4 mt-5">
        					<div class="card text-white bg-danger mb-3" style="max-width: 18rem;">
          						<div class="card-header">Courses</div>
          						<div class="card-body">
            						<h4 class="card-title"><%=totalcourse%></h4>
            						<a class="btn text-white" href="admin-courses.jsp">View</a>
          						</div>
        					</div>
      					</div>
      					<div class="col-sm-4 mt-5">
        					<div class="card text-white bg-success mb-3" style="max-width: 18rem;">
          						<div class="card-header">Students</div>
          						<div class="card-body">
            						<h4 class="card-title"><%=totalstu%></h4>
            						<a class="btn text-white" href="admin-students.jsp">View</a>            							
          						</div>
        					</div>
      					</div>
      					<div class="col-sm-4 mt-5">
        					<div class="card text-white bg-info mb-3" style="max-width: 18rem;">
          						<div class="card-header">Sold</div>
          						<div class="card-body">
            						<h4 class="card-title"><%=totalsold%></h4>
            						<a class="btn text-white" href="salesReport.jsp">View</a>
          						</div>
        					</div>
      					</div>
      					<div class="col-sm-4 mt-5">
        					<div class="card text-white bg-warning mb-3" style="max-width: 18rem;">
          						<div class="card-header">Donation</div>
          						<div class="card-body">
            						<h4 class="card-title">&#8377; <%=totaldonation%></h4>
            						<a class="btn text-white" href="admin-donations.jsp">View</a>
          						</div>
        					</div>
      					</div>
      					<div class="col-sm-4 mt-5">
        					<div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
          						<div class="card-header">Scholarships</div>
          						<div class="card-body">
            						<h4 class="card-title"><%=totalscholarships%></h4>
            						<a class="btn text-white" href="admin-scholarships.jsp">View</a>
          						</div>
        					</div>
      					</div>
    				</div>
    				<div class="mx-5 mt-5 text-center">
						<p class=" bg-dark text-white p-2">Course Ordered</p>
<%
	r = con.createStatement().executeQuery("select * from courseorder, course, student where courseorder.stu_id = student.stu_id and courseorder.course_id = course.course_id");
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