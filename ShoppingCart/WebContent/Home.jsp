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
  
<title>Home Page</title>
</head>
<body>
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
<!-- Electronics product -->
<div id="Electronics">
<div class="row text-center" style="padding top:40px;">
 <h2><i class="fa fa-cog fa-spin"></i>&nbsp;ELECTRONICS</h2>
        <hr class="small">     	
  <div class="col-lg-4">
  	<a class="navbar-brand" href=""> <img src= "Image/mobile.png" alt="" style="height: 100px;" ></a>
   
  </div>
  <div class="col-lg-4">
  	<a class="navbar-brand" href=""><img src="Image/laptop.png" alt="" style="height: 100px;" ></a>
    
  </div>
  <div class="col-lg-4">
  	 <a class="navbar-brand" href=""><img src="Image/tablets.jpg" alt="" style="height: 100px;" ></a>
   
  </div>
 </div>
 <div class="row text-center" style="padding top:40px;">

        <hr class="small">     	
  <div class="col-lg-4">
  	
    <a class="navbar-brand" href=""> <img src="Image/camera.jpg" alt="" style="height: 100px;" ></a>
  </div>
  <div class="col-lg-4">
  	<a class="navbar-brand" href=""><img src="Image/tv.jpg" alt="" style="height: 100px;" ></a>
    
  </div>
  <div class="col-lg-4">
  	  <a class="navbar-brand" href=""><img src="Image/computer.jpg" alt="" style="height: 100px;" ></a>
    
  </div>
 </div>
 
</div>
<!-- Electronics product ends here -->
<!-- Men product -->
<div id="Men" style="padding top:80px;">
<div class="row text-center" style="padding top:40px;">
 <h2><i class="fa fa-cog fa-spin"></i>&nbsp;MEN</h2>
        <hr class="small">     	
  <div class="col-lg-4">
  	<a class="navbar-brand" href=""> <img src="Image/topwear1.jpg"  alt="" style="height: 120px;" ></a>
   
  </div>
  <div class="col-lg-4">
  	<a class="navbar-brand" href=""><img src="Image/shirtwear2.jpg" alt="" style="height: 120px;" ></a>
    
  </div>
  <div class="col-lg-4">
  	 <a class="navbar-brand" href=""><img src="Image/man shoes2.jpg" alt="" style="height: 120px;" ></a>
   
  </div>
 </div>
 <div class="row text-center" style="padding top:40px;">

        <hr class="small">     	
  <div class="col-lg-4">
  	
    <a class="navbar-brand" href=""> <img src="Image/manshoes1.jpg" alt="" style="height: 120px;" ></a>
  </div>
  <div class="col-lg-4">
  	<a class="navbar-brand" href=""><img src="Image/watchmen1.jpg" alt="" style="height: 120px;" ></a>
    
  </div>
  <div class="col-lg-4">
  	  <a class="navbar-brand" href=""><img src="Image/sportswearman.jpg" alt="" style="height: 120px;" ></a>
    
  </div>
 </div>
 
</div>
<!-- Men product ends here -->

<!-- Women product -->
<div id="Men" style="padding top:80px;">
<div class="row text-center" style="padding top:40px;">
 <h2 style="padding top:40px;"><i class="fa fa-cog fa-spin"></i>&nbsp;WOMEN</h2>
        <hr class="small">     	
  <div class="col-lg-4">
  	<a class="navbar-brand" href=""> <img src="Image/womenjwellary.jpg"  alt="" style="height: 120px;" ></a>
   
  </div>
  <div class="col-lg-4">
  	<a class="navbar-brand" href=""><img src="Image/womenshoes1.jpg" alt="" style="height: 120px;" ></a>
    
  </div>
  <div class="col-lg-4">
  	 <a class="navbar-brand" href=""><img src="Image/womensportswear.jpg" alt="" style="height: 120px;" ></a>
   
  </div>
 </div>
 <div class="row text-center" style="padding top:40px;">

        <hr class="small">     	
  <div class="col-lg-4">
  	
    <a class="navbar-brand" href=""> <img src="Image/womentop1.jpg" alt="" style="height: 120px;" ></a>
  </div>
  <div class="col-lg-4">
  	<a class="navbar-brand" href=""><img src="Image/Womentop2.jpg" alt="" style="height: 120px;" ></a>
    
  </div>
  <div class="col-lg-4">
  	  <a class="navbar-brand" href=""><img src="Image/frock.jpg" alt="" style="height: 120px;" ></a>
    
  </div>
 </div>
 
</div>
<!-- Women product ends here -->

<!-- END OF PRODUCT IMAGES -->

    
    
<%@ include file="footer.jsp" %>

</body>
</html> 