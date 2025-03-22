package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AddCourseServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms_db","root","");

			String course_name = request.getParameter("course_name");
			String course_desc = request.getParameter("course_desc");
			String instid = request.getParameter("instid");
			String course_duration = request.getParameter("course_duration");
			String course_price = request.getParameter("course_price");
			String course_original_price = request.getParameter("course_original_price");
			String image = "", msg = "";

			for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	image = "image/courseimg/"+fileName;
			    	part.write(appPath + image);
			    }
		    }

		    PreparedStatement ps = con.prepareStatement("INSERT INTO course (course_name, course_desc, inst_id, course_img, course_duration, course_price, course_original_price) VALUES (?, ?, ?, ?, ?, ?, ?)");
		    ps.setString(1, course_name);
		    ps.setString(2, course_desc);
		    ps.setString(3, instid);
		    ps.setString(4, image);
		    ps.setString(5, course_duration);
		    ps.setString(6, course_price);
		    ps.setString(7, course_original_price);
		    
		    if(ps.executeUpdate()>0) {
			  msg = "<div class='alert alert-success col-sm-6 ml-5 mt-2' role='alert'>Course added successfully</div>";
		    }
		    else {
			  msg = "<div class='alert alert-danger col-sm-6 ml-5 mt-2' role='alert'>Unable to add course</div>";
		    }

		    session.setAttribute("msg", msg);
		    response.sendRedirect("addCourse.jsp");
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
