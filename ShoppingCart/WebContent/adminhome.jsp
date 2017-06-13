<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List,com.mivim.dto.ItemDto"%>
    
    <%if(session.getAttribute("adminName")!=null)
    	{%>
   <%List<ItemDto> listDto=(List<ItemDto>)request.getAttribute("itemDetails"); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminHomePage</title>
<style>
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

</style>
</head>
<body>
<%for(ItemDto dto:listDto)
	{
	
	String itemId=dto.getItemId();
	String itemName=dto.getItemName();
	String price=dto.getUnitPirce();%>
<div class="itemView">
  <img src="Image/<%=itemId%>.jpeg" alt="Image/<%=itemId%>.jpeg" style="width:304px;height:250px;">
  <p style="width:304px;height:80px;"><a><%=itemName %></a></p>
  <table style="width:100%">
   <tr><td><p><a href="#" class="price" >&#x20B9;<%=price %></a></p></td>
   <td align="right"><p><a>Buy Now</a></p></td>
   </tr>
   </table>
</div>
<%} %>

<%}
    else
    {
    	response.sendRedirect("adminlogin.jsp");
    }
    %>
</body>
</html>
