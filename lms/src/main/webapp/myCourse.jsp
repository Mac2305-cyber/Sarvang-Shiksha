<%@include file="config.jsp"%>
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

<div class="container mt-5 ml-2">
	<div class="row">
   		<div class="jumbotron">
    		<h4 class="text-center">All Course</h4>
<%
	String stuLogEmail = session.getAttribute("stuLogEmail").toString();
	String stuid = session.getAttribute("stuid").toString();
	ResultSet result = con.createStatement().executeQuery("SELECT order_id, course.course_id, course_name, course_duration, course_desc, course_img, inst_name, course_original_price, course_price FROM courseorder, course, instructor where course.course_id = courseorder.course_id AND course.inst_id = instructor.inst_id and courseorder.stu_id = '"+stuid+"'");
	while(result.next()){
%>
			<div class="bg-light mb-3">
        		<h5 class="card-header"><%=result.getString("course_name")%></h5>
          		<div class="row">
					<div class="col-sm-3">
                		<img src='<%=result.getString("course_img")%>' class="card-img-top mt-4" alt="pic">
              		</div>
              		<div class="col-sm-6 mb-3">
                		<div class="card-body">
                  			<p class="card-title"><%=result.getString("course_desc")%></p>
                  			<small class="card-text">Duration: <%=result.getString("course_duration")%></small><br />
                  			<small class="card-text">Instructor: <%=result.getString("inst_name")%></small><br/>
                  			<p class="card-text d-inline">Price: <small><del>&#8377 <%=result.getString("course_original_price")%> </del></small> <span class="font-weight-bolder">&#8377 <%=result.getString("course_price")%> <span></p>
                  			<a href='watchcourse.jsp?course_id=<%=result.getString("course_id")%>' class="btn btn-primary mt-5 float-right">Watch Course</a>
                		</div>
              		</div>
				</div>
			</div> 
<%
	}
%>
			<hr/>
   		</div>
  	</div>
</div>

		<div class="container-fluid bg-danger">
        	<div class="row text-white text-center p-1">
          		<div class="col-sm"><a class="text-white social-hover" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i> Facebook</a></div>
          		<div class="col-sm"><a class="text-white social-hover" href="https://www.twitter.com/"><i class="fab fa-twitter"></i> Twitter</a></div>
				<div class="col-sm"><a class="text-white social-hover" href="https://www.instagram.com"><i class="fab fa-instagram"></i> Instagram</a></div>
        	</div>
    	</div>
    
    	<div class="container-fluid p-4" style="background-color:#E9ECEF">
      		<div class="container" style="background-color:#E9ECEF">
        		<div class="row text-center">
          			<div class="col-sm">
            			<h5>About Us</h5>
              			<p><b>"Sarvang Shiksha"</b> provides universal access to the world's best education, partnering with top universities and organizations to offer courses online.</p>
          			</div>
          			<div class="col-sm">
            			<h5>Category</h5>
			            <a class="text-dark" href="#">Web Development</a><br />
			            <a class="text-dark" href="#">Web Designing</a><br />
			            <a class="text-dark" href="#">Android App Dev</a><br />
			            <a class="text-dark" href="#">iOS Development</a><br />
			            <a class="text-dark" href="#">Data Analysis</a><br />
					</div>
          			<div class="col-sm">
            			<h5>Contact Us</h5>
            			<p>Sarvang Shiksha<br>ASM College <br> Pimpri, Pune 411017 <br> Ph. 9823374979 </p>
          			</div>
        		</div>
      		</div>
		</div>
		
		<%@include file="footer.jsp"%> 


