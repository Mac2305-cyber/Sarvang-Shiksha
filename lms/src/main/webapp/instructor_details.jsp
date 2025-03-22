<%@include file="config.jsp"%>
<%@include file="header.jsp"%>
		<div class="container-fluid bg-dark">
      		<div class="row">
        		<img src="image/coursebanner.jpg" alt="courses" style="height:200px; width:100%; object-fit:cover; box-shadow:10px;"/>
      		</div> 
    	</div>
    	<div class="container mt-5">
<%
	ResultSet t = con.createStatement().executeQuery("select * from instructor where inst_id="+request.getParameter("id"));
	t.next();
%>    	
			<div class="row">
            	<div class="col-md-4">
                	<img src='<%=t.getString("inst_img")%>' class="card-img-top" alt="Guitar" />
                </div>
                <div class="col-md-8">
					<div class="card-body">
                    	<h5 class="card-title">Instructor Name: <%=t.getString("inst_name")%></h5>
                    	<p class="card-text"> <b>Email:</b> <%=t.getString("inst_email")%></p>
                    	<p class="card-text"> <b>Qualification:</b> <%=t.getString("inst_qual")%></p>
                    	<p class="card-text"> <b>Occupation:</b> <%=t.getString("inst_occ")%></p>
                  	</div>
				</div>
                <div class="col-md-8">
					<div class="card-body">
                  	</div>
				</div>
                <div class="col-md-8">
					<div class="card-body">
                  	</div>
				</div>
                <div class="col-md-8">
					<div class="card-body">
                  	</div>
				</div>
			</div> 
      	</div>
<%@include file="footer.jsp"%>