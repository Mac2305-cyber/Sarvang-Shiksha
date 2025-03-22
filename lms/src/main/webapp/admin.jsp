<%@include file="config.jsp"%>
<%
	String adminLogEmail = request.getParameter("adminLogEmail");
   	String adminLogPass = request.getParameter("adminLogPass");
   
   	ResultSet r = con.createStatement().executeQuery("SELECT admin_email, admin_pass FROM admin WHERE admin_email='"+adminLogEmail+"' AND admin_pass='"+adminLogPass+"'");
     
	if(r.next()){
		session.setAttribute("is_admin_login", "true");
       	session.setAttribute("adminLogEmail", adminLogEmail);
       	out.print("<script>alert('Admin login successful.');location.href='adminDashboard.jsp'</script>");
	} 
	else{
		out.print("<script>alert('Login failed. Invalid credentials.');location.href='index.jsp'</script>");
	}
%>