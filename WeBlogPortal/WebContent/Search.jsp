<%@ page import="com.WeBlogPortal.model.Blogger" %>
<%@ page import="com.WeBlogPortal.dao.BloggerDao" %>
<%@ page import="com.WeBlogPortal.control.DBConnection" %>
<%@ page import="java.util.ArrayList" %>
<div class="collapse" id="collapseExample">
  <div class="card card-body">
    <nav class="navbar navbar-light bg-light">
 <input  class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">

<ul id="myUL">
   <%
  	     BloggerDao userdao=new BloggerDao(DBConnection.getConnection());
		   ArrayList<Blogger> blist=userdao.getAllUsers();
		   for(Blogger user:blist)
				{
				%>
			   <li><a href="ViewProfile.jsp?userid=<%=user.getId() %>"  class=" c-link list-group-item list-group-item-action"  style="color: #9e9e9e" value=<%=user.getId() %>>
			    <img class="searchimg" src="./ProfileServlet?bid=<%=user.getId()%>" alt="Card image cap" style="">
			       <%=user.getFullname() %></a></li>
				<%
				}
		%>

</ul>
</nav>
</div>
</div>
<br>
<style>
#myInput {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 100%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
}

#myUL {
  /* Remove default list styling */
  list-style-type: none;
  padding: 0;
  margin: 0;
}

#myUL li a {
  border: 1px solid #ddd; /* Add a border to all links */
  margin-top: -1px; /* Prevent double borders */
  background-color: #f6f6f6; /* Grey background color */
  padding: 12px; /* Add some padding */
  text-decoration: none; /* Remove default text underline */
  font-size: 18px; /* Increase the font-size */
  color: black; /* Add a black text color */
  display: flex; /* Make it into a block element to fill the whole list */
}

#myUL li a:hover:not(.header) {
  background-color: #eee; /* Add a hover effect to all links, except for headers */
}

#myUL li a img{
height:50px;
 width:50px;
 border:4px solid #fff;
 box-shadow:0px 5px 10px rgba(0,0,0,.2);
}
</style>
<script>
function myFunction() {
  // Declare variables
   
  var input, filter, ul, li, a, i, txtValue;
  input = document.getElementById('myInput');
  filter = input.value.toUpperCase();
  ul = document.getElementById("myUL");
  li = ul.getElementsByTagName('li');
  $("#myUL").hide();
  // Loop through all list items, and hide those who don't match the search query
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    txtValue = a.textContent || a.innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
    	$("#myUL").show();
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
  
}
$(document).ready(function(){
	 $("#myUL").hide();
});
</script>