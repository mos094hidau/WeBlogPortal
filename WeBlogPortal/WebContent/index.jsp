<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Window Page</title>
<!-- Bootstraplib -->
	<%@include file="Bootstraplib.jsp" %>
<!-- Footercss -->
	<link rel="stylesheet" href="Footercss.css">
<!--Clippath background and colour-->
	<link rel="stylesheet" href="Style.css">
</head>
<body>
	<!-- navbar -->
   		<%@include file="NormalNavbar.jsp" %>
	<!--//banner -->
		<div class="container-fluid p-0 m-0 banner-background-index primary-background">
		<div class="jumbotron">
			<div class="container">
				<h3 class="display-3">Welcome to WeB-Log Portal</h3> 
				<h3>WeB-Log</h3>
				<p> Welcome to  WeBLog Portal,World of Knowledge.
				"A Blog is an online diary of journal located on a website. The content of a Blog typically includes text, pictures, videoes animated GIF and even pdfs". A Blog is an abbreviated word for term "weblog". People use blogs is online journal to share their stories , thoughts, knowledge or anything which they find interesting and newsworthy.
	 			Some authors use to blogs to get input/feedback on their story ideas.Professional and amateur journalist use blogs to publish breaking news.
				</p>
				<p>It is a plateform where a writer or even a group of writers share their views on individual subset.  blogs are a type of website . The only real difference between a blog and other types of websites is that blogs are regularly updated with new content but a typical websites are static in nature where content is organize in pages, and they are not updated frequently.
    			Each and Every skill you need to run and manage a blog is called blogging. Blogging includes skills like Search Engine Optimization, Social Media, Marketing Writing ,Editing and Publishing posts, designing and maintaining the design of your website.
				</p>
	 			<a href="SignUp.jsp" class="btn btn-outline-light btn-lg" style="background-image: url('health-4861815_1920.jpg');"><span class="fa fa-user-plus"></span> Start ! Its Free</a>
			    <a href="LoginPage.jsp" class="btn btn-outline-light btn-lg" style="background-image: url('health-4861815_1920.jpg');"><span class="fa fa-user-circle fa-spin"></span> Login</a>
			</div>
		</div>	
	</div>
<!-- Designing -->
	 <%@include file="Design.jsp" %>

<!-- Footer -->
	<div class="footer">
    <%@include file="NormalFooter.jsp" %>
	</div>
</body>
</html>