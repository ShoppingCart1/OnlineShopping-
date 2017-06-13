<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
    <%@ page import="java.util.List,com.mivim.dto.AddCartDto" %>
    
    <%List<AddCartDto> listDto=(List<AddCartDto>)session.getAttribute("addcart"); 
    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="cart.css">
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
					data-toggle="dropdown" href="#"><span id="itemcount"
						class="btn btn-default btn-sm"><i
							class="icon-shopping-cart icon-red"></i> <c:set var="cartItems"
								scope="session" value="${cart.numberOfItems}" /> <span
							class="headerCartItemsCount"> <c:choose>
									<c:when test="${empty cartItems}">0
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
    <table id="product_table" class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="image">Product</td>
								<td class="description"></td>
					<td class="">Name</td>
								<td class="price">Price</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
		<%for(AddCartDto dto:listDto)
			{%>
			<tr>
			<td><img src="Image/<%=dto.getId()%>.jpg" style="height: 120px;"/></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getPrice()%></td>
			</tr>
			
			<%} %>
</body>
</html>