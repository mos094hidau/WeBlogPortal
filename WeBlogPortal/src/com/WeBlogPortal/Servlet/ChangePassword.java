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

/**
 * Servlet implementation class ChangePassword
 */
@MultipartConfig
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
		String OldPassword=request.getParameter("oldpassword");
		String NewPassword=request.getParameter("newpassword");
		String Confirmpassword=request.getParameter("confirmpassword");
		 HttpSession ss=request.getSession();
		 Blogger blogger=(Blogger)ss.getAttribute("currentUser");
		 BloggerDao dao=new BloggerDao(DBConnection.getConnection());
		 int id=blogger.getId();
		 PrintWriter out=response.getWriter();
		if(OldPassword.equals(blogger.getPassword())){
		if((NewPassword.length()>=6)&&(NewPassword.length()<=20))
		{
			if(NewPassword.equals(Confirmpassword)){
				if(dao.changePassword(id,NewPassword)){
					out.println("password changed");
					
				}
				else{
					out.println("error");
				}
			}else{
				out.println("Password field and confirm password field are not same");
			}
		 }else{
			out.println("Password Must be 6-20 characters long.");
		 }
		}else{
			out.println("Old password is not correct");
		}
		doGet(request, response);
	}

}
