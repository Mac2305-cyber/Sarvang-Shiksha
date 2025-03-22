<%@include file="config.jsp"%>
<%@include file="admin-header.jsp"%>

<%
	if(session.getAttribute("is_admin_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	
	ResultSet r = con.createStatement().executeQuery("SELECT * FROM instructor WHERE inst_id = "+request.getParameter("id"));
	r.next();
%>
				<div class="col-sm-6 mt-5  mx-3 jumbotron">
  					<h3 class="text-center">Instructor Details</h3>
  					
  					<form>
	    				<div class="form-group">
	      					<img src='<%=r.getString("inst_img")%>' alt="courseimage" class="img-thumbnail" width="200" height="200">     	      			
	    				</div>
					    <div class="form-group">
					      	<label for="course_id"><b>Instructor ID</b></label>
					      	<input type="text" class="form-control" value='<%=r.getString("inst_id")%>' readonly>
					    </div>
	    				<div class="form-group">
					   		<label for="course_name"><b>Name</b></label>
					      	<input type="text" class="form-control" value='<%=r.getString("inst_name")%>' readonly>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_desc"><b>Email</b></label>
	      					<input type="text" class="form-control" value='<%=r.getString("inst_email")%>' readonly>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_duration"><b>Phone</b></label>
	      					<input type="text" class="form-control" value='<%=r.getString("inst_phone")%>' readonly>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_original_price"><b>Qualification</b></label>
	      					<input type="text" class="form-control" value='<%=r.getString("inst_qual")%>' readonly>
	    				</div>
	    				<div class="form-group">
	      					<label for="course_price"><b>Occupation</b></label>
	      					<input type="text" class="form-control" value='<%=r.getString("inst_occ")%>' readOnly>
	    				</div>
	    				<div class="text-center">
	      					<a href="admin-inst.jsp" class="btn btn-secondary">Close</a>
	    				</div>
					</form>
				</div>
				<%@include file="admin-footer.jsp"%>
