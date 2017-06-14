<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%String adminName=(String)session.getAttribute("adminName");
    if(adminName!=null)
    	{%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>

<style type="text/css">
		
@import url('https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister');
@import url('https://fonts.googleapis.com/css?family=Averia+Libre|Love+Ya+Like+A+Sister');
@import url('https://fonts.googleapis.com/css?family=Averia+Libre|Love+Ya+Like+A+Sister|Milonga');
@import url('https://fonts.googleapis.com/css?family=Philosopher');
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
</style>
</head>
<body>
<div class="w3-container w3-blue">
	<span style="float:left;" id="title">Online Shopping</span>
 <a href="/ShoppingCart/LogoutServlet"style="float:right;" id="logout">Logout</a>&nbsp;&nbsp;&nbsp;
  <span style="float:right;" id="name"><%=adminName %></span>
</div>
<%}
    else
    {
    	response.sendRedirect("adminlogin.jsp");
    }
    
    %>

</body>
</html>