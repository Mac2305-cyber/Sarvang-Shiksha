		<%@include file="config.jsp"%>
		<%@include file="header.jsp"%>
		<div class="container-fluid bg-dark">
      		<div class="row">
        		<img src="image/coursebanner.jpg" alt="courses" style="height:500px; width:100%; object-fit:cover; box-shadow:10px;"/>
      		</div> 
    	</div>
		<div class="container mt-5">
      		<h1 class="text-center">All Scholarships</h1>
      		<div class="row mt-4">
<%
	ResultSet r = con.createStatement().executeQuery("select * from scholarship");
	if(r.next()){
		do{
%>
				<div class="col-sm-4 mb-4">
	                	<div class="card">
	                    	<div class="card-body">
	                      		<h5 class="card-title"><%=r.getString("name")%></h5>
	                      		<p class="card-text">Eligibility: <%=r.getString("eligibility")%></p>
	                      		<p class="card-text">Syllabus: <%=r.getString("syllabus")%></p>
	                    	</div>
	                    	<div class="card-footer">
	                      		<a class="btn btn-primary text-white font-weight-bolder float-right" href='<%=r.getString("website")%>'>Apply Now</a>
	                    	</div>
	                  	</div> 
				</div>
<%
		}while(r.next());
	}
%>
			</div>   
		</div>
		<%@include file="contact.jsp"%>
		<%@include file="footer.jsp"%>   
