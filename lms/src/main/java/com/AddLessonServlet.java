package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AddLessonServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*10, // 2MB
                 maxFileSize=1024*1024*50,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddLessonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms_db","root","");

			String lesson_name = request.getParameter("lesson_name");
			String lesson_desc = request.getParameter("lesson_desc");
			String course_id = request.getParameter("course_id");
			String course_name = request.getParameter("course_name");

			String image = "", msg = "";

			for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	image = "lessonvid/"+fileName;
			    	part.write(appPath + image);
			    }
		    }

		    PreparedStatement ps = con.prepareStatement("INSERT INTO lesson (lesson_name, lesson_desc, lesson_link, course_id, course_name) VALUES (?, ?, ?, ?, ?)");
		    ps.setString(1, lesson_name);
		    ps.setString(2, lesson_desc);
		    ps.setString(3, image);
		    ps.setString(4, course_id);
		    ps.setString(5, course_name);
		    
		    if(ps.executeUpdate()>0) {
			  msg = "<div class='alert alert-success col-sm-6 ml-5 mt-2' role='alert'>Lesson added successfully</div>";
		    }
		    else {
			  msg = "<div class='alert alert-danger col-sm-6 ml-5 mt-2' role='alert'>Unable to add lesson</div>";
		    }

		    session.setAttribute("msg", msg);
		    response.sendRedirect("addLesson.jsp?course_id="+course_id);
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
