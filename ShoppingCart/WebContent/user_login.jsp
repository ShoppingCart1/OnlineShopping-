<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Page</title>
  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
  
    <link rel="stylesheet" type="text/css" href="login.css"> 
</head>

<body>
 
 <div class="login-form">
  <form action="LoginServlet" method="post">
     <h1>Customer Login</h1>
   <!--    <h4 style="color: red"><%=request.getAttribute("errorMessage") %></h4> -->
   <div>
   <input type="hidden"  name="loginmode" value="user">
   </div>
     
   <div class="form-group">
     <input type="text" class="form-control" placeholder="Username" name="username"></br>
     <i class="fa fa-user"></i>
   </div>
   <div class="form-group log-status">
     <input type="password" class="form-control" placeholder="Password" name="password">
     <i class="fa fa-lock"></i>
  </div>
     <span class="alert">Invalid Credentials</span>
     <a class="link" href="#">Lost your Password</a>
     <input type="hidden" value="customer" name="userRole">
     <input type="submit" value="Log in" class="log-btn"> 
     </form>
    <!--    <h3><%= request.getAttribute("errormessage") %></h3> -->
 </div>
</body>
</html>