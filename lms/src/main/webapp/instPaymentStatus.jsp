<%@include file="config.jsp"%>
<%@include file="inst-header.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<div class="col-sm-9 mt-5">
    <form method="post">
    	<div class="form-group row">
      		<label class="offset-sm-3 col-form-label"><b>Order ID:</b></label>
		  	<div>
			    <input class="form-control mx-3" id="ORDER_ID" tabindex="1" maxlength="20" size="20" name="ORDER_ID" autocomplete="off">
			</div>
		</div>
        <div style="padding: 10px;">
			<input class="btn btn-primary mx-4" value="View" type="submit" name="submit">        
        </div>
	</form>

<%
	if(request.getParameter("submit")!=null){
        String sql = "SELECT * FROM courseorder, course where courseorder.course_id = course.course_id and inst_id="+session.getAttribute("instid")+" and order_id="+request.getParameter("ORDER_ID");
        ResultSet r = con.createStatement().executeQuery(sql);
        
        if(r.next()){
%>
	<div class="row justify-content-center">
		<div class="col-auto">
	    	<h2 class="text-center">Payment Receipt</h2>
	        <table class="table table-bordered">
	        <tbody>
	        <tr>
	        	<td><label>Order ID</label></td>
	            <td><%=r.getString("order_id")%></td>
	        </tr>
	        <tr>
	        	<td><label>Order Date</label></td>
	            <td><%=r.getString("order_date")%></td>
	        </tr>
	        <tr>
	        	<td><label>Amount</label></td>
	            <td><%=r.getString("amount")%></td>
	        </tr>
			<tr>
	        	<td><label>Status</label></td>
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
		else{
%>
	<h3>Order ID <%=request.getParameter("ORDER_ID")%> not found.</h3>
<%
		}
	}       
%>
</div>
<%@include file="admin-footer.jsp"%>


