package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.WeBlogPortal.control.DBConnection;
import com.WeBlogPortal.dao.BloggerDao;
import com.WeBlogPortal.model.Blogger;

@WebServlet("/registerServlet")
@MultipartConfig
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Check=request.getParameter("check");
		PrintWriter out=response.getWriter();
		if(Check==null){
			out.println("Box not checked");
		}
		else{
			try{
			String Fullname=request.getParameter("fullname");
			String Username=request.getParameter("username");
			String Emailid=request.getParameter("emailid");
			String gender=request.getParameter("gender");
			String Password=request.getParameter("password");
			String Confirmpassword=request.getParameter("confirmpassword");
			  if(Fullname.replaceAll("\\s","").matches("^[a-zA-Z]*$")){
				if((Password.length()>=6)&&(Password.length()<=20))
				{
					if(Password.equals(Confirmpassword)){
						Blogger blogger=new Blogger(Username,Fullname,Emailid,Password,gender);
						BloggerDao dao=new BloggerDao(DBConnection.getConnection());
						if(dao.register(blogger)){
							Thread.sleep(1000);
							out.println("record inserted");
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
				out.println("Name Must have character only");
			}
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		doGet(request, response);
	}

}
