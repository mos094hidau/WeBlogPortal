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
 * Servlet implementation class RemoveProfilePic
 */
@WebServlet("/RemoveProfilePic")
public class RemoveProfilePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveProfilePic() {
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
		 BloggerDao dao=new BloggerDao(DBConnection.getConnection());
		 int id=blogger.getId();
		 PrintWriter out=response.getWriter();
		 if(dao.deleteProfilePic(id)){
				out.println("ProfilePic Removed");
				response.sendRedirect("MyProfile.jsp");	
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
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}

}
