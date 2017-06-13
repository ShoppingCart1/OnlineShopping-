<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
    <%@ page import="java.util.*,com.mivim.dto.AddCartDto" %>
    
    <%Set<AddCartDto> listDto=(Set<AddCartDto>)session.getAttribute("addcart"); 
         int counter=listDto.size();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
  <link rel="stylesheet" href="style.css">
  
<title>Insert title here</title>
</head>
<body>

  <!-- Setting the header content -->
  <nav class="navbar navbar-inverse navbar-fixed-top opaque-navbar">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="Home.jsp"><img src="logo-design.png" alt=" " width="40" height="20">
      </a>
      <a class="navbar-brand" href="Home.jsp">Online Shopping</a>
    </div>
    
      <ul class="nav navbar-nav navbar-right">
         <ul class="nav pull-right">
				<li class="dropdown"><a id="cartitem" class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="btn btn-default btn-sm"><span class="glyphicon glyphicon-shopping-cart"></span> <c:set var="cartItems"
								scope="session" value="<%=counter%>" /> <span
							class="headerCartItemsCount"> <c:choose>
									<c:when test="${empty addcart}">0
							</c:when>
									<c:otherwise>
										<c:out value="${cartItems}" />
									</c:otherwise>
								</c:choose>
						</span> <span class="headerCartItemsCountWord"><c:out
									value="${cartItems==1?'item':'items'}" /></span> <b class="caret"></b></span></a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="cart">View Cart</a></li>
					</ul></li>
				
			</ul>
      </ul>
    </div>
    
    
    </nav>
    <!-- End of navbar -->
    
   <div style="padding-top: 60px;" ng-app="">
   <c:choose>
				<c:when test="${empty addcart}">
					<table class="table table-condensed">
						<tbody>
							<tr>
								<div class="hero-unit">
									<h3>The Shopping Cart is Empty</h3>
									<a href="Home.jsp" class="btn btn-primary btn-large">Continue
										Shopping</a>
								</div>
							</tr>
						</tbody>
					</table>
				</c:when>

				<c:otherwise>
    <table id="product_table" class="table">
						<thead style="background-color: #696763;font-size:20px;">
							<tr class="cart_menu">
								<td style="padding-left:20px;"><strong>Product</strong></td>
								<td class="numeric" ><strong>Name</strong></td>
								<td class="numeric"><strong>Price</strong></td>
								<td class="numeric"><strong>Quantity</strong></td>
								<td class="numeric"><strong>Total</strong></td>
								
								
								
							</tr>
						</thead>
		  <tbody>
		<%for(AddCartDto dto:listDto)
			{%>
			<tr>
			<td><img src="Image/<%=dto.getId()%>.jpg" style="height: 120px;width: 150px;padding-left:50px;"/></td>
			<td class="numeric"><%=dto.getName()%></td>
			<td class="numeric"><%=dto.getPrice()%></td>
			<td class="numeric"><input class="form-group col-xs-2" type="number" ng-init="quantity<%=dto.getId()%>='1'" ng-model="quantity<%=dto.getId()%>"></td>
			<%
			String s=dto.getPrice();
			double y = Double.parseDouble(s);
			
			%>
			<td class="numeric">{{quantity<%=dto.getId()%>*<%=y%>}}</td>
		
			
			</tr>
			
			<%} %>
		   </tbody>
	</table>
	</c:otherwise>
	</c:choose>
</div>
</body>
</html>