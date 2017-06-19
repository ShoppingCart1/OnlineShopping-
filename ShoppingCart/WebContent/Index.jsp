<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.mivim.dao.LoginDAO"%>
    <%@ page import="java.util.List,com.mivim.dto.ItemDto"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
    <%@ page import="java.util.*,com.mivim.dto.AddCartDto" %>
    
    <%
     List<ItemDto> listDto=LoginDAO.getItemDetailsDAO();%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Style -->
<link rel="stylesheet" href="index.css">
<title>Shopping Cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="icon" href="Image/logo-design.png" sizes="16x16">
</head>
<body>
<%@ include file="header.jsp" %>
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
