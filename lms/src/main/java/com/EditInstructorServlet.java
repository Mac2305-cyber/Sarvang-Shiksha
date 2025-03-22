package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/EditInstructorServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class EditInstructorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms_db","root","");

			String instid = request.getParameter("inst_id");
			String instname = request.getParameter("inst_name");
			String instemail = request.getParameter("inst_email");
			String instphone = request.getParameter("inst_phone");
			String instocc = request.getParameter("inst_occ");
			String instqual = request.getParameter("inst_qual");
			String instimage = request.getParameter("inst_img");
			String msg = "";
			
			ResultSet r = con.createStatement().executeQuery("select * from instructor where inst_email='"+instemail+"' and inst_id<>"+instid);
			if(r.next()) {
				msg = "<div class='alert alert-danger col-sm-6 ml-5 mt-2' role='alert'>Email already associated with some other profile.</div>";
				response.sendRedirect("instProfile.jsp");
				return;
			}
			
			for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	instimage = "image/inst/"+fileName;
			    	part.write(appPath + instimage);
			    }
		    }

		    PreparedStatement ps = con.prepareStatement("UPDATE instructor set inst_name=?, inst_email=?, inst_phone=?, inst_qual=?, inst_occ=?, inst_img=? where inst_id=?");
		    ps.setString(1, instname);
		    ps.setString(2, instemail);
		    ps.setString(3, instphone);
		    ps.setString(4, instqual);
		    ps.setString(5, instocc);
		    ps.setString(6, instimage);
		    ps.setString(7, instid);
		    ps.executeUpdate();		
			msg = "<div class='alert alert-success col-sm-6 ml-5 mt-2' role='alert'>Profile updated successfully</div>";
			response.sendRedirect("instProfile.jsp");
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
