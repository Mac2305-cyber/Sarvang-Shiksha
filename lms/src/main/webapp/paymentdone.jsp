<%@include file="config.jsp"%>

<%
	if(session.getAttribute("is_login")==null){
		response.sendRedirect("loginorsignup.jsp");
		return;
	}

	String order_id = request.getParameter("ORDER_ID");
	String stuid = session.getAttribute("stuid").toString();
	String course_id = session.getAttribute("course_id").toString();
  	String status = "Success", respmsg = "Done";
  	String amount = request.getParameter("TXN_AMOUNT");

  	int n = con.createStatement().executeUpdate("INSERT INTO courseorder(order_id, stu_id, course_id, status, respmsg, amount, order_date) VALUES ('"+order_id+"', '"+stuid+"', '"+course_id+"', '"+status+"', '"+respmsg+"', '"+amount+"', current_date)");
  	
   	if(n>0){
    	out.print("<script>alert('Transaction successful'); window.location.href = 'myCourse.jsp'; </script>");
   	}
   	else {
    	out.print("<script>alert('Transaction failed'); window.location.href = 'index.jsp'; </script>");
 	}
%>