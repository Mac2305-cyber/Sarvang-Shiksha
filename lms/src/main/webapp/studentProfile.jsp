<%@include file="config.jsp"%>

<%
	if(session.getAttribute("is_login")==null){
		response.sendRedirect("loginorsignup.jsp");
		return;
	}
%>

<%@include file="header.jsp"%>
		<div class="container-fluid remove-vid-marg">
      		<div class="vid-parent">
        		<video playsinline autoplay muted loop>
          			<source src="video/banvid.mp4" />
        		</video>
        		<div class="vid-overlay"></div>
      		</div>
      		<div class="vid-content" >
        		<h1 class="my-content">Welcome to <b>Sarvang Shiksha</b></h1>
        		<small class="my-content">Learn and Implement</small><br />
<%
	if(session.getAttribute("is_login")==null){
%>
				<a class="btn btn-danger mt-3" href="#" data-toggle="modal" data-target="#stuRegModalCenter">Get Started</a>
<%
	}
	else{
%>				
				<a class="btn btn-primary mt-3" href="studentProfile.jsp">My Profile</a>
<%
	}
%>
			</div>
    	</div>

<%
	String sql = "SELECT * FROM student WHERE stu_email='"+session.getAttribute("stuLogEmail")+"'";
	System.out.println(sql);
	
	ResultSet r = con.createStatement().executeQuery(sql);
	r.next();
	String stuId = r.getString("stu_id");
 	String stuName = r.getString("stu_name"); 
 	String stuOcc = r.getString("stu_occ");
 	String stuImg = r.getString("stu_img");
 	String stuPhone = r.getString("stu_phone");
 	String stuEmail = r.getString("stu_email");
%>
<div class="col-sm-6 mt-5">
	<%=session.getAttribute("msg")!=null?session.getAttribute("msg"):""%>
	<form class="mx-5" method="POST" enctype="multipart/form-data" action="EditStudentServlet">
    	<div class="form-group">
      		<img src='<%=r.getString("stu_img")%>' alt="studentimage" class="img-thumbnail">     	      			      		
      		<input type="file" class="form-control-file" id="stuImg" name="stuImg">
      		<input type="hidden" name="stuimg" value='<%=r.getString("stu_img")%>'>      		
    	</div>
		<div class="form-group">
			<label for="stuId"><b>Student ID</b></label>
	      	<input type="text" class="form-control" id="stuId" name="stuid" value="<%=stuId%>" readonly>
	    </div>
    	<div class="form-group">
      		<label for="stuEmail"><b>Email</b></label>
      		<input type="email" class="form-control" id="stuemail" name="stuemail" value="<%=stuEmail%>" required>
    	</div>
    	<div class="form-group">
      		<label for="stuName"><b>Name</b></label>
      		<input type="text" class="form-control" id="stuName" name="stuname" value="<%=stuName%>" required>
    	</div>
    	<div class="form-group">
      		<label for="stuPhone"><b>Phone</b></label>
      		<input type="text" class="form-control" id="stuPhone" name="stuphone" value="<%=stuPhone%>" pattern="^\d{10}$" required>
    	</div>
    	<div class="form-group">
			<label for="stuOcc"><b>Occupation</b></label>
      		<input type="text" class="form-control" id="stuOcc" name="stuocc" value="<%=stuOcc%>">
    	</div>
    	<button type="submit" class="btn btn-primary" name="updateStuNameBtn">Update</button>
	</form>
</div>

<%@include file="footer.jsp"%>
<%
	session.removeAttribute("msg");
%>