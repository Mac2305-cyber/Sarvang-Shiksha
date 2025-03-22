<%@include file="config.jsp"%>
<%@include file="inst-header.jsp"%>

<%
	if(session.getAttribute("is_inst_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String msg = "";
	String instEmail = session.getAttribute("instLogEmail").toString();
	if(request.getParameter("instPassUpdatebtn")!=null){
		ResultSet r = con.createStatement().executeQuery("select * from instructor where inst_id="+session.getAttribute("instid")+" and inst_pass='"+request.getParameter("currentPass")+"'");
		if(r.next()){				
			String newPass = request.getParameter("newPass");
			String confirmPass = request.getParameter("confirmPass");
		
			if(newPass.equals(confirmPass)){
				con.createStatement().executeUpdate("UPDATE instructor SET inst_pass = '"+newPass+"' WHERE inst_id = '"+session.getAttribute("instid")+"'");
				msg = "<div class='alert alert-success col-sm-6 ml-5 mt-2' role='alert'>Password updated successfully</div>";
			}
			else{
				msg = "<div class='alert alert-danger col-sm-6 ml-5 mt-2' role='alert'>Passwords not matching</div>";
			}
		}
		else{
			msg = "<div class='alert alert-danger col-sm-6 ml-5 mt-2' role='alert'>Current password incorrect</div>";
		}
	}
%>
<div class="col-sm-9 mt-5">
	<div class="row">
    	<div class="col-sm-6">
       		<form class="mt-5 mx-5" method="post">
       			<%=msg.length()>0?msg:""%>
         		<div class="form-group">
           			<label for="inputnewpassword"><b>Current Password</b></label>
           			<input type="password" class="form-control" id="inputnewpassword" placeholder="Current Password" name="currentPass" required>
         		</div>
         		<div class="form-group">
           			<label for="inputnewpassword"><b>New Password</b></label>
           			<input type="password" class="form-control" id="inputnewpassword" placeholder="New Password" name="newPass" required>
         		</div>
         		<div class="form-group">
           			<label for="inputnewpassword"><b>Confirm Password</b></label>
           			<input type="password" class="form-control" id="inputnewpassword" placeholder="Confirm Password" name="confirmPass" required>
         		</div>
         		<button type="submit" class="btn btn-danger mr-4 mt-4" name="instPassUpdatebtn">Update</button>
         		<button type="reset" class="btn btn-secondary mt-4">Reset</button>
         	</form>
     	</div>
   	</div>
</div>
<%@include file="admin-footer.jsp"%>