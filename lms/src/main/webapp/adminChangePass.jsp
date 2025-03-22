<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>

<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String msg = "";
	String adminEmail = session.getAttribute("adminLogEmail").toString();
	if(request.getParameter("adminPassUpdatebtn")!=null){
		String currentPass = request.getParameter("currentPass");
		String newPass = request.getParameter("newPass");
		String confirmPass = request.getParameter("confirmPass");
		
		ResultSet r = con.createStatement().executeQuery("select * from admin where admin_pass='"+currentPass+"' and admin_email='"+adminEmail+"'");
		if(r.next()){
			if(newPass.equals(confirmPass)){
				con.createStatement().executeUpdate("UPDATE admin SET admin_pass = '"+newPass+"' WHERE admin_email = '"+adminEmail+"'");
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
       			<%=msg%>
         		<div class="form-group">
           			<label for="inputEmail"><b>Current Password</b></label>
           			<input type="password" class="form-control" id="inputEmail" placeholder="Current Password" name="currentPass" required>
         		</div>
         		<div class="form-group">
           			<label for="inputnewpassword"><b>New Password</b></label>
           			<input type="password" class="form-control" id="inputnewpassword" placeholder="New Password" name="newPass" required>
         		</div>
         		<div class="form-group">
           			<label for="inputnewpassword"><b>Confirm Password</b></label>
           			<input type="password" class="form-control" id="inputnewpassword" placeholder="Confirm Password" name="confirmPass" required>
         		</div>
         		<button type="submit" class="btn btn-danger mr-4 mt-4" name="adminPassUpdatebtn">Update</button>
         		<button type="reset" class="btn btn-secondary mt-4">Reset</button>
         	</form>
     	</div>
   	</div>
</div>
<%@include file="admin-footer.jsp"%>