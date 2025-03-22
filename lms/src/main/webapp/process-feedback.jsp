<%@include file="config.jsp"%>

<%
	if(session.getAttribute("is_login")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String message = request.getParameter("message");
	
	PreparedStatement ps = con.prepareStatement("insert into feedback(f_content, stu_id) values(?,?)");
	ps.setString(1, message);
	ps.setString(2, session.getAttribute("stuid").toString());
	ps.executeUpdate();
%>
<script>
	alert('Thank you for your feedback.');
	location.href = 'index.jsp';
</script>