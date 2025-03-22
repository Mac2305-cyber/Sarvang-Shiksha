		<%@include file="config.jsp"%>
		<%@include file="header.jsp"%>
		<div class="container-fluid bg-dark">
      		<div class="row">
        		<img src="image/coursebanner.jpg" alt="courses" style="height:500px; width:100%; object-fit:cover; box-shadow:10px;"/>
      		</div> 
    	</div>
		<div class="container mt-5">
      		<h1 class="text-center">All Courses</h1>
      		<div class="row mt-4">
<%
	ResultSet r = con.createStatement().executeQuery("select * from course");
	if(r.next()){
		do{
			String course_id = r.getString("course_id");
%>
				<div class="col-sm-4 mb-4">
                	<a href="coursedetails.jsp?course_id=<%=course_id%>" class="btn" style="text-align: left; padding:0px;">
	                	<div class="card">
	                    	<img src='<%=r.getString("course_img")%>' class="card-img-top" alt="Guitar" />
	                    	<div class="card-body">
	                      		<h5 class="card-title"><%=r.getString("course_name")%></h5>
	                      		<p class="card-text"><%=r.getString("course_desc")%></p>
	                    	</div>
	                    	<div class="card-footer">
	                      		<p class="card-text d-inline">Price: <small><del>&#8377 <%=r.getString("course_original_price")%></del></small> <span class="font-weight-bolder">&#8377 <%=r.getString("course_price")%><span></p> 
	                      		<a class="btn btn-primary text-white font-weight-bolder float-right" href="coursedetails.jsp?course_id=<%=course_id%>">Enroll</a>
	                    	</div>
	                  	</div> 
                  	</a>
				</div>
<%
		}while(r.next());
	}
%>
			</div>   
		</div>
		<%@include file="contact.jsp"%>
		<%@include file="footer.jsp"%>   
