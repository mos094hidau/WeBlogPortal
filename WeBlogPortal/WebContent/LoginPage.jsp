<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.WeBlogPortal.model.Message" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
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
	<main class="d-flex align-items-center banner-background-login" style="height:80vh; background:#eeeeee !important;">
		<div class="container">
			<div class="row">
				<div class="col-md-5 offset-md-4">
					<div class="card">
						<div class="card-header text-white text-center" style="background-image: url('health-4861815_1920.jpg');">
							<span class="fa fa-user-plus fa-3x"></span>
							<b>
						    <p>Login to your Account</p>
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
						<form action="./loginServlet" method="Post">
 							<div class="form-group">
    							<label for="exampleUsername">Username</label>
   								<div class="input-group">
       					 		<div class="input-group-prepend">
          						<span class="input-group-text" id="inputGroupPrepend">@</span>
        						</div>
        						<input type="text" class="form-control" name="username" placeholder="Username" aria-describedby="inputGroupPrepend" required>
     							 </div>
  							</div>
  							<div class="form-group">
   								 <label for="exampleInputPassword1">Password</label>
    							 <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Password">
 							</div>
 							 <div class="form-check">
   								 <input type="checkbox" class="form-check-input" id="exampleCheck1">
    							 <label class="form-check-label" for="exampleCheck1">Check me out</label>
  							</div>
  							<button type="submit" class="btn btn-outline-light btn-lg" style="background-image: url('health-4861815_1920.jpg');">Submit</button><br>
  							<a href="#!" id="forget-pass" data-toggle="modal" data-target="#ForgetDetails">Forget Username or Password?</a><hr>
 							<a type="button" class="btn btn-info btn-lg btn-block btn-danger" href="SignUp.jsp">Create New Account</a>
						</form>
				</div>
				<div class="card-footer">
				</div>
			</div>
		</div>
	</div>
</div>
</main>

<!--  Forget Details Modal -->
<div class="modal fade" id="ForgetDetails" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" id="model-container">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-white text-center" style="background-image: url('health-4861815_1920.jpg');">
        <h5 class="modal-title" id="exampleModalLongTitle">Forget Login Details?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
           <form action="./MailServlet" method="post" id="email-form" >
  					<div class="form-group">
    				<label for="exampleInputEmail1">Enter your Email address</label>
    				<input type="email" class="form-control" id="emailid" name="emailid" aria-describedby="emailHelp" placeholder="Enter email">
    				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  					</div>
  					<div class="container text-center" id="loader" style="display:none; color:#90caf9;">
 							<span class="fa fa-rotate-right fa-spin fa-4x"></span>
 							<h4>Please wait..</h4>
					 </div>	
		         <button class="btn btn-lg btn-outline-light" id="submit-btn" type="submit" style="background-image: url('health-4861815_1920.jpg');">Submit</button>
		 </form> 
		 <form id="otp-group" action="./OtpServlet">
		 	<div class="form-group otp-group">
  					<label>Enter OTP</label>
    				<input type="text" class="form-control" id="otp" name="otp" placeholder="Enter OTP">
    				<hr>
  					<button type="submit" class="btn btn-lg btn-outline-light text-white" id="otp-submit-btn" style="background-image: url('health-4861815_1920.jpg');">OTPsubmit</button>
		          </div>
		 </form>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function(){
	console.log("loaded..")
	 $('#otp-group').hide();
	 $ ("#loader").hide();
	$('#email-form').on('submit',function(event){
		event.preventDefault();
		let myform=new FormData(this);
		 $ ("#loader").show();
		$.ajax({
			url: "MailServlet",
			type: 'post',
			data: myform,
			success: function(data,textStatus,jqXHR){
				  console.log(data)
				  swal("We're sending an OTP to your email address")
		           .then((value)=> {
		        	   $ ("#loader").hide();
		        	   $('#email-form').hide();
		        	   $('#otp-group').show();
					   $('#submit-btn').hide(); 
		           });
				 
				 
			},
			error:function(jqXHR,textStatus,errorThrown){
				console.log(jqXHR)
				swal("Invalid Emailid..!!");
			},
			processData: false,
		    contentType: false
		});
		
	});
	

});
</script>
<!-- End of Model -->
<!--Designing-->
	 <%@include file="Design.jsp" %>

<!-- Footer -->
	<div class="footer">
    <%@include file="NormalFooter.jsp" %>
	</div>
</body>
</html>