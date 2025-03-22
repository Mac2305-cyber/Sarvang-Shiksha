<%
	session.removeAttribute("is_admin_login");
	session.removeAttribute("is_login");
	session.invalidate();
	response.sendRedirect("index.jsp");
%>