<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page errorPage="ErrorPage.jsp" %>
<%@ page import="com.WeBlogPortal.model.Blogger" %>
<%@ page import="com.WeBlogPortal.model.Message" %>
<%@ page import="com.WeBlogPortal.control.DBConnection" %>
<%@ page import="com.WeBlogPortal.dao.BlogDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WeBlogPortal.model.Blog" %>
<%@ page import="com.WeBlogPortal.dao.BloggerDao" %>
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
	<title>Blogging Profile</title>
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
	<!-- Models -->
	<%@include file="Models.jsp" %>
		<div class="container sidebarcontainer">
		<!-- Search button -->
  	   <%@include file="Search.jsp" %>
			<!-- view Profile -->
			<div class="profile-header">
			<div class="profile-img">
        			<img src="./ProfileServlet?bid=<%=blogger.getId()%>" width="200" alt="">	
			</div>
			<div class="profile-navinfo">
					<h3 class="user-name"><%= blogger.getFullname() %></h3>
					<div class="address">
						<p class="state"><%if(blogger.getState()!=null){%><%=blogger.getState()%>,<%}%></p>
						<p class="country"><%if(blogger.getCountry()!=null){%><%=blogger.getCountry()%><%} %></p>
					</div>
					<div class="address">
					<%
						BlogDao dao=new BlogDao(DBConnection.getConnection());
						int blogcount=dao.blogCountbyUserId(blogger.getId());
                     %>
						<a class="post"><h3 class="user-name">Post: <%=blogcount %></h3></a>
						<a class="following"><h3 class="user-name">Follower: 0</h3></a>
						<a class="following"><h3 class="user-name">Following: 0</h3></a>
						<a class="following"><h3 class="user-name">My Likes: 0</h3></a>
					</div>
			</div>
			
			<div class="profile-option">
			<a  href="#!" class="icon-wrap3 camera" data-toggle="modal" data-target="#uploadProfileModal">
						<i class="fa fa-camera" aria-hidden="true"></i>
						
			</a>
				<a class="icon-wrap1 notification" href="#!" data-toggle="modal" data-target="#notificationiconclick">
						<i class="fa fa-bell" aria-hidden="true"></i>
						<span class="alert-message">1</span>
			</a>
			<a class="icon-wrap2 setting" href="#!" data-toggle="modal" data-target="#settingiconclick">
						<i class="fa fa-gear" aria-hidden="true"></i>
			</a>
			
			</div>
		</div>
		<div class="main-body">
			<div class="left-side">
				<div class="profile-side">
					<p class="user-name">
						<i class="fa fa-user"></i>
					    <%= blogger.getUsername() %>
					</p>
					
					<p class="user-mail">
						<i class="fa fa-envelope"></i>
					   <%= blogger.getEmailid() %>
					</p>
					<p class="user-address">
						<i class="<% if(blogger.getGender().equals("Male")){%>fa fa-male<%}else{%>fa fa-female<%}%>"></i>
						<%=blogger.getGender()%>
					</p>
					<p class="mobile-no">
						<i class="fa fa-phone"></i>
					   <%if(blogger.getMobile()==0){%>...............<%}else{%><%= blogger.getMobile() %><%} %>
					</p>
					<p class="user-address">
						<i class="fa fa-address-card"></i>
						<%if(blogger.getAddress()==null){%>.......<%}else{%><%= blogger.getAddress() %>,<%} %>
						<%if(blogger.getCity()==null){%>.......<%}else{%><%= blogger.getCity() %><%}%>
					</p>
					
					<div class="user-bio">
					    <h3>Bio</h3>
						<p class="bio">
					  <%if(blogger.getDescription()==null){%>..........<%}else{%><%=blogger.getDescription()%><%} %>
						</p>
					</div>
					<div class="profile-btn">
							<button class="chatbtn" ><i class="fa fa-comment"></i>Chat</button>
							<button class="createbtn"><i class="fa fa-plus"></i>Write</button>
					</div>
					<script>
					$(document).ready(function(){
						$('.createbtn').on('click',function(){
							 window.location="CreateBlog.jsp"
						})
						$('.chatbtn').on('click',function(){
							 window.location="CreateBlog.jsp"
						})  
					});
					</script>
					
					<div class="user-rating">
						<h3 class="rating">4.5</h3>
						<div class="rate">
							<div class="stars">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<span class="no-user">
								<span>123</span>&nbsp;&nbsp; reviews</span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="right-side">
				<div class="container">
				<br><div class="row">
					<%
					List<Blog> blogs=null;
					blogs=dao.getBlogsbyUserid(blogger.getId());
					if(blogs.size()==0){
						out.println("<h6 class='display-2 text-center' style='color:#90caf9; padding-left:150px;' >No posts</h6>");
						return;
					}

					for(Blog blog:blogs){
					    
					%>
					<div class="col-md-6">
					<div class="card">
	 				<img class="card-img-top cardimg" src="./DisplayBlogImage?blogid=<%= blog.getBlogid()%>" alt="Card image cap" style="height:230px; border:4px solid #fff; box-shadow:0px 5px 10px rgba(0,0,0,.2);">
					<div class="card-body">
		 			<div class="row  row-user" style="font-size: 12px;">
					 	<div class="col-md-8">
					 	<%
					 	BloggerDao udao=new BloggerDao(DBConnection.getConnection());
					 	Blogger user=udao.getBloggerbyid(blog.getId());
					 	%>
					 		<p class="post-user"><a href="ViewProfile.jsp?userid=<%= user.getId() %>"><%=user.getFullname()%></a> has Posted:  <a href="#!" style="font-style:italic;"></a></p>
					 	</div>
					 	<div class="col-md-4" style="font-size: 10px; font-style:italic;">
					 		<p class="post-date"><%= blog.getBdatetime().toLocaleString()%></p>
					 	</div>
					</div>
		
					<b><%= blog.getTitle() %></b>
					<p><%= blog.getContent() %></p>
					</div>
					<div class="card-footer text-center">
					<a href="#!" class="btn btn-sm btn-outline-danger"><i class="fa fa-heart"></i> <span>10</span></a>
					<a href="#!" class="btn btn-sm btn-outline-danger"><i class="fa fa-commenting-o"></i> <span>10</span></a>
					<a href="#!" class="btn btn-sm btn-outline-danger"><i class="fa fa-share-square-o"></i> <span>10</span></a>
					<a href="ShowBlog.jsp?blogid=<%= blog.getBlogid() %>" class="btn btn-sm btn-outline-danger">Read More..</a>
		</div>
	
	</div>
<br>
</div>


<% 
}
%>
</div>
				
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>