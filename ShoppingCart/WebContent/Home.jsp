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
<title>Home Page</title>
</head>
<body>
<%@ include file="header.jsp" %>
<sql:setDataSource
    var="myDS"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/Demo"
    user="root" password="root"
/>
<sql:query var="listUsers" dataSource="${myDS}">
    SELECT * FROM item;
</sql:query>

<div class="container-fluid" style="padding-top: 100px;">
  <div align="center">
        <table border="1" cellpadding="10">
            <tr>
                <th>Name</th>
                <th>Image</th>
                <th>Description</th>
               
            </tr>
            <c:forEach var="user" items="${listUsers.rows}">
                <tr>
                    <td><c:out value="${user.item_name}" /></td>
                   
                    <td><img  height="100px" width="200px" src="<c:out value="${user.item_image}"/>"/></td>
                    <td><c:out value="${user.item_description}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
    
    
<%@ include file="footer.jsp" %>

</body>
</html> 