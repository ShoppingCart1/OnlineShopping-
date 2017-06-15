<%@page import="com.mivim.dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.mivim.dto.ItemDto"%>
    
    <%
     List<ItemDto> listDto=LoginDAO.getItemDetailsDAO();%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Style -->
<link rel="stylesheet" href="index.css">
<title>Index Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<!-- navbar starts here -->
<div class="w3-container w3-amber">
    <a  href="Index.jsp" style="float:left;"><img src="Image/logo-design.png" alt=" " width="60" height="40">
      </a>
	<a href="Index.jsp"><span id="title">&nbsp;Online Shopping</span></a>
<%
String s1=(String)session.getAttribute("customerName");
%>
<%if(s1==null) {%>
	                                
	 <a href="user_login.jsp" style="float:right;"><button class="btn btn-info"  id="login"> <span class="glyphicon glyphicon-user"></span>Login</button></a>
<% }
 else{ %>
 <a href="/ShoppingCart/LogoutServlet" style="float:right;" id="logout">&nbsp;&nbsp;<button class="btn btn-info"  id="logout"> <span class="glyphicon glyphicon-user"></span>Logout</button></a>
 <span style="float:right;">&nbsp;Hello&nbsp;<%=s1 %>!</span>

<% }%>
</div>
<!-- Navbar ends here -->

<%for(ItemDto dto:listDto)
	{
	
	String itemId=dto.getItemId();
	String itemName=dto.getItemName();
	String price=dto.getUnitPirce();
	String itemDescription=dto.getItemDescription();
	String inventary=dto.getInventary(); %>
	
<div class="itemView">
  <img src="Image/<%=itemId%>.jpeg" alt="Image/<%=itemId%>.jpeg" style="width:304px;height:250px;">
  <p style="width:304px;height:80px;padding-top:20px;"><a><%=itemName %></a></p>
  <table style="width:100%">
   <tr><td><p><a href="#" class="price" >&#x20B9;<%=price %></a></p></td>
   <td align="right"><p><a href="/ShoppingCart/ProductViewServlet?itemId=<%=itemId%>&itemName=<%=itemName%>&price=<%=price%>&itemDescription=<%=itemDescription%>&inventary=<%=inventary%>">View Item</a></p></td>
   </tr>
   </table>
</div>
<%} %>

<%@ include file="footer.jsp" %>

</body>
</html>
