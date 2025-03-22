package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AddStudentServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms_db","root","");

			String stuname = request.getParameter("stuname");
			String stuemail = request.getParameter("stuemail");
			String stuphone = request.getParameter("stuphone");
			String stuocc = request.getParameter("stuocc");
			String stupass = request.getParameter("stupass");
			String stuimage = "";

			ResultSet r = con.createStatement().executeQuery("select * from student where stu_email='"+stuemail+"'");
			if(r.next()) {
				out.print("<script>alert('Student email already registered');location.href='index.jsp';</script>");
				return;
			}
			
			for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	stuimage = "image/stu/"+fileName;
			    	part.write(appPath + stuimage);
			    }
		    }

		    PreparedStatement ps = con.prepareStatement("INSERT INTO student (stu_name, stu_email, stu_phone, stu_pass, stu_occ, stu_img) VALUES(?,?,?,?,?,?)");
		    ps.setString(1, stuname);
		    ps.setString(2, stuemail);
		    ps.setString(3, stuphone);
		    ps.setString(4, stupass);
		    ps.setString(5, stuocc);
		    ps.setString(6, stuimage);
		    
		    ps.executeUpdate();		
		    out.print("<script>alert('Student registered successfully');location.href='index.jsp';</script>");
		}
		catch(Exception e){
			out.println("<h4>"+e+"</h4>");
		}	
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
