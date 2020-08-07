<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.WeBlogPortal.model.Blogger" %>
<%@ page errorPage="ErrorPage.jsp" %>
<%@ page import="com.WeBlogPortal.model.Message" %>
<%
String Emailid=(String)session.getAttribute("User");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forget Login Details</title>
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
 	<main class="d-flex align-items-center banner-background-forgetdetails" style="height:80vh; background:#eeeeee !important;">
		<div class="container ">
			<div class="row">	
				<div class="col-md-5 offset-md-4">
				<div class="card">
				<div class="card-header text-white text-center" style="background-image: url('health-4861815_1920.jpg');">
				<span class="fa fa-lock fa-3x"></span>
							<b>
						    <p>Reset your login details</p>
							</b>
					<br>
				</div>
				<!-- For printing alert msg on loginpage -->
							<%
   							 Message m=(Message)session.getAttribute("msg");
   							if(m!=null)
   							{
							%>
							<div class="alert <%=m.getCssClass() %>" role="alert">
  							<%= m.getContent() %>
							</div>
  							<%
     						session.removeAttribute("msg");
    						}
   							 %>
				<div class="card-body">

				<form action="./ForgetLoginDetails" method="Post">
			<div class="form-group row">
    	<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
    		<div class="col-sm-10">
    		
      		<input type="text" readonly class="form-control-plaintext" name="emailid" id="staticEmail" value="<%=Emailid%>">
      		
    	</div>
  	</div>
  		<div class="form-group">
    	<label for="exampleUsername">Set Username</label>
   		<div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">@</span>
        </div>
        <input type="text" class="form-control" name="username" placeholder="Username" aria-describedby="inputGroupPrepend" required>
      </div>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Set Password</label>
    <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Password" required>
  </div>
  <button type="submit" class="btn btn-outline-light btn-lg" style="background-image: url('health-4861815_1920.jpg');">Submit</button><br>
</form>
</div>
<div class=card-footer>

</div>
</div>
</div>
</div>
</div>
</main>
<!-- Designing -->
	 <%@include file="Design.jsp" %>

<!-- Footer -->
	<div class="footer">
    <%@include file="NormalFooter.jsp" %>
	</div>
</body>
</html>