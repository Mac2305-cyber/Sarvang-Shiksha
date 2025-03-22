<%@include file="config.jsp"%>

<%
	if(session.getAttribute("is_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String stuLogEmail = session.getAttribute("stuLogEmail");
	ResultSet result = con.createStatement().executeQuery("SELECT stu_img FROM student WHERE stu_email = '"+stuLogEmail+"'");
	result.next();
	String stud_img = result.getString("stu_img");
%>
<!DOCTYPE html>
<html lang="en">
	<head>
 		<meta charset="UTF-8">
 		<meta name="viewport" content="width=device-width, initial-scale=1.0">
 		<meta http-equiv="X-UA-Compatible" content="ie=edge">
 		<title>Sarvang Shiksha - Student</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/all.min.css">
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<link rel="stylesheet" href="css/stustyle.css">
	</head>
	<body>
		 <nav class="navbar navbar-dark fixed-top flex-md-nowrap p-0 shadow" style="background-color: #225470;">
  			<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="">Sarvang Shiksha</a>
 		</nav>
		<div class="container-fluid mb-5 " style="margin-top:40px;">
  			<div class="row">
   				<nav class="col-sm-2 bg-light sidebar py-5 d-print-none">
    				<div class="sidebar-sticky">
     					<ul class="nav flex-column">
      						<li class="nav-item mb-3"><img src="<%=stu_img%>" alt="studentimage" class="img-thumbnail rounded-circle"></li>
      						<li class="nav-item">
       							<a class="nav-link active" href="studentProfile.jsp">
        <i class="fas fa-user"></i>
        Profile <span class="sr-only">(current)</span>
       </a>
      </li>
      <li class="nav-item">
       <a class="nav-link <?php if(PAGE == 'mycourse') {echo 'active';} ?>" href="myCourse.jsp">
        <i class="fab fa-accessible-icon"></i>
        My Courses
       </a>
      </li>
      <li class="nav-item">
       <a class="nav-link <?php if(PAGE == 'feedback') {echo 'active';} ?>" href="stufeedback.jsp">
        <i class="fab fa-accessible-icon"></i>
        Feedback
       </a>
      </li>
      <li class="nav-item">
       <a class="nav-link <?php if(PAGE == 'studentChangePass') {echo 'active';} ?>" href="studentChangePass.jsp">
        <i class="fas fa-key"></i>
        Change Password
       </a>
      </li>
      <li class="nav-item">
       <a class="nav-link" href="../logout.jsp">
        <i class="fas fa-sign-out-alt"></i>
        Logout
       </a>
      </li>
     </ul>
    </div>
   </nav>