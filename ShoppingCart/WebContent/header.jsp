<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="style.css">
<title></title>
</head>
<body>
<sql:setDataSource
    var="myDS"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/Demo"
    user="root" password="root"
/>
<sql:query var="listUsers"   dataSource="${myDS}">
        SELECT * FROM category where parent_id=0;
    </sql:query>
 <sql:query var="listUsers1"   dataSource="${myDS}">
        SELECT * FROM category where parent_id=100;
    </sql:query>
<!-- Setting the header content -->
  <nav class="navbar navbar-default navbar-fixed-top opaque-navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
         <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href=""><img src="logo-design.png" alt="" width="80" height="30">
      </a>
      <a class="navbar-brand" href="Home.jsp">Online Shopping</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav ">
       <li style="font-size: 12px;"><a href="#" target="_blank">Login</a> </li>
        <li style="font-size: 12px;"><a href="#" target="_blank">Sign up</a> </li>
        
      </ul>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
       <c:forEach var="user" items="${listUsers.rows}">
                
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                
                <li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="font-size: 12px;"> <c:out
								value="${user.category_name}" /></b>
					</a>
          </a>
          <ul class="dropdown-menu">
            <c:forEach var="user" items="${listUsers1.rows}">
                <li><a href="#">
                    <c:out value="${user.category_name}" />
                    </a>
                </li>
            </c:forEach>
            
          </ul>
        </li>
        </c:forEach>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
    </div>
    </div>
    </nav>
    <!-- End of navbar -->
</body>
</html>