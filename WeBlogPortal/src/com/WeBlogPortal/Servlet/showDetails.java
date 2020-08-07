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
 * Servlet implementation class showDetails
 */
@WebServlet("/showDetails")
public class showDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showDetails() {
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
		
		doGet(request, response);
	}
	 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		 HttpSession ss=request.getSession();
		 Blogger blogger=(Blogger)ss.getAttribute("currentUser");
		 String Username=blogger.getUsername();
		 String Password=blogger.getPassword();
		 BloggerDao dao=new BloggerDao(DBConnection.getConnection());
		 Blogger b=dao.fetchData(Username, Password);
		 if(b==null){
			 response.sendRedirect("LoginPage.jsp");
		 }else{
			 blogger.setId(b.getId());
			 blogger.setFullname(b.getFullname());
			 blogger.setGender(b.getGender());
			 blogger.setAddress(b.getAddress());
			 blogger.setCity(b.getCity());
			 blogger.setState(b.getState());
			 blogger.setCountry(b.getCountry());
			 blogger.setDescription(b.getDescription());
			 blogger.setEmailid(b.getEmailid());
			 blogger.setMobile(b.getMobile());
			 blogger.setProfilepic(b.getProfilepic());
			 blogger.setLastlogin(b.getLastlogin());
			 blogger.setProfilestatus(b.getProfilestatus());
			 blogger.setRegdate(b.getRegdate());
			 blogger.setPassword(b.getPassword());
			 blogger.setUsername(b.getUsername());
			 response.sendRedirect("BloggerDashBoard.jsp");
		 }
		 
}
}