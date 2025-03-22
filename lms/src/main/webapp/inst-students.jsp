<%@include file="config.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<%@include file="inst-header.jsp"%>
<div class="col-sm-9 mt-5">
	<p class=" bg-dark text-white p-2">List of Students</p>
	<table id="example" class="table table-striped table-bordered">
	<thead>
	<tr>
		<th scope="col">Student ID</th>
	    <th scope="col">Name</th>
	    <th scope="col">Email</th>
	    <th scope="col">Action</th>
	</tr>
	</thead>
	<tbody>
<%
	ResultSet r = con.createStatement().executeQuery("select * from student where stu_id in (select stu_id from courseorder where course_id in (select course_id from course where inst_id="+session.getAttribute("instid")+"))");
	while(r.next()){
%>	
	<tr>
		<th scope="row"><%=r.getString("stu_id")%></th>
       	<td><%=r.getString("stu_name")%></td>
        <td><%=r.getString("stu_email")%></td>
       	<td>
       		<a href='inst-viewstudent.jsp?id=<%=r.getString("stu_id")%>' class="btn btn-info mr-3" title="View"><i class="fas fa-eye"></i></a>  
     	</td>
  	</tr>
<%
	}
%>  	
	</tbody>
	</table>
<%@include file="admin-footer.jsp"%>