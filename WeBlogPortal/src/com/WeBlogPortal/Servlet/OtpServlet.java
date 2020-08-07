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

import com.WeBlogPortal.model.Message;

/**
 * Servlet implementation class OtpServlet
 */
@WebServlet("/OtpServlet")
@MultipartConfig
public class OtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		HttpSession ss=request.getSession();
		int x=(int) ss.getAttribute("otp");
		int otp=Integer.parseInt(request.getParameter("otp"));
		if(x==otp){
			out.println("done");
			ss.removeAttribute("otp");
			response.sendRedirect("ForgetLoginDetails.jsp");
		}
		else{
			ss.removeAttribute("otp");
			Message msg=new Message("Invalid OTP! Try again","error","alert-danger");
			HttpSession session=request.getSession();
			ss.setAttribute("msg", msg);
			response.sendRedirect("LoginPage.jsp");
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}

}
