package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
import com.WeBlogPortal.dao.FollowDao;
import com.WeBlogPortal.model.Blogger;

/**
 * Servlet implementation class FollowServlet
 */
@MultipartConfig
@WebServlet("/FollowServlet")
public class FollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
		HttpSession session=request.getSession();
		HttpSession followsession=request.getSession();
		Blogger blogger=(Blogger)session.getAttribute("currentUser");
		PrintWriter out=response.getWriter();
		int userid=Integer.parseInt(request.getParameter("bid"));
		
		BloggerDao bdao=new BloggerDao(DBConnection.getConnection());
		String profilestatus=bdao.getProfilestatus(userid);
		int followerid=blogger.getId();
		
		String requeststatus;
		if(profilestatus.equals("public")){
			requeststatus="true";
			FollowDao dao=new FollowDao(DBConnection.getConnection());
			if(dao.followUser(userid, followerid,requeststatus)){
				request.setAttribute("id", userid);
				rd=request.getRequestDispatcher("viewProfile.jsp");
				rd.forward(request, response);
			 //out.println("done");
			}
			else{
				out.println("error");
			}	
        }else{
        	requeststatus="false";
			FollowDao dao=new FollowDao(DBConnection.getConnection());
			if(dao.followUser(userid, followerid,requeststatus)){
				//followsession.setAttribute("followuser",userid);
			//	out.println("done");
			//	response.sendRedirect("ViewProfile.jsp");
				request.setAttribute("id", userid);
				rd=request.getRequestDispatcher("viewProfile.jsp");
				rd.forward(request, response);
			}
			else{
				out.println("error");
			}	
        }
		
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}

}
