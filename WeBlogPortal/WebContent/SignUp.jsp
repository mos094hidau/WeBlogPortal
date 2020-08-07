
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignUp page</title>
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
   
 <main class="d-flex align-items-center banner-background-signup" style="height:100vh;  background:#eeeeee !important;">
   <div class="container">
   	<div class="col-md-8 offset-md-2">
  		 <div class="card">
   			<div class="card-header text-white text-center" style="background-image: url('health-4861815_1920.jpg');">
				<span class="fa fa-user-circle fa-3x"></span>
				<b>
				<p>Register Here!</p>
				</b>
				<br>
			</div>
  		 </div>
   		<div class="card-body">
   	<!-- Form -->
   		<form name="myform" id="reg-form" action="./registerServlet" method="Post">
   		<div class="form-row">
    <div class="col-md-5 mb-3">
      <label for="validationCustom01">Full name</label>
      <input type="text" class="form-control" name="fullname" id="fullname" placeholder="Full name" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="col-md-5 mb-3">
      <label for="validationCustomUsername">Username</label>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">@</span>
        </div>
        <input type="text" class="form-control" name="username" id="validationCustomUsername" placeholder="Username" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a username.
        </div>
      </div>
    </div>
    </div>
    
    <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" name="emailid" id="validationCustomEmail" aria-describedby="emailHelp" placeholder="Enter email" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
      
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="Male" required>
          <label class="form-check-label" for="gridRadios1">
            Male
          </label>
        </div>
        <div class="form-check" style="padding-left:50px;">
          <input class="form-check-input" type="radio" name="gender" id="gridRadios2" value="Female" required>
          <label class="form-check-label" for="gridRadios2">
            Female
          </label>
        </div>
    </div>
  </fieldset>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" id="password"  max="20" min="8" name="password" class="form-control" aria-describedby="passwordHelpInline" placeholder="Confirm Password" required>
    <small id="passwordHelpInline" class="text-muted">
      Must be 8-20 characters long.
    </small>
  </div>
     <div class="form-group">
    <label for="exampleInputPassword1"> Confirm Password</label>
    <input type="password" id="confirmpassword" class="form-control" name="confirmpassword" aria-describedby="passwordHelpInline" placeholder="Confirm Password" required>
    </div>
    <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" name="check" type="checkbox" value="on" id="invalidCheck" required>
      <label class="form-check-label" for="invalidCheck">
      <a href="#!" data-toggle="modal" data-target="#exampleModalLong">  Agree to terms and conditions</a>
      </label>
      <div class="invalid-feedback">
        You must agree before submitting.
      </div>
    </div>
  </div>
 <div class="container text-center" id="loader" style="display:none; color:#90caf9;">
 <span class="fa fa-rotate-right fa-spin fa-4x"></span>
 <h4>Please wait..</h4>
 </div>
<button class="btn btn-lg btn-outline-light" id="submit-btn" type="submit" style="background-image: url('health-4861815_1920.jpg');">Submit</button>
  </form>
   <script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  console.log("Loaded...")
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
       }, false);
    });
    $('#reg-form').on('submit',function(event){
		//prevent for directly send to the servlet
		event.preventDefault();	
		//create object of this form
           $ ("#submit-btn").hide();
           $ ("#loader").show();	
		let form=new FormData(this);
		//send this form data to the servlet
		$.ajax({
			url: "registerServlet",
			type: 'post',
			data: form,
			success: function(data,textStatus,jqXHR){
				console.log(data)
				 $ ("#submit-btn").show();
		           $ ("#loader").hide();
		           if(data.trim()==='record inserted'){
		           swal("Registered Successfully! We are going to redirect to login page")
		           .then((value)=>{
		             window.location="LoginPage.jsp"
		           });
		           }else{
		        	   swal(data)
		           }
			},
			error:function(jqXHR,textStatus,errorThrown){
				swal("Something Went Wrong..Please try again!");
				 $ ("#submit-btn").show();
		           $ ("#loader").hide();
			},
			processData: false,
		    contentType: false
		});
		
	});
  }, false);
 
})();
</script>
  
  
         </div>
   		<div class="card-footer">
   
  	    </div>
    </div>
   </div>
 </main>
 <!-- Terms and condition model -->
<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-white text-center" style="background-image: url('health-4861815_1920.jpg');">
        <h5 class="modal-title" id="exampleModalLongTitle">Terms & Conditions</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <font size=2 color="blue"> PLEASE READ THE FOLLOWING TERMS AND CONDITIONS RELATING TO YOUR USE OF THIS SITE AND THE PRODUCTS AND SERVICES PROVIDED HEREUNDER CAREFULLY.</font>
       <hr>
     <font size=2>  I. General Terms and Conditions
		a) Scope of Terms and Conditions
		These Terms and Conditions apply to your use of all of the website at www.becomeablogger.com, as well as any of its sub-domains and related domains or shopping cart pages (collectively the “Site”), as well as to products and services purchased or utilized from the Site. Unless stated otherwise, all references to the Site in these Terms and Conditions include this Site. These Terms and Conditions do not apply to your use of unaffiliated sites to which the Site only links.

		b) Restrictions on Use
		The contents of this site are protected by copyright and trademark laws, and are the property of their owners. Unless we say otherwise, you may access the materials located within the Site only for your personal use. This means you may download one copy of posted materials on a single computer for personal, noncommercial home use only, so long as you neither change nor delete any author attribution, trademark, legend or copyright notice. When you download copyrighted material you do not obtain any ownership rights in that material.
        
        c) Links
		These Terms and Conditions apply only to this Site, and not to the sites of any other companies or organizations, including those to which this Site may link. We are not responsible for the availability of any other site to which this Site links. We do not endorse or take responsibility for the contents, advertising, products or other materials made available through any other site. Under no circumstances will we be held responsible or liable, directly or indirectly, for any loss or damage that is caused or alleged to have been caused to you in connection with your use of, or reliance on, any content, goods or services available on any other site. You should direct any concerns to that site administrator or webmaster.
        
        d) Limitation of Liability
		UNDER NO CIRCUMSTANCES, INCLUDING BUT NOT LIMITED TO NEGLIGENCE, WILL WE OR ANY OF OUR LICENSORS OR SUPPLIERS BE LIABLE FOR ANY SPECIAL OR CONSEQUENTIAL DAMAGES THAT RESULT FROM THE USE OF, OR THE INABILITY TO USE, THE MATERIALS ON THE SITE, OR ANY PRODUCTS OR SERVICES PROVIDED PURSUANT TO THE SITE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. APPLICABLE LAW MAY NOT ALLOW THE LIMITATION OR EXCLUSION OF LIABILITY FOR INCIDENTAL, CONSEQUENTIAL OR OTHER DAMAGES, SO THE ABOVE LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU. IN NO EVENT SHALL THE TOTAL LIABILITY TO YOU BY US OR ANY OF OUR LICENSORS OR SUPPLIERS FOR ALL DAMAGES, LOSSES, AND CAUSES OF ACTION (WHETHER IN CONTRACT, TORT, OR OTHERWISE) EXCEED THE AMOUNT PAID BY YOU TO US, IF ANY, FOR ACCESSING THE SITE.
        
        f) Parental Permission; Minimum Age Requirement
         This Site is not directed to persons under the age of 13. The sale of any of the Site’s products or services is not directed to persons under the age of 18. We will not knowingly collect personally identifiable information from persons under 13. WE STRONGLY RECOMMEND THAT PARENTS PARTICIPATE IN THEIR CHILDREN EXPLORATION OF THE INTERNET AND ANY ONLINE SERVICES AND USE THEIR BROWSERS PARENTAL CONTROLS TO LIMIT THE AREAS OF THE INTERNET TO WHICH THEIR CHILDREN HAVE ACCESS.
         
         II. User Public Forum Submission/Participation Policy and Terms
			a) General:
			As a service to our users, this Site may feature message boards, chat rooms/areas, discussion forums, ratings, comments, bulletin board services, news groups (including, without limitation, Usenet and other third party news groups), communities and/or other message or communication facilities and other public/semi-public/private forums (collectively, “Forums”) where users with similar interests or similar experiences can share information and support one another or where users can post questions for others to answer. We may also offer online discussions moderated by various experts or other persons.
      
      		b) Your Participation/Contribution Requires Consideration:
			Any information (including personally identifiable information or other personal information) that you reveal in a Forum, may, by design, be open to the public and in such case may not a private, secure service. You should think carefully before disclosing any information in any Forum. What you have written may be seen, disclosed to or collected by third parties and may potentially be used by others in ways we are unable to control or predict, including to contact you for unauthorized purposes. By submitting communications or content to Forums, you agree that such submission is non-confidential for all purposes, unless the Company specifically notes otherwise (for example, in the rules for a particular forum).
      </font></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-lg btn-outline-light" style="background-image: url('health-4861815_1920.jpg');" data-dismiss="modal">ok!</button>
      </div>
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
	