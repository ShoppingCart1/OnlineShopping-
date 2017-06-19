<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.mivim.dto.ItemDto"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
    <%@ page import="java.util.*,com.mivim.dto.AddCartDto" %>
    
    
 
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
<!-- Scripts -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<!-- Style -->
<link rel="stylesheet" href="index.css">
<link rel="icon" href="Image/logo-design.png" sizes="16x16">
<style>
@import url('https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister');
@import url('https://fonts.googleapis.com/css?family=Averia+Libre|Love+Ya+Like+A+Sister');
@import url('https://fonts.googleapis.com/css?family=Averia+Libre|Love+Ya+Like+A+Sister|Milonga');
@import url('https://fonts.googleapis.com/css?family=Philosopher');
#itemName{
			font-family: 'Love Ya Like A Sister', cursive;
		font-family: 'Averia Libre', cursive;
		font-size:30px;
		font-weight:bold;
		
}
#itemDescription{font-family: 'Philosopher', sans-serif;
					font-size: 20px;
				}
				
	#price{font-family: 'Philosopher', sans-serif;
					font-size: 25px;
					color:black;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%
	String itemId=dto.getItemId();
	String itemName=dto.getItemName();
	String price=dto.getUnitPirce();
	String itemDescription=dto.getItemDescription();
	String inventary=dto.getInventary();%>
	
<div class="itemView">
  <img src="Image/<%=itemId%>.jpeg" alt="Image/<%=itemId%>.jpeg" style="width:320px;height:450px;">
 	  </div>
 	  
 	  <p id="itemName" style="padding-top:40px;" id="itemName"><%=itemName %></p><br><br>
 	  	<samp style="font-weight:bold; font-size:30px;">Description:</samp><p id="itemDescription"><%=itemDescription %></p>
 	  	<p id="price">&#x20b9;<%=price %></p>
<div style="padding-top:230px;"> 
<form action="AddCartServlet" method="post">
		 <input type="hidden" name="itemId" value="<%=itemId%>">
		 <input type="hidden" name="itemName" value="<%=itemName%>">
		 <input type="hidden" name="itemDescription" value="<%=itemDescription%>">
		 <input type="hidden" name="price" value="<%=price%>">
		 <input type="hidden" name="inventary" value="<%=inventary%>">
		 <button class="btn btn-info btn-lg" id="addtocart"><span class="glyphicon glyphicon-shopping-cart"></span>Add to Cart</button>
</form></div> 

<%@ include file="footer.jsp" %>
</body>
</html>
