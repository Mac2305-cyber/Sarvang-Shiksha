<%@include file="config.jsp"%>
<%@include file="header.jsp"%>
		<div class="container-fluid bg-dark">
      		<div class="row">
        		<img src="image/coursebanner.jpg" alt="courses" style="height:200px; width:100%; object-fit:cover; box-shadow:10px;"/>
      		</div> 
    	</div>
    	<div class="container mt-5">
<%
	ResultSet r = con.createStatement().executeQuery("select * from course where course_id="+request.getParameter("course_id"));
	r.next();
	ResultSet t = con.createStatement().executeQuery("select * from instructor where inst_id="+r.getInt("inst_id"));
	t.next();
%>    	
			<div class="row">
            	<div class="col-md-4">
                	<img src='<%=r.getString("course_img")%>' class="card-img-top" alt="Guitar" />
                </div>
                <div class="col-md-8">
					<div class="card-body">
                    	<h5 class="card-title">Course Name: <%=r.getString("course_name")%></h5>
                    	<p class="card-text"> Description: <%=r.getString("course_desc")%></p>
                    	<p class="card-text"> Instructor: <a href='instructor_details.jsp?id=<%=t.getInt("inst_id")%>'><%=t.getString("inst_name")%></a></p>
                    	<p class="card-text"> Duration: <%=r.getString("course_duration")%></p>
                    	<p class="card-text d-inline">Price: <small><del>&#8377 <%=r.getString("course_original_price")%></del></small> <span class="font-weight-bolder">&#8377 <%=r.getString("course_price")%><span></p>
                    	<form action="checkout.jsp" method="post">
                    		<input type="hidden" name="cid" value='<%=r.getString("course_id")%>'>
							<input type="hidden" name="id" value='<%=r.getString("course_price")%>'> 
                      		<button type="submit" class="btn btn-primary text-white font-weight-bolder float-right" name="buy">Enroll Now</button>
                    	</form>
                  	</div>
				</div>
			</div> 
      		<div class="container">
          		<div class="row">
<%
	r = con.createStatement().executeQuery("SELECT * FROM lesson where course_id="+request.getParameter("course_id"));
	if(r.next()){
%>		
					<table class="table table-bordered table-hover">
             		<thead>
               		<tr>
                 		<th scope="col">Lesson #</th>
                 		<th scope="col">Lesson Name</th>
               		</tr>
             		</thead>
             		<tbody>
<%
		int cnt=1;
		do{
%>             		
					<tr>
               			<th scope="row"><%=cnt++%></th>
               			<td><%=r.getString("lesson_name")%></td></tr>
					</tr>
<%
		}while(r.next());
%>					
					</tbody>
           			</table>
<%
	}
%>           			
				</div>				
      		</div>
      	</div>
      	<br><br><br><br>
<%@include file="footer.jsp"%>