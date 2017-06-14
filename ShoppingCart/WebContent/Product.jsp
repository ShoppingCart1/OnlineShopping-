<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.mivim.dto.ItemDto"%>
    
 
   <%ItemDto dto=(ItemDto)request.getAttribute("productView"); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<style>

@import url('https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister');
@import url('https://fonts.googleapis.com/css?family=Averia+Libre|Love+Ya+Like+A+Sister');
@import url('https://fonts.googleapis.com/css?family=Averia+Libre|Love+Ya+Like+A+Sister|Milonga');

.price a:link, a:visited {
    background-color: #f44336;
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}


.price a:hover, a:active {
    background-color: red;
}
.itemView
{
	
-webkit-transition: all 2s ease;
 -moz-transition: all 2s ease;
 -ms-transition: all 2s ease;
 transition: all 2s ease;
	float:left;
	padding :15px;
	color: #89ace5;
	margin :10px 10px 10px 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.itemView img:hover
{
	transform: scale(1.1); 
}
.itemView :hover{
	font-weight:bold;
	color: #4786ed;
	
}
#title{

		font-family: 'Love Ya Like A Sister', cursive;
		font-size	:30px;
}
#logout
{
	font-family: 'Love Ya Like A Sister', cursive;
	font-family: 'Averia Libre', cursive;
	font-size:20px;
	
}
#name{
		font-family: 'Love Ya Like A Sister', cursive;
		font-family: 'Averia Libre', cursive;
		font-family: 'Milonga', cursive;
		font-size: 20px;
		padding: 0px 20px 0px 0px;

}

body{
		padding:0px 100px 0px 100px;
}

</style>
</head>
<body>
<!-- navbar starts here -->
<div class="w3-container w3-amber">
	<span style="float:left;" id="title">Online Shopping</span>

<%
String s1=(String)session.getAttribute("customerName");
%>
<%if(s1==null) {%>
	 <a href="user_login.jsp" style="float:right;" id="login">Login</a>&nbsp;&nbsp;&nbsp;
<% }
 else{ %>
 <a href="/ShoppingCart/LogoutServlet" style="float:right;" id="login">Logout</a>&nbsp;&nbsp;&nbsp;
 <span style="float:right;"><%=s1 %></span>&nbsp;

<% }%>
</div>
<!-- Navbar ends here -->
<%
	String itemId=dto.getItemId();
	String itemName=dto.getItemName();
	String price=dto.getUnitPirce();
	String itemDescription=dto.getItemDescription();
	String inventary=dto.getInventary();%>
	
<div class="itemView">
  <img src="Image/<%=itemId%>.jpeg" alt="Image/<%=itemId%>.jpeg" style="width:304px;height:250px;">
  <p style="width:304px;height:80px;"><a><%=itemName %></a></p>
  <table style="width:100%">
   <tr><td><p><a href="#" class="price" >&#x20B9;<%=price %></a></p></td>
   <td align="right"><p><a href="ShoppingCart/ItemViewServlet?itemId=<%=itemId%>&itemName=<%=itemName%>&price=<%=price%>&itemDescription=<%=itemDescription%>&inventary=<%=inventary%>">View Item</a></p></td>
   </tr>
   </table>
</div>
<form action="AddCartServlet" method="post">
		 <input type="hidden" name="itemId" value="<%=itemId%>">
		 <input type="hidden" name="itemName" value="<%=itemName%>">
		 <input type="hidden" name="itemDescription" value="<%=itemDescription%>">
		 <input type="hidden" name="price" value="<%=price%>">
		 <input type="hidden" name="inventary" value="<%=inventary%>">
		 <button class="btn btn-info" id="addtocart">Add to Cart</button>
</form>
			

</body>
</html>
