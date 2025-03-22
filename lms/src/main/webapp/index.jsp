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

    	<div class="container-fluid bg-danger txt-banner"> 
        	<div class="row bottom-banner">
          		<div class="col-sm">
            		<h5> <i class="fas fa-book-open mr-3"></i> 100+ Online Courses</h5>
          		</div>
          		<div class="col-sm">
            		<h5><i class="fas fa-users mr-3"></i> Expert Instructors</h5>
          		</div>
          		<div class="col-sm">
            		<h5><i class="fas fa-keyboard mr-3"></i> Lifetime Access</h5>
          		</div>
          		<div class="col-sm">
            		<h5><i class="fas fa-rupee-sign mr-3"></i> Money Back Guarantee*</h5>
          		</div>
        	</div>
    	</div>
    
    	<div class="container mt-5">
      		<h1 class="text-center">Popular Course</h1>
      		<div class="card-deck mt-4">
<%
	ResultSet result = con.createStatement().executeQuery("SELECT * FROM course LIMIT 3");
	if(result.next()){
		do{
			String course_id = result.getString("course_id");
%>      		
				<a href="coursedetails.jsp?course_id=<%=course_id%>" class="btn" style="text-align: left; padding:0px; margin:0px;">
	              	<div class="card">
	                	<img src='<%=result.getString("course_img")%>' class="card-img-top" alt="Guitar">
	                	<div class="card-body">
	                  		<h5 class="card-title"><%=result.getString("course_name")%></h5>
	                  		<p class="card-text"><%=result.getString("course_desc")%></p>
	                	</div>
	                	<div class="card-footer">
	                  		<p class="card-text d-inline">Price: <small><del>&#8377 <%=result.getString("course_original_price")%></del></small> <span class="font-weight-bolder">&#8377 <%=result.getString("course_price")%><span></p> 
	                  		<a class="btn btn-primary text-white font-weight-bolder float-right" href="coursedetails.jsp?course_id=<%=course_id%>">Enroll</a>
	                	</div>
	              	</div>
            	</a>
<%
		}while(result.next());
	}
%>            	
			</div>   
      		<div class="card-deck mt-4">
<%
	result = con.createStatement().executeQuery("SELECT * FROM course LIMIT 3,3");
	if(result.next()){
		do{
			String course_id = result.getString("course_id");
%>			
				<a href="coursedetails.jsp?course_id=<%=course_id%>" class="btn" style="text-align: left; padding:0px;">
					<div class="card">
	                    <img src='<%=result.getString("course_img")%>' class="card-img-top" alt="Guitar" />
	                    <div class="card-body">
	                    	<h5 class="card-title"><%=result.getString("course_name")%></h5>
	                      	<p class="card-text"><%=result.getString("course_desc")%></p>
	                    </div>
	                    <div class="card-footer">
	                    	<p class="card-text d-inline">Price: <small><del>&#8377 <%=result.getString("course_original_price")%></del></small> <span class="font-weight-bolder">&#8377 <%=result.getString("course_price")%><span></p> 
	                    	<a class="btn btn-primary text-white font-weight-bolder float-right" href="#">Enroll</a>
						</div>
	               	</div>
                </a>
<%
		}while(result.next());
	}
%>                
			</div> 
      		<div class="text-center m-2">
        		<a class="btn btn-danger btn-sm" href="courses.jsp">View All Course</a> 
      		</div>
    	</div>
    	<%@include file="contact.jsp"%>
		<div class="container-fluid mt-5" style="background-color: #4B7289" id="Feedback">
        	<h1 class="text-center testyheading p-4"> Student's Feedback </h1>
        	<div class="row">
          		<div class="col-md-12">
            		<div id="testimonial-slider" class="owl-carousel">
<%
	result = con.createStatement().executeQuery("SELECT s.stu_name, s.stu_occ, s.stu_img, f.f_content FROM student AS s JOIN feedback AS f ON s.stu_id = f.stu_id");
	if(result.next()){
		do{
			String s_img = result.getString("stu_img");
%>
						<div class="testimonial">
                			<p class="description"><%=result.getString("f_content")%></p>
                			<div class="pic">
                  				<img src="<%=s_img%>" alt=""/>
                			</div>
                			<div class="testimonial-prof">
                  				<h4><%=result.getString("stu_name")%></h4>
                  				<small><%=result.getString("stu_occ")%></small>
                			</div>
              			</div>
<%
		}while(result.next());
	}
%>
					</div>
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