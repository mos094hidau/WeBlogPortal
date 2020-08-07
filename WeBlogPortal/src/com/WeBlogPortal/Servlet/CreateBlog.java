package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.WeBlogPortal.control.DBConnection;
import com.WeBlogPortal.dao.BlogDao;
import com.WeBlogPortal.model.Blogger;

/**
 * Servlet implementation class CreateBlog
 */
@WebServlet("/CreateBlog")
@MultipartConfig(maxFileSize=169999999)
public class CreateBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part image=request.getPart("pictures");
	    InputStream inputstreamimage=null;
		
		HttpSession ss=request.getSession();
		Blogger blogger=(Blogger)ss.getAttribute("currentUser");
		int id =blogger.getId();
		int cid=Integer.parseInt(request.getParameter("cid"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String links=request.getParameter("links");
		Date date=new Date();
		long time=date.getTime();
		Timestamp ts=new Timestamp(time);
		PrintWriter out=response.getWriter();
		try{
			   if((image!=null))
			   {
				   long filesizeimage=image.getSize();
				   String filecontentimage=image.getContentType();
				   inputstreamimage=image.getInputStream();
				  
			   }
			   BlogDao dao=new BlogDao(DBConnection.getConnection());
				if(dao.createBlog(title,content,ts,id,links,inputstreamimage,cid)){
					
					out.println("done");
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
