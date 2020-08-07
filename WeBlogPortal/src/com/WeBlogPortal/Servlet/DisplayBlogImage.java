package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WeBlogPortal.control.DBConnection;
import com.WeBlogPortal.dao.BlogDao;
import com.WeBlogPortal.dao.BloggerDao;
import com.WeBlogPortal.model.Blog;
import com.WeBlogPortal.model.Blogger;

/**
 * Servlet implementation class DisplayBlogImage
 */
@WebServlet("/DisplayBlogImage")
public class DisplayBlogImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayBlogImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	int blogid=Integer.parseInt(request.getParameter("blogid"));
    	BlogDao dao=new BlogDao(DBConnection.getConnection());
		Blob blob=null;
		byte[] imgData=null;
		ServletOutputStream o=null;
		blob=dao.getBlogImage(blogid);
		try {
			imgData=blob.getBytes(1,(int) blob.length());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("image/gif");
		 o=response.getOutputStream();
		
		 o.write(imgData);
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		 
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	
	
}
