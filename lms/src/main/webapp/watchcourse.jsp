<%@include file="config.jsp"%>

<%
	if(session.getAttribute("is_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String stuEmail = session.getAttribute("stuLogEmail").toString();
%>
<!DOCTYPE html>
<html lang="en">
	<head>
 		<meta charset="UTF-8">
 		<meta name="viewport" content="width=device-width, initial-scale=1.0">
 		<meta http-equiv="X-UA-Compatible" content="ie=edge">
 		<title>Watch Course</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/all.min.css">
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<link rel="stylesheet" href="css/stustyle.css">
	</head>

	<body>
		<div class="container-fluid bg-success p-2" >
    		<h3>Welcome to Sarwang Shiksha</h3>
    		<a class="btn btn-danger" href="myCourse.jsp">My Courses</a>
   		</div>
		<div class="container-fluid">
    		<div class="row">
     			<div class="col-sm-3 border-right">
       				<h4 class="text-center">Lessons</h4>
       				<ul id="playlist" class="nav flex-column">
<%
	String course_id = request.getParameter("course_id");
	ResultSet r = con.createStatement().executeQuery("SELECT * FROM lesson WHERE course_id = "+course_id);
	if(r.next()){
		do{
%>
                		<li class="nav-item border-bottom py-2" movieurl='<%=r.getString("lesson_link")%>' style="cursor: pointer;"><%=r.getString("lesson_name")%></li>
<% 
		}while(r.next());
	}
%>
					</ul>
     			</div>
     			<div class="col-sm-8">
        			<video id="videoarea" src="" class="mt-5 w-75 ml-2" controls></video>
     			</div>
    		</div>
   		</div>
	    <script type="text/javascript" src="js/jquery.min.js"></script>
	    <script type="text/javascript" src="js/popper.min.js"></script>
	    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="js/all.min.js"></script>
	    <script type="text/javascript" src="js/custom.js"></script>
	</body>
</html>