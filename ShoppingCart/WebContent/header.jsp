<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ page import="java.util.*,com.mivim.dto.AddCartDto" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="icon" href="Image/logo-design.png" sizes="16x16">
<title></title>
</head>
<body>
<!-- navbar starts here -->
<div class="w3-container w3-blue">
    <a  href="Index.jsp" style="float:left;"><img src="Image/logo-design.png" alt=" " width="60" height="40">
      </a>
	<a href="Index.jsp"><span id="title">&nbsp;Online Shopping</span></a>
	
<%
String s1=(String)session.getAttribute("customerName");
%>
<%if(s1==null) {%>
	                                
	 <a href="user_login.jsp" style="float:right;"><button class="btn btn-info"  id="login"> <span class="glyphicon glyphicon-user"></span>Login</button></a>
<% }
 else{ 
	 Set<AddCartDto> listCartDto=(Set<AddCartDto>)session.getAttribute("addcart"); 
     int counter=0;
%>
 <a href="/ShoppingCart/LogoutServlet" style="float:right;">&nbsp;&nbsp;<button class="btn btn-info btn-sm"  id="logout"> <span class="glyphicon glyphicon-user"></span>Logout</button></a>
 
          
				 <li style="float:right;"><a id="cartitem" 
					href="CartItems.jsp"><span class="btn btn-default btn-sm" style="float:right;"> <span class="glyphicon glyphicon-shopping-cart"></span> <c:set var="cartItems"
								scope="session"/> <span> <c:choose>
									<c:when test="${empty addcart}">0
							</c:when>
									<c:otherwise>
									<%
									counter=listCartDto.size();
									%>
										<c:out value="${cartItems}" /><%=counter%>
									</c:otherwise>
								</c:choose></span>
								<span ><c:out
									value="${cartItems==1?'item':'items'}" /></span> </a>
									</li>
					


<span style="float:right;">&nbsp;Hello&nbsp;<%=s1 %>!&nbsp;&nbsp;</span>
<% }%>
</div>
<!-- Navbar ends here -->

</body>
</html>