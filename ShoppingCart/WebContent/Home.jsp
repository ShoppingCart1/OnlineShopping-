<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="col-sm-3 leftside"><!-- leftside-->
         <div class="row">   
                <ul class="nav nav-pills nav-stacked links">
                  <li><a href="#">Electronics</a></li>
                  <li><a href="#">Clothes</a></li>
                  <li><a href="#">Foot wear</a></li>
                  <li><a href="#">Others</a></li>
                </ul>
         </div> 
                
    </div><!-- end of leftside-->
    <div class="col-sm-9 rightside"><!-- rightside-->
                
    </div><!-- end of rightside-->
    
<%@ include file="footer.jsp" %>

</body>
</html> 