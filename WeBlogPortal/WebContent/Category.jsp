<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.WeBlogPortal.model.Category" %>
<%@ page import="com.WeBlogPortal.dao.CategoryDao" %>
<%@ page import="com.WeBlogPortal.model.Blogger" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.WeBlogPortal.control.DBConnection" %>
<%@ page errorPage="ErrorPage.jsp" %>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("currentUser")==null){
	response.sendRedirect("LoginPage.jsp");
}
Blogger blogger=(Blogger)session.getAttribute("currentUser");
%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Categories</title>
	<!-- Bootstraplib -->
	<%@include file="Bootstraplib.jsp" %>
	<!-- Profilecss -->
	<link rel="stylesheet" href="Profilecss.css">
	<!-- sidebarcss -->
	<link rel="stylesheet" href="SideBarcss.css">
	</head>
<body>
<!-- SideBar -->
	<%@include file="SideBar.jsp" %>
	<div class="container sidebarcontainer">
	<!-- Search button -->
  	<%@include file="Search.jsp" %>
		<!-- Category Portion -->
		<div class="container-fluid">
		<div class="row">
		<div class="col-md-3">
			<div class="list-group list-group-flush">
  			<a href="#" class="list-group-item list-group-item-action active" style="background: #e40046; color:#fff;">
   					 Categories
 			 </a>
 			 			<%
 			 			CategoryDao cdao=new CategoryDao(DBConnection.getConnection());
  						ArrayList<Category> list=cdao.categoryList();
  						for(Category c:list)
  						{
  						%>
  						<a class="list-group-item list-group-item-action" style="color: #9e9e9e" href="#list-item-<%=c.getCid()%>"><%=c.getCname() %></a>
  						<%
  						}
  						%>
  			
				</div>
		</div>
		<div class="col-md-9">
			<div data-spy="scroll" data-target="#list-example" data-offset="0" class="scrollspy-example">
						<%
  						for(Category c:list)
  						{
  						%>
  					<h4 id="list-item-<%=c.getCid()%>">Item <%=c.getCname()%></h4>
  					<p>"A Blog is an online diary of journal located on a website. The content of a Blog typically includes text, pictures, videoes animated GIF and even pdfs". A Blog is an abbreviated word for term "weblog". People use blogs is online journal to share their stories , thoughts, knowledge or anything which they find interesting and newsworthy.
	 			      Some authors use to blogs to get input/feedback on their story ideas.Professional and amateur journalist use blogs to publish breaking news.</p>
  					<%
  						}
  						%>
			</div>
		</div>
	</div>
</div>
</div>
<!-- Models -->
		<%@include file="Models.jsp" %>
</body>
</html>