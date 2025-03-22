<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="UTF-8" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/all.min.css">
	    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="css/owl.min.css">
	    <link rel="stylesheet" type="text/css" href="css/owl.theme.min.css">
	    <link rel="stylesheet" type="text/css" href="css/testyslider.css">
		<link rel="stylesheet" type="text/css" href="css/style.css" />
    	<title>Sarvang Shiksha</title>
  	</head>
  	<body>
		<nav class="navbar navbar-expand-sm navbar-dark pl-5 fixed-top">
      		<a href="index.jsp" class="navbar-brand">Sarvang Shiksha</a>
      		<span class="navbar-text">Learn and Implement</span>
      		<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myMenu"><span class="navbar-toggler-icon"></span></button>
      		<div class="collapse navbar-collapse" id="myMenu">
	        	<ul class="navbar-nav pl-5 custom-nav">
	          		<li class="nav-item custom-nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
	          		<li class="nav-item custom-nav-item"><a href="courses.jsp" class="nav-link">Courses</a></li>
	          		<li class="nav-item custom-nav-item"><a href="paymentstatus.jsp" class="nav-link">Payment Status</a></li>
<%
	if(session.getAttribute("is_login")!=null){
%>          		
					<li class="nav-item custom-nav-item"><a href="myCourse.jsp" class="nav-link">My Courses</a></li> 
					<li class="nav-item custom-nav-item"><a href="studentProfile.jsp" class="nav-link">My Profile</a></li> 
					<li class="nav-item custom-nav-item"><a href="logout.jsp" class="nav-link">Logout</a></li>
<%
	} 
	else {
%>
					<li class="nav-item custom-nav-item"><a href="#login" class="nav-link" data-toggle="modal" data-target="#stuLoginModalCenter">Login</a></li> 
					<li class="nav-item custom-nav-item"><a href="#signup" class="nav-link" data-toggle="modal" data-target="#stuRegModalCenter">Signup</a></li>
					<li class="nav-item custom-nav-item"><a href="#Feedback" class="nav-link">Feedback</a></li>
	          		<li class="nav-item custom-nav-item"><a href="#Contact" class="nav-link">Contact</a></li>
	          		<li class="nav-item custom-nav-item"><a href="#donate" class="nav-link" data-toggle="modal" data-target="#donateModalCenter">Donate</a></li>
	          		<li class="nav-item custom-nav-item"><a href="view-scholarships.jsp" class="nav-link">Scholarships</a></li>
	          		<li class="nav-item custom-nav-item"><a href="image/career-map.pdf" class="nav-link">Career Map</a></li>
<%
	}
%>
				</ul>
      		</div>
		</nav>