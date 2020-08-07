package com.WeBlogPortal.Servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.WeBlogPortal.control.DBConnection;
import com.WeBlogPortal.dao.BloggerDao;
import com.WeBlogPortal.model.Blogger;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
@MultipartConfig(maxFileSize=169999999)
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
		int id=Integer.parseInt(request.getParameter("bid"));
		BloggerDao dao=new BloggerDao(DBConnection.getConnection());
		Blob blob=null;
		byte[] imgData=null;
		ServletOutputStream o=null;
		blob=dao.fetchProfilePic(id);
    	try{
    		if(blob==null){
    			 o=response.getOutputStream();
    			FileInputStream in=new FileInputStream("C:\\Users\\Mosam\\workspace\\WeBlogPortal\\WebContent\\Img\\default.png");
    			BufferedInputStream bin=new BufferedInputStream(in);
    			BufferedOutputStream bout=new BufferedOutputStream(o);
    			int ch=0;
    			while((ch=bin.read())!=-1){
    				bout.write(ch);
    			}
    			bin.close();
    			in.close();
    			bout.close();
    		}else{
    		imgData=blob.getBytes(1,(int) blob.length());
			response.setContentType("image/gif");
			 o=response.getOutputStream();
			 o.write(imgData);
			 response.sendRedirect("BloggerDashBoard.jsp");
    		}
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
				
		doGet(request, response);
	}

}
