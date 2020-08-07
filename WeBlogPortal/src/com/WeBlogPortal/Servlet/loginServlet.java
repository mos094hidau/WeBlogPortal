package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;

import javax.servlet.RequestDispatcher;
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
import com.WeBlogPortal.model.Message;

@WebServlet("/loginServlet")
@MultipartConfig
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out;
		String Username = request.getParameter("username");
	    String Password = request.getParameter("password"); 
	    if(Username.equals(null)&&Password.equals(null)){
	    	System.out.println("Please enter Username and Password");
	    }else{
	    	
			BloggerDao dao=new BloggerDao(DBConnection.getConnection());
			if(dao.authenticate(Username,Password)){
				//success
				HttpSession ss=request.getSession();
				Blogger blogger=new Blogger(Username,Password);
				ss.setAttribute("currentUser", blogger);
				RequestDispatcher rd=request.getRequestDispatcher("./showDetails");
				rd.forward(request, response);
	           }
			else{
				//login error
				 out=response.getWriter();
			    out.println("Invalid Details,Please try again!");
				Message msg=new Message("Invalid Details! Try with another","error","alert-danger");
				HttpSession ss=request.getSession();
				ss.setAttribute("msg", msg);
				response.sendRedirect("LoginPage.jsp");
			}
	    }	
		doGet(request, response);
	}
}
