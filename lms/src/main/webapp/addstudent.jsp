<%@include file="config.jsp"%>

<%
	String stuLogEmail = request.getParameter("stuLogEmail");
	String stuLogPass = request.getParameter("stuLogPass");
	ResultSet r = con.createStatement().executeQuery("SELECT * FROM student WHERE stu_email='"+stuLogEmail+"' AND stu_pass='"+stuLogPass+"'");
	if(r.next()){
		session.setAttribute("is_login", "true");
		session.setAttribute("stuLogEmail", stuLogEmail);
		session.setAttribute("stuid", r.getString(1));
		out.print("<script>alert('Login successful.');location.href='index.jsp';</script>");
	}
	else{
		out.print("<script>alert('Login failed. Invalid credentials');location.href='index.jsp';</script>");
	}
%>
