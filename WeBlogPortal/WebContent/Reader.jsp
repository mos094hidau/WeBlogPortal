<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.WeBlogPortal.model.Category" %>
<%@ page import="com.WeBlogPortal.dao.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.WeBlogPortal.control.DBConnection" %>
<%@ page import="com.WeBlogPortal.model.Blogger" %>
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
<title>Public Posts</title>
		<!-- Bootstraplib -->
		<%@include file="Bootstraplib.jsp" %>
		<!-- sidebarcss -->
		<link rel="stylesheet" href="SideBarcss.css">
		<!-- Profilecss -->
		<link rel="stylesheet" href="Profilecss.css">
		<style>
			.c-link.active{
			background: #e40046; 
			color: #fff;
			}
		</style>
</head>
<body>
	<!-- SideBar -->
	<%@include file="SideBar.jsp" %>
	<div class="sidebarcontainer">
	<!-- Search button -->
  	<%@include file="Search.jsp" %>
		<!-- Reader/Home -->
	<main class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<div class="list-group list-group-flush">
  			<a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active" >
   					 All Posts
 			 </a>
 			 			<%
 			 			CategoryDao cdao=new CategoryDao(DBConnection.getConnection());
  						ArrayList<Category> list=cdao.categoryList();
  						for(Category c:list)
  						{
  						%>
  						<a href="#" onclick="getPosts(<%= c.getCid() %>,this)" class=" c-link list-group-item list-group-item-action"  style="color: #9e9e9e"><%=c.getCname() %></a>
  						<%
  						}
  						%>
  			
			</div>
		</div> 
		<div class="col-md-10">
			<div class="container text-center" id="loader" style="color:#90caf9;">
			  <i class="fa fa-spinner fa-4x fa-spin"></i>
			  <h5 class="mt-2">Loading...</h5>
			</div>
			<div class="container-fluid" id="blog-container">
			</div>
		</div>
		</div>
	</main>
<!-- Loading blog js -->
<script>
function getPosts(catId,temp){
	$("#loader").show();
	$("#blog-container").hide();
	$(".c-link").removeClass('active');
	$.ajax({
		url: "LoadBlog.jsp",
		data: {cid: catId},
		success: function(data,textStatus,jqXHR){
			  console.log(data);
			  $("#loader").hide();
			  $("#blog-container").show();
			  $('#blog-container').html(data)
			  $(temp).addClass('active');
		}
  })
}
$(document).ready(function(){
	let allPostRef=$('.c-link')[0]
	getPosts(0,allPostRef)
});
</script>
</div>
<!-- Models -->
	<%@include file="Models.jsp" %>
</body>
</html>