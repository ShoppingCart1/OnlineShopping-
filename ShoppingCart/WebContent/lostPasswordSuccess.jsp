<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
h1{
font-family: cursive;
text-align: center;
color: green;
}
p{
font-family: cursive;
text-align: center;
}


.page_wrape{
    width: 1200px;
     margin: 0 auto;
     height: 980px;
     background-color: #e6e6e6;
}
</style>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>
	<div class="page_wrape">

	<h1>Your password has been sent successfully to your registered mail id</h1>
	<a href="user_login.jsp"><p>Click here to login back</p></a>
	</div>
</body>
</html>