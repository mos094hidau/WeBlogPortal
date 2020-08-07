
<script>
$(document).ready(function(){
	$('.hamburger').on('click',function(){
		$('.wrapper').toggleClass('active');
		$('.sidebarcontainer').toggleClass('active');
	})
  
});
</script>
<div class="wrapper">
	<div class="top_navbar">
	<div class="logo"><a href="#"><span class="fa fa-yelp"></span><b> WeBLog.com</b></a></div>
	<div class="top_menu" id="top-menubar" style="position: -webkit-sticky;
  position: sticky;
  top: 0;">
		<div class="home_link">
		<a href="Reader.jsp">
			<span class="icon">
			<i class="fa fa-newspaper-o" aria-hidden="true"></i></span>
			<span>Reader</span>
		</a>	
		</div>
		<div class="home_link" style="padding-right:800px;">
		<a href="#!" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			<span class="icon">
			<i class="fa fa-search" aria-hidden="true"></i></span>
			<span>Search</span>
		</a>	
		</div>
		
		
		<div class="right_info">
			<a href="#!" data-toggle="modal" data-target="#notificationiconclick" class="icon_wrap">
					<div class="icon">
						<i class="fa fa-bell" aria-hidden="true"></i>
					</div>
			</a>
			<a href="#!" data-toggle="modal" data-target="#" class="icon_wrap">
					<div class="icon">
						<i class="fa fa-send" aria-hidden="true"></i>
					</div>
			</a>
			<a href="#!" data-toggle="modal" data-target="#profileiconclick" class="icon_wrap">
					<div class="icon">
					<i class="fa fa-user-circle" aria-hidden="true"></i>
					</div>
					
			</a>
			
			
		</div>
	</div>
	</div>
	<div class="main_body">
			<div class="sidebar_menu">
							
					<div class="inner_sidebar_menu">
								<ul>
									<li ><a href="BloggerDashBoard.jsp" class="active">
			      						<span class="icon">
			      						<i class="fa fa-dashboard" aria-hidden="true"></i></span>
			      						<span class="title">DashBoard</span>
										</a>
									</li>
									
									<li><a class="viewprofile" href="MyProfile.jsp" id="myProfile-btn">
										<span class="icon">
										<i class="fa fa-user-circle" aria-hidden="true"></i>
										</span>
			      						<span class="title">My Profile</span>
										</a>
									</li>
									
									<li><a href="#!" data-toggle="modal" data-target="#ProfileModel">
										<span class="icon">
										<i class="fa fa-id-card" aria-hidden="true"></i>
										</span>
			     					    <span class="title">Edit Profile</span>
										</a>
									 </li>
									 <li><a href="CreateBlog.jsp">
										<span class="icon">
										<i class="fa fa-plus" aria-hidden="true"></i>
										</span>
			     					    <span class="title">Write Blog</span>
										</a>
									 </li>
									  <li><a href="Category.jsp">
										<span class="icon">
										<i class="fa fa-server" aria-hidden="true"></i>
										</span>
			     						 <span class="title">Categorgies</span>
										</a>
									</li>
									
									
									<li><a   href="#!" data-toggle="modal" data-target="#settingiconclick">
										<span class="icon">
										<i class="fa fa-wrench" aria-hidden="true"></i>
										</span>
			      						<span class="title">Setting</span>
										</a>
									</li>
									
									<li><a href="./logoutServlet">
										<span class="icon">
										<i class="fa fa-sign-out" aria-hidden="true"></i>
										</span>
			      						<span class="title">Logout</span>
										</a>
									</li>
							</ul>
						
							<div class="hamburger">
								<div class="inner_hamburger">
								<span class="arrow">
									<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
									<i class="fa fa-long-arrow-right" aria-hidden="true" style="display:none;"></i>
								
								</span>
								
								
								</div>
							
							</div>
					</div>
			</div>
			
	</div>
	
</div>

