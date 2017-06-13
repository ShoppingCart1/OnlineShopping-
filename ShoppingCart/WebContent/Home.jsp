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
  <link rel="stylesheet" href="homestyle.css">
   <link rel="stylesheet" href="cart.css">
  
<title>Home Page</title>
</head>
<body>
<sql:setDataSource
    var="DS"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/Demo"
    user="root" password="mysql"
/>
<sql:query var="list"   dataSource="${DS}">
      SELECT * FROM Items;
    </sql:query>

<%@ include file="header.jsp" %>
<!--Adding a Carousal in feature-->
    <div class="container" id="features" style="padding-top:50px" >
     <div class="text-center">
     	<h1><i class="fa fa-cog fa-spin"></i>&nbsp;Go Shopping!</h1>
        <hr class="small">     	
<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
     <img src="Image/Carousel1.jpg" alt=""  style="height:100px; width:100%;">
    <h3><strong>Classy Products</strong></h3>
    </div>
    <div class="item">
      <img src="Image/third.jpg" alt=""  style="height:100px; width:100%;">
      <h3><strong>Easy Buy</strong></h3>
    </div>
    <div class="item">
      <img src="Image/Carousel3.jpg" alt=""  style="height:100px; width:100%;">
      <h3><strong>Reasonable Price</strong></h3>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


     </div>
     <hr class="small">
     <!--Carousel ends here-->
  
<!-- PRODUCTS IMAGES -->
<div>
<table id="product_table" class="table" style="padding-top:20px;">
						<thead>
							<tr class="cart_menu">
								<td class="image">Product</td>
								<td class="description"></td>
					<td class="quantity">Name</td>
								<td class="price">Price</td>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="products" items="${list.rows}">
						<c:url var="url" value="/Product.jsp">
							<c:param name="productId" value="${products.id}" />
						</c:url>
						<tr>
						<td><a href="${url}"><img src="Image/${products.id}.jpg" style="height: 120px;"/></td>
								<td><a href="${url}">${products.name}</a></td>
							<td>Rs ${products.price}</td>
						</tr>	
						</c:forEach>
						</tbody>
						</table>
</div>
<!-- END OF PRODUCT IMAGES -->

    
    
<%@ include file="footer.jsp" %>

</body>
</html> 