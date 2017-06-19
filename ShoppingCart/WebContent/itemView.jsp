<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.mivim.dto.ItemDto"%>
    
    <%String adminName=(String)session.getAttribute("adminName");
    if(adminName!=null)
    	{%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ItemView</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

@import url('https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister');
@import url('https://fonts.googleapis.com/css?family=Averia+Libre|Love+Ya+Like+A+Sister');
@import url('https://fonts.googleapis.com/css?family=Averia+Libre|Love+Ya+Like+A+Sister|Milonga');
@import url('https://fonts.googleapis.com/css?family=Philosopher');


 a:link, a:visited {
    background-color: #6098f2;
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}


 a:hover, a:active {
    background-color: #1a6cef;
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


body{
		padding:0px 100px 0px 100px;
}
#itemName{
			font-family: 'Love Ya Like A Sister', cursive;
		font-family: 'Averia Libre', cursive;
		font-size:40px;
		font-weight:bold;
		
}
#itemDescription{font-family: 'Philosopher', sans-serif;
					font-size: 25px;
				}
				
	#price{font-family: 'Philosopher', sans-serif;
					font-size: 25px;
					color:28px;
	}
</style>
</head>
<body>
<jsp:include page="adminHeader.jsp"></jsp:include>
<%
	ItemDto dto=(ItemDto)request.getAttribute("itemView"); 
	String itemId=dto.getItemId();
	String itemName=dto.getItemName();
	String price=dto.getUnitPirce();
	String itemDescription=dto.getItemDescription();
	String inventary=dto.getInventary();%>
	<table style="width:100%" >	 
	<tr>
	<td rowspan="2"><div class="itemView">
	
 	  <img src="Image/<%=itemId%>.jpeg" alt="Image/<%=itemId%>.jpeg" style="width:320px;height:450px;">
 	  </div>
 	  </td>
 	  <td><p id="itemName"><%=itemName %></p>
 	  	<samp style="font-weight:bold; font-size:30px;">Description:</samp><p id="itemDescription"><%=itemDescription %></p>
 	  	<p id="price">&#x20b9;<%=price %></p>
 	  </td>
 	  </tr>
 	  <tr>
 	  		<td><p><a href="/ShoppingCart/UtilUpdateForm?itemId=<%=itemId %>">Update Item</a></p></td>
 	  		<td><p style="float:right;"><a href="/ShoppingCart/RemoveServlet?itemId=<%=itemId %>" class="confirmation">Remove Item</a></p></td>
 	  </tr>
 	 
 	 </table>
 	
<%}
    else
    {
    	response.sendRedirect("adminlogin.jsp");
    }
    %>
    <script type="text/javascript">
    var elems = document.getElementsByClassName('confirmation');
    var confirmIt = function (e) {
        if (!confirm('Are you sure?')) e.preventDefault();
    };
    for (var i = 0, l = elems.length; i < l; i++) {
        elems[i].addEventListener('click', confirmIt, false);
    }
</script>
</body>
</html>
