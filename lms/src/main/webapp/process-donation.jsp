<%@include file="config.jsp"%>

<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String amount = request.getParameter("amount");
	
	PreparedStatement ps = con.prepareStatement("insert into donation(name, phone, email, amount) values(?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, phone);
	ps.setString(4, amount);
	ps.executeUpdate();
%>
<script>
	alert('Thank you for your donation.');
	location.href = 'index.jsp';
</script>