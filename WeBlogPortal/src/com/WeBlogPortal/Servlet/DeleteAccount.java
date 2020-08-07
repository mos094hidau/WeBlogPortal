package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
import com.WeBlogPortal.model.Message;

/**
 * Servlet implementation class DeleteAccount
 */
@WebServlet("/DeleteAccount")
@MultipartConfig
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccount() {
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
		HttpSession ss=request.getSession();
		Blogger blogger=(Blogger)ss.getAttribute("currentUser");
		int id =blogger.getId();
		String emailid=blogger.getEmailid();
		BloggerDao dao=new BloggerDao(DBConnection.getConnection());
		if(dao.deleteAccount(id, emailid)){
			ss.removeAttribute("currentUser");
			Message m=new Message("Account deleted successfully!","success","alert-danger");
			ss.setAttribute("msg", m);
			response.sendRedirect("LoginPage.jsp");
		}else{
			PrintWriter out=response.getWriter();
			out.println("Account not deleted");
		}
		doGet(request, response);
	}

}
