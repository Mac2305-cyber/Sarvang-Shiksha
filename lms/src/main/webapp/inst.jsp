<%@include file="config.jsp"%>
<%
	String instLogEmail = request.getParameter("instLogEmail");
   	String instLogPass = request.getParameter("instLogPass");
   
   	ResultSet r = con.createStatement().executeQuery("SELECT * FROM instructor WHERE inst_email='"+instLogEmail+"' AND inst_pass='"+instLogPass+"' and inst_is_active=1");
     
	if(r.next()){
		session.setAttribute("is_inst_login", "true");
       	session.setAttribute("instLogEmail", instLogEmail);
       	session.setAttribute("instid", r.getString(1));
       	out.print("<script>alert('Instructor login successful.');location.href='instDashboard.jsp'</script>");
	} 
	else{
		out.print("<script>alert('Login failed. Invalid credentials.');location.href='index.jsp'</script>");
	}
%>