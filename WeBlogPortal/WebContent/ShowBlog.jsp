<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.WeBlogPortal.model.Blogger" %>
<%@ page import="com.WeBlogPortal.model.Category" %>
<%@ page import="com.WeBlogPortal.dao.CategoryDao" %>
<%@ page errorPage="ErrorPage.jsp" %>
<%@ page import="com.WeBlogPortal.control.DBConnection" %>
<%@ page import="com.WeBlogPortal.dao.BlogDao" %>
<%@ page import="com.WeBlogPortal.model.Blog" %>
<%@ page import="com.WeBlogPortal.dao.BloggerDao" %>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("currentUser")==null){
	response.sendRedirect("LoginPage.jsp");
}
Blogger blogger=(Blogger)session.getAttribute("currentUser");
%>
<%
BlogDao dao=new BlogDao(DBConnection.getConnection());
int blogid=Integer.parseInt(request.getParameter("blogid"));
Blog blog=dao.getBlogbyBlogId(blogid);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= blog.getTitle() %></title>
<!-- Bootstraplib -->
	<%@include file="Bootstraplib.jsp" %>
<!-- sidebarcss -->
	<link rel="stylesheet" href="SideBarcss.css">
<!-- Profilecss -->
		<link rel="stylesheet" href="Profilecss.css">
<style>
	.post-title{
		font-weight:100;
		font-size: 30px;
	}
	.post-content{
		font-weight:100;
		font-size: 20px;
	}
	.post-date{
		font-style:italic;
	}
	.post-user{
		font-user: 15px;
	}
	.row-user{
		padding-top:15px;
		border: 1px solid #e2e2e2;
	}
	.post-img{
	height:330px;
	width:810px;
	border:4px solid #fff;
	box-shadow:0px 5px 10px rgba(0,0,0,.2);
	}
</style>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v7.0"></script>
</head>
<body>
<!-- SideBar -->
	<%@include file="SideBar.jsp" %>
<div class="sidebarcontainer container">
<!-- Search button -->
  	<%@include file="Search.jsp" %>
	<!-- Show blog main body -->
	<div class="container-fluid">
	<div class="row my-4">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-header" style="background:#e40046; color: #fff;">
				
					<h4 class="post-title"> <%= blog.getTitle() %></h4>
				</div>
				<div class="card-body">
					 <img class="card-img-top post-img" src="./DisplayBlogImage?blogid=<%= blog.getBlogid() %>" alt="Card image cap">
					 
					 <div class="row my-3 row-user">
					 	<div class="col-md-8">
					 	<%
					 	BloggerDao udao=new BloggerDao(DBConnection.getConnection());
					 	Blogger user=udao.getBloggerbyid(blog.getId());
					 	CategoryDao cat=new CategoryDao(DBConnection.getConnection());
					 	Category category=cat.getCatById(blog.getCid());
					 	%>
					 		<p class="post-user"><a href="ViewProfile.jsp?bloggerid=<%=user.getId()%>"><%=user.getFullname()%></a> has Posted: <a href="#!" style="font-style:italic;"><%=category.getCname()%></a></p>
					 	</div>
					 	<div class="col-md-4">
					 		<p class="post-date"><%= blog.getBdatetime().toLocaleString()%></p>
					 	</div>
					 </div>
					<p class="post-content"><%= blog.getContent() %></p>
					<br>
					<br>
					<div class="post-desc">
					<a href="<%= blog.getDescription() %>">	<pre> <%= blog.getDescription() %></pre></a>
					</div>
				</div>
				<div class="card-footer text-center">
					<a href="#!" class="btn btn-sm btn-outline-danger"><i class="fa fa-heart"></i> <span>10</span></a>
					<a href="#!" class="btn btn-sm btn-outline-danger"><i class="fa fa-commenting-o"></i> <span>10</span></a>
					<a href="#!" class="btn btn-sm btn-outline-danger"><i class="fa fa-share-square-o"></i> <span>10</span></a>
				</div>
				<div class="card-footer">
					<div class="fb-comments" data-href="http://localhost:8080/WeBlogPortal/ShowBlog.jsp?blogid=<%= blog.getId() %>" data-numposts="5" data-width=""></div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	<!-- Models -->
	<%@include file="Models.jsp" %>
</body>
</html>