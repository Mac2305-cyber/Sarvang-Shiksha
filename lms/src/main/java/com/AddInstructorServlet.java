package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AddInstructorServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddInstructorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms_db","root","");

			String instname = request.getParameter("instname");
			String instemail = request.getParameter("instemail");
			String instphone = request.getParameter("instphone");
			String instocc = request.getParameter("instocc");
			String instqual = request.getParameter("instqual");
			String instpass = request.getParameter("instpass");
			String instimage = "";

			ResultSet r = con.createStatement().executeQuery("select * from instructor where inst_email='"+instemail+"'");
			if(r.next()) {
				out.print("<script>alert('Instructor email already registered');location.href='index.jsp';</script>");
				return;
			}
			
			for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	instimage = "image/inst/"+fileName;
			    	part.write(appPath + instimage);
			    }
		    }

		    PreparedStatement ps = con.prepareStatement("INSERT INTO instructor (inst_name, inst_email, inst_phone, inst_pass, inst_qual, inst_occ, inst_img) VALUES(?,?,?,?,?,?,?)");
		    ps.setString(1, instname);
		    ps.setString(2, instemail);
		    ps.setString(3, instphone);
		    ps.setString(4, instpass);
		    ps.setString(5, instqual);
		    ps.setString(6, instocc);
		    ps.setString(7, instimage);
		    
		    ps.executeUpdate();		
		    out.print("<script>alert('Instructor registered successfully');location.href='index.jsp';</script>");
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
