package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WeBlogPortal.control.DBConnection;
import com.WeBlogPortal.dao.BloggerDao;
import com.WeBlogPortal.model.Blogger;
import com.WeBlogPortal.model.Message;

/**
 * Servlet implementation class ForgetLoginDetails
 */
@WebServlet("/ForgetLoginDetails")
public class ForgetLoginDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetLoginDetails() {
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
		HttpSession session=request.getSession();
		String Emailid=(String)session.getAttribute("User");
		PrintWriter out=response.getWriter();
		String Username=request.getParameter("username");
		String Password=request.getParameter("password");
		Blogger blogger=new Blogger();
		blogger.setEmailid(Emailid);
		blogger.setUsername(Username);
		blogger.setPassword(Password);
		BloggerDao dao=new BloggerDao(DBConnection.getConnection());
		if((Password.length()>=6)&&(Password.length()<=20)){
		if(dao.updateUsernamePassword(blogger)){
			out.println("record Updated");
			Message m=new Message("Login details updated,Please Login!!","success","alert-success");
			HttpSession ss=request.getSession();
			ss.setAttribute("msg", m);
			response.sendRedirect("LoginPage.jsp");
			
		}
		else{
			Message m=new Message("Error,Login details did'nt reset,Please try again!","error","alert-danger");
			HttpSession ss=request.getSession();
			ss.setAttribute("msg", m);
			response.sendRedirect("ForgetLoginDetails.jsp");
			out.println("error");
		}
		}else{
			Message m=new Message("Password Must be 6-20 characters long.","error","alert-danger");
			HttpSession ss=request.getSession();
			ss.setAttribute("msg", m);
			response.sendRedirect("ForgetLoginDetails.jsp");
			out.println("error");
		 }
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
