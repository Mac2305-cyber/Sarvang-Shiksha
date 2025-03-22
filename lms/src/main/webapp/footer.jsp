		<footer class="container-fluid bg-dark text-center p-2">
			<small class="text-white">Copyright &copy; <%=new java.util.Date().getYear()+1900%> || Designed By Raviraj Patil || 
			<%
				if(session.getAttribute("is_admin_login")!=null){
					out.print("<a href='adminDashboard.jsp'> Admin Dashboard</a> <a href='logout.jsp'>Logout</a> ||");
				}
				if(session.getAttribute("is_inst_login")!=null){
					out.print("<a href='instDashboard.jsp'> Instructor Dashboard</a> <a href='logout.jsp'>Logout</a>");
				}		
				if(session.getAttribute("is_admin_login")==null) {
		        	out.print("<a href='#login' data-toggle='modal' data-target='#adminLoginModalCenter'> Admin Login</a> ||");
		      	}
				if(session.getAttribute("is_inst_login")==null) {
		        	out.print("<a href='#login' data-toggle='modal' data-target='#instLoginModalCenter'> Instructor Login</a> ||");
		        	out.print("<a href='#login' data-toggle='modal' data-target='#instRegModalCenter'> Instructor Signup</a>");
		      	}
			%>
			</small> 
		</footer>

		<div class="modal fade" id="donateModalCenter" tabindex="-1" role="dialog" aria-labelledby="stuRegModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
		    	<div class="modal-content">
		    		<form role="form" id="stuRegForm" action="process-donation.jsp" method="POST">
			        	<div class="modal-header">
			            	<h5 class="modal-title" id="stuRegModalCenterTitle">Instructor Registration</h5>
			            	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="clearAllStuReg()">
			              		<span aria-hidden="true">&times;</span>
			            	</button>
			          	</div>
			          	<div class="modal-body"><%@include file="donate.jsp"%></div>
			          	<div class="modal-footer">
			            	<span id="successMsg"></span>
			            	<button type="submit" class="btn btn-primary" id="signup">Donate</button>
			            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			          	</div>
			      	</form>
		      	</div>
			</div>
		</div>
		
		<div class="modal fade" id="instRegModalCenter" tabindex="-1" role="dialog" aria-labelledby="stuRegModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
		    	<div class="modal-content">
		    		<form role="form" id="stuRegForm" action="AddInstructorServlet" method="POST" enctype="multipart/form-data">
			        	<div class="modal-header">
			            	<h5 class="modal-title" id="stuRegModalCenterTitle">Instructor Registration</h5>
			            	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="clearAllStuReg()">
			              		<span aria-hidden="true">&times;</span>
			            	</button>
			          	</div>
			          	<div class="modal-body"><%@include file="instructorRegistration.jsp"%></div>
			          	<div class="modal-footer">
			            	<span id="successMsg"></span>
			            	<button type="submit" class="btn btn-primary" id="signup">Sign Up</button>
			            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			          	</div>
			      	</form>
		      	</div>
			</div>
		</div>


		<div class="modal fade" id="stuRegModalCenter" tabindex="-1" role="dialog" aria-labelledby="stuRegModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
		    	<div class="modal-content">
		    		<form role="form" id="stuRegForm" action="AddStudentServlet" method="POST" enctype="multipart/form-data">
			        	<div class="modal-header">
			            	<h5 class="modal-title" id="stuRegModalCenterTitle">Student Registration</h5>
			            	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="clearAllStuReg()">
			              		<span aria-hidden="true">&times;</span>
			            	</button>
			          	</div>
			          	<div class="modal-body"><%@include file="studentRegistration.jsp"%></div>
			          	<div class="modal-footer">
			            	<span id="successMsg"></span>
			            	<button type="submit" class="btn btn-primary" id="signup">Sign Up</button>
			            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			          	</div>
			      	</form>
		      	</div>
			</div>
		</div>
		
		<div class="modal fade" id="stuLoginModalCenter" tabindex="-1" role="dialog" aria-labelledby="stuLoginModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
		    	<div class="modal-content">
		    		<form role="form" id="stuLoginForm" method="post" action="addstudent.jsp">
			        	<div class="modal-header">
			            	<h5 class="modal-title" id="stuLoginModalCenterTitle">Student Login</h5>
			            	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="clearStuLoginWithStatus()">
			              		<span aria-hidden="true">&times;</span>
			            	</button>
			          	</div>
			          	<div class="modal-body">		            	
		              		<div class="form-group">
		                		<i class="fas fa-envelope"></i><label for="stuLogEmail" class="pl-2 font-weight-bold">Email</label><small id="statusLogMsg1"></small><input type="email" class="form-control" placeholder="Email" name="stuLogEmail" id="stuLogEmail" required>
		                	</div>
		                	<div class="form-group">
		                  		<i class="fas fa-key"></i><label for="stuLogPass" class="pl-2 font-weight-bold">Password</label><input type="password" class="form-control" placeholder="Password" name="stuLogPass" id="stuLogPass" required>
		              		</div>
			          	</div>
			          	<div class="modal-footer">
			            	<small id="statusLogMsg"></small>
			            	<button type="submit" class="btn btn-primary" id="stuLoginBtn" onclick="checkStuLogin()">Login</button>
			            	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="clearStuLoginWithStatus()">Cancel</button>
			          	</div>
			    	</form>
		        </div>
			</div>
		</div>
		<div class="modal fade" id="adminLoginModalCenter" tabindex="-1" role="dialog" aria-labelledby="adminLoginModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
		    	<div class="modal-content">
	            	<form role="form" id="adminLoginForm" method="post" action="admin.jsp">
			        	<div class="modal-header">
			            	<h5 class="modal-title" id="adminLoginModalCenterTitle">Admin Login</h5>
			            	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="clearAdminLoginWithStatus()">
			              		<span aria-hidden="true">&times;</span>
			            	</button>
			          	</div>
			          	<div class="modal-body">
		              		<div class="form-group">
		                		<i class="fas fa-envelope"></i><label for="adminLogEmail" class="pl-2 font-weight-bold">Email</label><input type="email" class="form-control" placeholder="Email" name="adminLogEmail" id="adminLogEmail" required>
		                	</div>
		                	<div class="form-group">
		                  		<i class="fas fa-key"></i><label for="adminLogPass" class="pl-2 font-weight-bold">Password</label><input type="password" class="form-control" placeholder="Password" name="adminLogPass" id="adminLogPass" required>
		              		</div>
			          	</div>
			          	<div class="modal-footer">
			            	<small id="statusAdminLogMsg"></small>
			            	<button type="submit" class="btn btn-primary" id="adminLoginBtn">Login</button>
			            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			          	</div>
			      	</form>
				</div>
			</div>
		</div>

		<div class="modal fade" id="instLoginModalCenter" tabindex="-1" role="dialog" aria-labelledby="adminLoginModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
		    	<div class="modal-content">
	            	<form role="form" id="adminLoginForm" method="post" action="inst.jsp">
			        	<div class="modal-header">
			            	<h5 class="modal-title" id="adminLoginModalCenterTitle">Instructor Login</h5>
			            	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="clearAdminLoginWithStatus()">
			              		<span aria-hidden="true">&times;</span>
			            	</button>
			          	</div>
			          	<div class="modal-body">
		              		<div class="form-group">
		                		<i class="fas fa-envelope"></i><label for="adminLogEmail" class="pl-2 font-weight-bold">Email</label><input type="email" class="form-control" placeholder="Email" name="instLogEmail" id="adminLogEmail" required>
		                	</div>
		                	<div class="form-group">
		                  		<i class="fas fa-key"></i><label for="adminLogPass" class="pl-2 font-weight-bold">Password</label><input type="password" class="form-control" placeholder="Password" name="instLogPass" id="adminLogPass" required>
		              		</div>
			          	</div>
			          	<div class="modal-footer">
			            	<small id="statusAdminLogMsg"></small>
			            	<button type="submit" class="btn btn-primary" id="adminLoginBtn">Login</button>
			            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			          	</div>
			      	</form>
				</div>
			</div>
		</div>

	    <script type="text/javascript" src="js/jquery.min.js"></script>
	    <script type="text/javascript" src="js/popper.min.js"></script>
	    <script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/all.min.js"></script>
	    <script type="text/javascript" src="js/owl.min.js"></script>
	    <script type="text/javascript" src="js/testyslider.js"></script>
    	<script type="text/javascript" src="js/custom.js"></script>
    	<script>
      		$(document).ready(function () {
				$(window).scroll(function () {
          			if ($(window).scrollTop() >= 600) {
          				$(".navbar").css("background-color", "#225470");
          			} 
          			else {
          				$(".navbar").css("background-color", "transparent");
          			}
        		});
        	});
    	</script>
	</body>
</html>