<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.WeBlogPortal.model.Category" %>
<%@ page import="com.WeBlogPortal.dao.CategoryDao" %>
<%@ page import="com.WeBlogPortal.control.DBConnection" %>
<%@ page errorPage="ErrorPage.jsp" %>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("currentUser")==null){
	response.sendRedirect("LoginPage.jsp");
}
Blogger blogger=(Blogger)session.getAttribute("currentUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Blog</title>
	<!-- Bootstraplib -->
		<%@include file="Bootstraplib.jsp" %>
		<!-- sidebarcss -->
		<link rel="stylesheet" href="SideBarcss.css">
		<!-- Profilecss -->
		<link rel="stylesheet" href="Profilecss.css">
</head>
<body>
<!-- SideBar -->
	<%@include file="SideBar.jsp" %>
<div class="sidebarcontainer">
<!-- Search button -->
  	<%@include file="Search.jsp" %>
<!-- create Blog -->	
  <div class="card">
  		<div class="card-header">
  		</div>
  		<div class="card-body">
  			<form action="./CreateBlog" method="post" id="create-blog" enctype="multipart/form-data">
  				<div class="form-group">
  					<select class="form-control" name="cid">
  						<option selected disabled>---Select Category---</option>
  						<%
  						CategoryDao cdao=new CategoryDao(DBConnection.getConnection());
  						ArrayList<Category> list=cdao.categoryList();
  						for(Category c:list)
  						{
  						%>
  						<option value="<%= c.getCid() %>"><%=c.getCname() %></option>
  						<%
  						}
  						%>
  					</select>
  				</div>
  				<div class="form-group">
  					<input type="text" placeholder="Enter blog title" class="form-control" name="title"> 
  				</div>
  				<div class="form-group">
  					<textarea class="form-control" placeholder="Type your content" style="height:200px;" name="content"></textarea>
  				</div>
  				<div class="form-group">
  					<textarea class="form-control" placeholder="Enter your description/Program/links (if any)" style="height:200px;" name="links"></textarea>
  				</div> 
  				<div class="row">
  				<div class="col">
  				<div class="form-group">
  					<label>Select Pictures</label>
  					<input type="file" name="pictures" multiple>
  				</div>
  				<div class="form-group">
  					<label>Select Pdfs</label>
  					<input type="file" name="pdfs" multiple>
  				</div>
  				</div>
  				<div class="col">
  				</div>
  				</div>
  				<div class="form-group">
  					<button type="submit" class="btn btn-lg btn-block" id="submit" name="submitbtn">Post</button>
  				</div>
  			</form>
  		</div>
  		<div class="card-footer">
  		</div>
</div>
<br>
<!-- Create Blog js -->
<script>
$(document).ready(function(){
	console.log("loaded..")
	$('#create-blog').on('submit',function(event){
		event.preventDefault();
		let blogdata = new FormData(this);
		$.ajax({
			url: "CreateBlog",
			type: 'post',
			data: blogdata,
			
			success: function(data,textStatus,jqXHR){
				  console.log(data)
				 if(data.trim()=='done'){
					 swal("Good job!", "Blog created successfully!", "success");
					 window.location("BloggerDashBoard.jsp")
				 }
				 else{
					 swal("Error!!", "Something went wrong", "error");
				 }
				  
			},
			error:function(jqXHR,textStatus,errorThrown){
				console.log(jqXHR)
				swal("Profile can't be edited");
			},
			processData: false,
		    contentType: false
		});	
	});
});	

</script>
<!-- End of Create Blog -->
</div>
<!-- Models -->
	<%@include file="Models.jsp" %>
</body>
</html>