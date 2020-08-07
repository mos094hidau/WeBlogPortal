package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
 * Servlet implementation class editDetails
 */
@MultipartConfig
@WebServlet("/editDetails")
public class editDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession ss=request.getSession();
		Blogger blogger=(Blogger)ss.getAttribute("currentUser");
		int id =blogger.getId();
		String Username=request.getParameter("username");
		String Emailid=request.getParameter("emailid");
		String mobile=request.getParameter("mobile");
		int Mobile=Integer.parseInt(mobile);
	    String Address=request.getParameter("address");
		String City=request.getParameter("city");
	    String State=request.getParameter("state");
        String Country=request.getParameter("country");
		String Status=request.getParameter("status");
	    String Description=request.getParameter("description");
		PrintWriter out=response.getWriter();
		out.println(id);
		out.println(Username);
		out.println(Emailid);
		out.println(Mobile);
		out.println(Address);
		out.println(City);
		out.println(State);
		out.println(Country);
		out.println(Status);
		out.println(Description);
		Blogger b=new Blogger();
		b.setId(id);
		b.setUsername(Username);
		b.setEmailid(Emailid);
		b.setMobile(Mobile);
		b.setAddress(Address);
		b.setCity(City);
	    b.setState(State);
	    b.setCountry(Country);
	    b.setProfilestatus(Status);
		b.setDescription(Description);
		
		BloggerDao dao=new BloggerDao(DBConnection.getConnection());
		if(dao.editprofile(b)){
			out.println("record updated");
			
			RequestDispatcher rd=request.getRequestDispatcher("./showDetails");
			rd.forward(request, response);
		}
		else{
			out.println("error");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    
	    
		doGet(request, response);
	}

}
