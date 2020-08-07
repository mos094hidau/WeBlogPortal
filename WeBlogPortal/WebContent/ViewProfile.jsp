<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="com.WeBlogPortal.model.Blogger" %>
<%@ page import="com.WeBlogPortal.model.Message" %>
<%@ page import="com.WeBlogPortal.control.DBConnection" %>
<%@ page import="com.WeBlogPortal.dao.BlogDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WeBlogPortal.model.Blog" %>
<%@ page import="com.WeBlogPortal.dao.BloggerDao" %>
<%@ page import="com.WeBlogPortal.dao.FollowDao" %>

<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("currentUser")==null){
	response.sendRedirect("LoginPage.jsp");
}

Blogger blogger=(Blogger)session.getAttribute("currentUser");
int userid=Integer.parseInt(request.getParameter("userid"));
BloggerDao udao=new BloggerDao(DBConnection.getConnection());
Blogger bl=udao.getBloggerbyid(userid);
if(blogger.getId()==bl.getId()){
	response.sendRedirect("MyProfile.jsp");
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Blogger Profile</title>
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
			<!-- view Profile -->
			<div class="profile-header">
			<div class="profile-img">
        			<img src="./ProfileServlet?bid=<%=bl.getId()%>" width="200" alt="">	
			</div>
			<div class="profile-navinfo">
					<h3 class="user-name"><%= bl.getFullname() %></h3>
					<div class="address">
						<p class="state"><%if(bl.getState()!=null){%><%=bl.getState()%>,<%}%></p>
						<p class="country"><%if(bl.getCountry()!=null){%><%=bl.getCountry()%><%} %></p>
					</div>
					<div class="address">
					<%
						BlogDao dao=new BlogDao(DBConnection.getConnection());
						int blogcount=dao.blogCountbyUserId(bl.getId());
                     %>
						<a class="post"><h3 class="user-name">Post: <%=blogcount %></h3></a>
						<a class="following"><h3 class="user-name">Follower: 0</h3></a>
						<a class="following"><h3 class="user-name">Following: 0</h3></a>
					</div>
			</div>
			
			<div class="profile-option">
			<a  href="./FollowServlet?bid=<%= bl.getId() %>"  class="wrap3 btn-sm" id="follow-btn">
						Follow
						
			</a>
				<a class="wrap1 btn-sm" href="" id="Unfollow-btn">
						UnFollow
			</a>
			<a class="wrap2 btn-sm" href="#!" id="cancel-btn">
						Requested
			</a>
			
			</div>
		
			<script>
				
				
				$('#follow-btn').on('submit',function(event){
					//prevent for directly send to the servlet
					console.log("loades")
				
					event.preventDefault();	
					//create object of this form
			       //    $ ("#submit-btn").hide();
			       //    $ ("#loader").show();	
					
					//send this form data to the servlet
					$.ajax({
						url: "FollowServlet",
						type: 'get',
						data: {bid: bid},
						success: function(data,textStatus,jqXHR){
							console.log(data)
						//	 $ ("#submit-btn").show();
					     //      $ ("#loader").hide();
					           if(data.trim()==='done'){
					           swal("Registered Successfully! We are going to redirect to login page")
					           .then((value)=>{
					             window.location="#"
					           });
					           }else{
					        	   swal(data)
					           }
						},
						error: function(jqXHR,textStatus,errorThrown){
							swal("Something Went Wrong..Please try again!");
						//	 $ ("#submit-btn").show();
					    //       $ ("#loader").hide();
						},
						processData: false,
					    contentType: false
					});
					
				});
						
				}))
			
			</script>
			
			
			<%
			FollowDao f=new FollowDao(DBConnection.getConnection());
			String requeststatus=f.getRequestStatus(blogger.getId(),bl.getId());
			%>
			
			
		</div>
		<script>
			
		</script>
		
		<div class="main-body">
			<div class="left-side">
				<div class="profile-side">
					<p class="user-name">
						<i class="fa fa-user"></i>
					    <%= bl.getUsername()%>
					</p>
					
					<p class="user-mail">
						<i class="fa fa-envelope"></i>
					   <%= bl.getEmailid() %>
					</p>
					<p class="user-address">
						<i class="<% if(bl.getGender().equals("Male")){%>fa fa-male<%}else{%>fa fa-female<%}%>"></i>
						<%=bl.getGender()%>
					</p>
					<p class="mobile-no">
						<i class="fa fa-phone"></i>
					   <%if(bl.getMobile()==0){%>...............<%}else{%><%= bl.getMobile() %><%} %>
					</p>
					<p class="user-address">
						<i class="fa fa-address-card"></i>
						<%if(bl.getAddress()==null){%>.......<%}else{%><%= bl.getAddress() %>,<%} %>
						<%if(bl.getCity()==null){%>.......<%}else{%><%= bl.getCity() %><%}%>
					</p>
					
					<div class="user-bio">
					    <h3>Bio</h3>
						<p class="bio">
					  <%if(bl.getDescription()==null){%>..........<%}else{%><%=bl.getDescription()%><%} %>
						</p>
					</div>
					
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
					blogs=dao.getBlogsbyUserid(bl.getId());
					if(blogs.size()==0){
						out.println("<h6 class='display-2 text-center' style='color:#90caf9; padding-left:150px;'>No posts</h6>");
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
	
<!-- Models -->
	<%@include file="Models.jsp" %>
</body>
</html>