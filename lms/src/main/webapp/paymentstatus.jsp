<%@include file="config.jsp"%>
<%@include file="header.jsp"%>

<%
	if(session.getAttribute("is_login")==null){
		response.sendRedirect("loginorsignup.jsp");
		return;
	}
%>
<div class="container-fluid bg-dark">
	<div class="row">
    	<img src="image/coursebanner.jpg" alt="courses" style="height:300px; width:100%; object-fit:cover; box-shadow:10px;"/>
     </div> 
</div>
<div class="container">
	<h2 class="text-center my-4">Payment Status </h2>
    <form method="post">
		<div class="form-group row">
        	<label class="offset-sm-3 col-form-label">Order ID: </label>
        	<div>
          		<input class="form-control mx-3" id="ORDER_ID" tabindex="1" maxlength="20" size="20" name="ORDER_ID" autocomplete="off" value="" pattern="^\d{8}$" required>
        	</div>
        	<div>
          		<input class="btn btn-primary mx-4" value="View" type="submit" name="submit">
        	</div>
      	</div>
	</form>
</div>
<div class="container">
<%
	if(request.getParameter("submit")!=null){
		String sql = "SELECT * from courseorder, course, student where course.course_id = courseorder.course_id and courseorder.stu_id = student.stu_id and order_id="+request.getParameter("ORDER_ID")+" and stu_email='"+session.getAttribute("stuLogEmail")+"'";
		System.out.println(sql);
		
		ResultSet r = con.createStatement().executeQuery(sql);
		
		if(r.next()){
%>
	<div class="row justify-content-center">
    	<div class="col-auto">
        	<h2 class="text-center">Payment Receipt</h2>
            <table class="table table-bordered">
            <tbody>
            <tr>
               	<th><label>Order ID</label></th>
                <td><%=r.getString("order_id")%></td>
               	<th><label>Order Date</label></th>
                <td><%=r.getString("order_date")%></td>
            </tr>
            <tr>
               	<th><label>Course Name</label></th>
            	<td><%=r.getString("course_name")%></td>
                <th><label>Amount Paid</label></th>
                <td><%=r.getString("course_price")%></td>
           	</tr>
			<tr>
				<th><label>Status</label></th>
            	<td><%=r.getString("status")%></td>
            </tr>
			<tr>
            	<td></td>
            	<td><button class="btn btn-primary" onclick="javascript:window.print();">Print Receipt</button></td>
			</tr>
            </tbody>
			</table>
		</div>
   	</div>
<%
		}
	}
%>   	
</div>  
<div class="mt-5">
	<%@include file="contact.jsp"%>
</div>
<%@include file="footer.jsp"%>