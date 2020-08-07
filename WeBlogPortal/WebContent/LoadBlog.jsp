<%@ page import="com.WeBlogPortal.control.DBConnection" %>
<%@ page import="com.WeBlogPortal.dao.BlogDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WeBlogPortal.model.Blog" %>
<%@ page import="com.WeBlogPortal.model.Category" %>
<%@ page import="com.WeBlogPortal.dao.CategoryDao" %>
<%@ page import="com.WeBlogPortal.model.Blogger" %>
<%@ page import="com.WeBlogPortal.dao.BloggerDao" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.io.*" %>
<div class="row">
<%
Thread.sleep(1000);
BlogDao dao=new BlogDao(DBConnection.getConnection());
List<Blog> blogs=null;
int cid=Integer.parseInt(request.getParameter("cid"));
if(cid==0){
blogs=dao.getAllBlogs();
}else{
blogs=dao.getBlogsbycid(cid);
}
if(blogs.size()==0){
	out.println("<h6 class='display-2 text-center' style='color:#90caf9; padding-left:30px;'>No posts in this category</h6>");
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