
package com.WeBlogPortal.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WeBlogPortal.control.DBConnection;
import com.WeBlogPortal.dao.BloggerDao;

/**
 * Servlet implementation class MailServlet
 */
@MultipartConfig
@WebServlet("/MailServlet")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailServlet() {
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
		String Emailid=request.getParameter("emailid");
		String otp=request.getParameter("otp");
		PrintWriter out=response.getWriter();
		 if(Emailid.equals(null)){
		    	System.out.println("Please enter Your Emailid");
		 }
		 else{
			  BloggerDao dao=new BloggerDao(DBConnection.getConnection());
				if(dao.Authenticateemail(Emailid)){
					//success
					out.println("done");
					HttpSession ss=request.getSession();
					ss.setAttribute("User",Emailid );
					response.sendRedirect("ForgetLoginDetails.jsp");
		           }
				else{
					
					//login error
					 out=response.getWriter();
					 out.println("Invalid Emailid");
					response.sendRedirect("LoginPage.jsp");
				}
				
		 }
		int x=(int) (Math.random() * ((999999 - 100000) + 1)) +100 ;//[Math.random() * ((Max-Min)+1)) + Min]//Generate random number
		out.println(x);
		HttpSession ss=request.getSession();
		ss.setAttribute("otp", x);
		//Mail connectivity code
		//set the properties- Connectivity details
		Properties properties=System.getProperties();
		properties.setProperty("mail.smtp.host","smtp.gmail.com");
		properties.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		properties.setProperty("mail.smtp.socketFactory.fallback","false");
		properties.setProperty("mail.smtp.port","465");
		properties.setProperty("mail.smtp.socketFactory.port","465");
		//set the properties -Auth ,Protocol details
		
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.debug", "true");
		properties.put("mail.store.protocol", "pop3");
		properties.put("mail.transport.protocol", "smtp");
		 
		
		String authenticateUsername="mosamhidau@gmail.com";
		String authenticatePassword="radhaswamimosam";
		Authenticator authenticator=new Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(authenticateUsername,authenticatePassword);
			}
		};
			
		
		//Create session object
		Session session=Session.getDefaultInstance(properties, authenticator);
		
		//create Message Object
		Message message=new MimeMessage(session);
			
			
		//set mail related properties of to message object
			try {
				try{
				message.setFrom(new InternetAddress("mosamhidau@gmail.com"));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(Emailid, false));
				message.setSubject("Password reset mail");
				message.setText("OTP is ::::::"+x);
				message.setSentDate(new Date());
				
				//send Message
				Transport.send(message);
				System.out.println("Successful send");
				out.println("<center><h1>Your OTP is successfully send</h1></center>");
				}catch(AddressException e){
					e.printStackTrace();
				}
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
	
		
	}
			doGet(request, response);
	}
}
