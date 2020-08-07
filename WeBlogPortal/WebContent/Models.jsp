<%@ page import="com.WeBlogPortal.model.Blogger" %>
<%
Blogger b=(Blogger)session.getAttribute("currentUser");
%>
<!-- Models -->
<script>
$(document).ready(function(){
	console.log("loaded..")
	$('#edit-details').on('submit',function(event){
		event.preventDefault();
		let editdata = new FormData(this);
		$.ajax({
			url: "editDetails",
			type: 'post',
			data: editdata,
			
			success: function(data,textStatus,jqXHR){
				  console.log(data)
				  swal("Profile Edited Successfully!!")
		           .then((value)=> {
		             window.location="BloggerDashBoard.jsp"
		           });
				  
			},
			error:function(jqXHR,textStatus,errorThrown){
				console.log(jqXHR)
				swal("Profile can't be edited");
			},
			processData: false,
		    contentType: false
		});	
	});
	$('#change-password').on('submit',function(event){
		event.preventDefault();
		let mydata = new FormData(this);
		$.ajax({
			url: "ChangePassword",
			type: 'post',
			data: mydata,
			
			success: function(data,textStatus,jqXHR){
				  console.log(data)
				  swal("Password Changed Successfully!!")
		           .then((value)=> {
		             window.location="BloggerDashBoard.jsp"
		           });
				  
			},
			error:function(jqXHR,textStatus,errorThrown){ 
				console.log(jqXHR)
				swal("Password can't be changed");
			},
			processData: false,
		    contentType: false
		});	
	});

});
</script>
<!-- Models -->	
<!-- Edit Profile Modal -->
<div class="modal fade" id="ProfileModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background: #e40046; color:#fff;">
        <h5 class="modal-title" id="exampleModalLongTitle"><span class="fa fa-yelp"></span><b> WeBLog.com</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        			<div class="container text-center">
        			<img  class="img-fluid" src="./ProfileServlet?bid=<%=b.getId()%>" width="200px" style="border-radius:50%; height:150px; width:150px; border:4px solid #fff; box-shadow:0px 5px 10px rgba(0,0,0,.2);"/>
        			<button data-toggle="modal" data-target="#uploadProfileModal" style="position:absolute; top:124px; right:330px; background:#fff; cursor:pointer; color: #e40046; border:1px solid; padding:5px; border-radius:50%; width:30px; height:30px; display:flex; align-items:center; font-size:1rem; font-weight:bold;"><i class="fa fa-camera"></i></button>
        		    <h5 class="modal-title"><b><%= b.getFullname() %></b></h5>
        			</div>
        			<hr>
        			<form action="./editDetails"  method="post" id="edit-details" >
        			    <div class="form-group row">
   							 <label for="Username" class="col-sm-2 col-form-label col-form-label-sm font-weight-bold">Username:</label>
    							<div class="col-sm-10">
      							<input type="username" class="form-control form-control-sm" id="inputusername" placeholder="Username" name="username" value="<%= b.getUsername()%>">
    							</div>
  					  </div>
  						<div class="form-group row">
   							 <label for="inputEmail3" class="col-sm-2 col-form-label  col-form-label-sm font-weight-bold">Website:</label>
    							<div class="col-sm-10">
      							<input type="email" class="form-control form-control-sm" id="inputEmail3"  name="emailid"  placeholder="Email" value="<%= b.getEmailid()%>">
    							</div>
  					  </div>
  				  <div class="form-group row">
   							 <label for="mobileno" class="col-sm-2 col-form-label  col-form-label-sm font-weight-bold">Contact:</label>
    							<div class="col-sm-10">
      							<input type="mobileno" class="form-control form-control-sm" id="mobileno" placeholder="contact"  name="mobile" value=<%if(b.getMobile()!=0){%><%=b.getMobile()%><%}%>>
    							</div>
  				</div>
  				<div class="form-group row">
   							 <label for="mobileno" class="col-sm-2 col-form-label  col-form-label-sm font-weight-bold">Gender:</label>
    							<div class="col-sm-10">
      							<input type="mobileno" readonly class="form-control form-control-sm" id="mobileno"   name="gender" placeholder="contact" value="<%=b.getGender() %>">
    							</div>
  				</div>
  				<div class="form-group row">
    					<label for="exampleFormControlTextarea1"  class="col-sm-2 col-form-label  col-form-label-sm font-weight-bold">Address:</label>
    					<div class="col-sm-10">
    					<textarea class="form-control form-control-sm" id="exampleFormControlTextarea1" rows="3" placeholder="street"  name="address"><%if(b.getAddress()!=null){%><%=b.getAddress()%><%} %></textarea>
    					</div>
  					</div>
  					 <div class="form-group row">
   							 <label for="mobileno" class="col-sm-2 col-form-label  col-form-label-sm font-weight-bold">City:</label>
    							<div class="col-sm-10">
      							<input type="mobileno" class="form-control form-control-sm" id="city"  name="city"  placeholder="city" value="<%if(b.getCity()!=null){%><%=b.getCity()%><%}%>">
    							</div>
  				</div>
  				 <div class="form-group row">
   							 <label for="mobileno" class="col-sm-2 col-form-label  col-form-label-sm font-weight-bold">State:</label>
    							<div class="col-sm-10">
      							<input type="mobileno" class="form-control form-control-sm" id="state"  name="state"  placeholder="state" value="<%if(b.getState()!=null){%><%=b.getState()%><%}%>">
    							</div>
  				</div>
  				 <div class="form-group row">
   							 <label for="mobileno" class="col-sm-2 col-form-label  col-form-label-sm font-weight-bold">Country:</label>
    							<div class="col-sm-10">
      							<input type="mobileno" class="form-control form-control-sm" id="country" placeholder="country"  name="country" value="<%if(b.getCountry()!=null){%><%=b.getCountry()%><%} %>">
    							</div>
  				</div>
  			    <fieldset class="form-group">
  						  <div class="row">
     					 	<legend class="col-form-label col-sm-2 pt-0  col-form-label-sm font-weight-bold">Status:</legend>
      				<div class="col-sm-10">
       				 <div class="form-check">
         				 <input class="form-check-input form-control-sm" type="radio" name="status" id="male" value="Public" checked>
          				<label class="form-check-label pt-0  col-form-label-sm" for="gridRadios1">
            			Public
          				</label>
        				</div>
        			<div class="form-check">
          			<input class="form-check-input form-control-sm" type="radio" name="status" id="female" value="Private">
          			<label class="form-check-label pt-0  col-form-label-sm" for="gridRadios2">
           			Private
          			</label>
       				 </div>
      				</div>
    				</div>
  				  </fieldset>
  				  <div class="form-group row">
    					<label for="exampleFormControlTextarea1"  class="col-sm-2 col-form-label  col-form-label-sm font-weight-bold">Bio:</label>
    					<div class="col-sm-10">
    					<textarea class="form-control form-control-sm" id="exampleFormControlTextarea1"  name="description" rows="3" placeholder="bio"><%if(b.getDescription()!=null){%><%=b.getDescription() %><%} %></textarea>
    					</div>
  					</div>
  					<div class="form-group row">
   							 <label for="regdate" class="col-sm-2 col-form-label  col-form-label-sm font-weight-bold">Registered on:</label>
    							<div class="col-sm-10">
      							<input type="regdate"  readonly class="form-control form-control-sm" id="regdate"  name="regdate" value="<%= b.getRegdate()%>">
    							</div>
  					   </div>
 				 <div class="form-group row" style="padding-left:130px; padding-top:10px;">
   				 <div class="col-sm-10">
      				<button type="submit" class="btn btn-lg rounded" style="background:#e40046; color:#fff;">Save Changes</button>
      				<a type="button" class="btn btn-light btn-lg rounded btn-outline-secondary" href="#!" data-toggle="modal" data-target="#changePasswordModal">Change Password</a>
   				 </div>
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

 </script>
<!-- End of edit Profile model -->

<!-- side Modal profile click-->
<div class="modal fade" id="profileiconclick" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document"  style="float:right;">
    <div class="modal-content">
    
      <div class="modal-body">
      <div class="container text-center">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        			<img  class="img-fluid" src="./ProfileServlet?bid=<%=b.getId()%>" width="200px" style="border-radius:50%; height:100px; width:100px; border:4px solid #fff; box-shadow:0px 5px 10px rgba(0,0,0,.2);"/>
        			<a  href="#!" data-toggle="modal" data-target="#uploadProfileModal"style="position:absolute; top:85px; right:105px; background:#fff; color:#777; border:1px solid; padding:5px; border-radius:50%; width:25px; height:25px; display:flex; align-items:center; font-size:.8rem; font-weight:bold; cursor:pointer;"><i class="fa fa-camera"></i></a>
        				<h5 class="modal-title"><b><%= b.getFullname() %></b></h5>
        				<h7 style="color:#777"><%= b.getEmailid() %></h7>
        			</div>
        			<hr>
        <a href="#!" data-toggle="modal"  data-target="#ProfileModel" role="button" class="btn rounded" style="background:#fff;  border:1px solid; color:#777; cursor:pointer;">Manage your WeBLog Account</a> 
  <hr>
 <span style="padding-left:85px; padding-bottom:10px;" > <a  href="./logoutServlet" role="button" class="btn rounded" style=" background:#fff;  border:1px solid; color:#777; cursor:pointer;">Sign out</a> </span>
 </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>
<!-- End of side Modal profile click-->

<!--  Model setting click -->
<div class="modal fade" id="settingiconclick" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" >
    <div class="modal-content">
      <div class="modal-header" style="background: #e40046; color:#fff;">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-cog" aria-hidden="true"></i> Setting</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="btn-group-vertical " role="group" aria-label="Button group with nested dropdown">
  		<a type="button" class="btn btn btn-light btn-lg btn-block btn-outline-secondary" href="#!" data-toggle="modal" data-target="#changePasswordModal"><i class="fa fa-unlock-alt"></i> Change Password</a>
   <a type="button" class="btn btn btn-light btn-lg btn-block btn-outline-secondary" href="#!" data-toggle="modal" data-target="#uploadProfileModal"><i class="fa fa-user"></i> Set New Profile pic</a>
    <a type="button" class="btn btn btn-light btn-lg btn-block btn-outline-secondary" href="#!" data-toggle="modal" data-target="#deleteaccountmodel"><i class="fa fa-exclamation-triangle"></i> Delete Your Account</a>
  <a type="button" class="btn btn btn-light btn-lg btn-block btn-outline-secondary" href="#!" data-toggle="modal" data-target="#helpmodel"><i class="fa fa-question-circle"></i> Help</a>
    <a type="button" class="btn btn btn-light btn-lg btn-block btn-outline-secondary" href="#!" data-toggle="modal" data-target="#helpmodel"><i class="	fa fa-envelope"></i> Verify Your Email</a>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn btn-light dropdown-toggle btn-lg btn-block btn-outline-secondary" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Dropdown
    </button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
      <a class="dropdown-item" href="#">Dropdown link</a>
      <a class="dropdown-item" href="#">Dropdown link</a>
    </div>
  </div>
</div> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- End of  Model setting click -->

<!-- side Model notification click -->
<div class="modal fade" id="notificationiconclick" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background: #e40046; color:#fff;">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-bell" aria-hidden="true"></i> Notification</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ... <h5>Popover in a modal</h5>
  <p>This <a href="#" role="button" class="btn btn-secondary popover-test" title="Popover title" data-content="Popover body content is set in this attribute.">button</a> triggers a popover on click.</p>
  <hr>
  <h5>Tooltips in a modal</h5>
  <p><a href="#" class="tooltip-test" title="Tooltip">This link</a> and <a href="#" class="tooltip-test" title="Tooltip">that link</a> have tooltips on hover.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!--End of side Model notification click -->

<!--Set Profile Pic Modal -->
<div class="modal fade" id="uploadProfileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered" role="document">
    <div class="modal-content">
     <div class="modal-header" style="background: #e40046; color:#fff;">
        <h5 class="modal-title" id="exampleModalLongTitle"><b> <%= b.getFullname() %></b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
              <a  href="./RemoveProfilePic" type="button" class="btn btn btn-light  btn-outline-secondary rounded" >Remove Profile</a>
              <hr>
        <form action="./ProfileUpload" method="post" enctype="multipart/form-data">
            <label>Set new profile picture:</label>
            <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text">Upload</span>
  </div>
  <div class="custom-file">
    <input type="file" class="custom-file-input" id="inputGroupFile01" name="file">
    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
  </div>
</div>
<button type="submit" class="btn rounded" style="background:#e40046; color:#fff;">Upload</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!--End of Set Profile Pic Modal -->
<!-- change password model -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered" role="document">
    <div class="modal-content">
     <div class="modal-header" style="background: #e40046; color:#fff;">
        <h5 class="modal-title" id="exampleModalLongTitle"><b> <%= b.getFullname() %></b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="./ChangePassword" method="post" id="change-password">
         <h4>   <label>Change Password</label></h4>
         <hr>
  		<div class="form-group">
    <label for="exampleInputPassword1">Old password</label>
    <input type="password" class="form-control" name="oldpassword" id="exampleInputPassword1" placeholder="Password" required>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Set new password</label>
    <input type="password" class="form-control" name="newpassword" id="exampleInputPassword1" placeholder="Password" required>
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">Confirm new password</label>
    <input type="password" class="form-control" name="confirmpassword" id="exampleInputPassword1" placeholder="Password" required>
  </div>
  <div class="form-group">
  <button type="submit" class="btn btn-lg rounded" style="background:#e40046; color:#fff;">Save Changes</button></div><br>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- End of change Password model -->

<!-- Help model -->
<div class="modal fade" id="helpmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background: #e40046; color:#fff;">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-question" aria-hidden="true"></i> Help</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ... <h5>Popover in a modal</h5>
  <p>This <a href="#" role="button" class="btn btn-secondary popover-test" title="Popover title" data-content="Popover body content is set in this attribute.">button</a> triggers a popover on click.</p>
  <hr>
  <h5>Tooltips in a modal</h5>
  <p><a href="#" class="tooltip-test" title="Tooltip">This link</a> and <a href="#" class="tooltip-test" title="Tooltip">that link</a> have tooltips on hover.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- End of help model -->
<!-- End of models -->