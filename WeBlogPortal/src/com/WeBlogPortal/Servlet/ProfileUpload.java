package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.WeBlogPortal.control.DBConnection;
import com.WeBlogPortal.dao.BloggerDao;
import com.WeBlogPortal.model.Blogger;

/**
 * Servlet implementation class ProfileUpload
 */
@WebServlet("/ProfileUpload")
@MultipartConfig(maxFileSize=169999999)
public class ProfileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		   PrintWriter out=response.getWriter();
			HttpSession ss=request.getSession();
			Blogger blogger=(Blogger)ss.getAttribute("currentUser");
			int id =blogger.getId();
		    Part part=request.getPart("file");
		    System.out.println("hello"+part);
		    InputStream inputstream=null;
		   if(part!=null)
		   {
			   long filesize=part.getSize();
			   String filecontent=part.getContentType();
			   inputstream=part.getInputStream();
		   }
		 BloggerDao dao=new BloggerDao(DBConnection.getConnection());
		
		if(dao.updateprofilepic(id,inputstream)){
			out.println("profilepic updated");
			response.sendRedirect("MyProfile.jsp");
		}
		else{
			out.println("error");
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
