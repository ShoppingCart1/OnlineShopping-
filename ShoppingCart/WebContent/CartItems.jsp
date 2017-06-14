<%@page import="com.mivim.dto.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
    <%@ page import="java.util.*,com.mivim.dto.AddCartDto" %>
    <%String username=(String)session.getAttribute("customerName"); 
     String userId= (String)session.getAttribute("userId");
    if(username!=null)
    {%>
   
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
<title>Add Cart</title>
</head>
<body ng-app="">

  <!-- Setting the header content -->
  <nav class="navbar navbar-inverse navbar-fixed-top opaque-navbar">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="Index.jsp"><img src="Image/logo-design.png" alt=" " width="60" height="30">
      </a>
      <a class="navbar-brand" href="Index.jsp">Online Shopping</a>
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
    
   <div style="padding-top: 60px;" >
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
    <table id="res" class="table">
						<thead style="background-color: #696763;font-size:20px;">
							<tr class="cart_menu">
								<td style="padding-left:20px;"><strong>Product</strong></td>
								<td class="numeric" ><strong>Name</strong></td>
								<td class="numeric"><strong>Price</strong></td>
								<td class="numeric"><strong>Quantity</strong></td>
								<td class="numeric"><strong>Total</strong></td>
								
								
								
							</tr>
						</thead>
		  <tbody >
		  
		<% List<OrderDto> orderList=new ArrayList<OrderDto>();
		int count=0;
		for(AddCartDto dto:listDto) {
			
			OrderDto orderDto=new OrderDto();
			
			
		String itemId=dto.getItemId();
		String itemName=dto.getItemName();
		String unitPrice=dto.getUnitPirce();
		String itemDescription=dto.getItemDescription();
		String inventary=dto.getInventary();
		
		count++;
		
		
			%>
			<tr>
			<td><img src="Image/<%=itemId%>.jpeg" style="height: 120px;width: 150px;padding-left:50px;"/></td>
			<td class="numeric"><%=itemName%></td>
			<td class="numeric"><%=unitPrice%></td>
			<td class="numeric"><input class="form-group col-xs-8" type="number" min="1" max="<%=inventary%>" step="any"  ng-init="quantity<%=count%>='1'" ng-model="quantity<%=count%>"></td>
			<%
			String s=dto.getUnitPirce();
			double price = Double.parseDouble(s);
			
			%>
	
			<td id="total" class="numeric">{{quantity<%=count%>*<%=price%>}}</td> 
			<%orderDto.setItemId(itemId);
			  orderDto.setItemName(itemName);
			  orderDto.setPrice(price);
			  
			  orderList.add(orderDto);
			%>
			
			</tr>
			
			
		   </tbody>
		  <%--  <div style="padding-left:400px;">
	<form action="AddCartServlet" method="post">
		 <input type="hidden" name="itemId" value="<%=itemId%>">
		 <input type="hidden" name="itemName" value="<%=itemName%>">
		 <input type="hidden" name="itemDescription" value="<%=itemDescription%>">
		 <input type="hidden" name="price" value="<%=price%>">
		 <input type="hidden" name="inventary" value="<%=inventary%>">
     	 <button  class="btn btn-primary">Place Order</button><br><br>
	 <button class="btn btn-info" onclick="subtotal();">Sub Total</button>
	 </form>
	 </div> --%>
		   
		   <%} %>
		   <% 
		   request.setAttribute("orders", orderList); %>
	</table>
	</c:otherwise>
	</c:choose>
</div>
<%}
    else
    {
    response.sendRedirect("user_login.jsp");
    }%>
    
 <!-- Scripts -->
 <script type="text/javascript">
 
 $(document).ready(function(){
 function subtotal() {
 var cls = document.getElementById("res").getElementsByTagName("td");
 var sum = 0;
 for (var i = 0; i < cls.length; i++){
     if(cls[i].className == "countable"){
         sum += isNaN(cls[i].innerHTML) ? 0 : parseInt(cls[i].innerHTML);
     }
 }
 var a=document.getElementById("total").val();
 var b=$("#tdid").text();
 console.log(sum);
 window.alert(b);
 
 }
 });
 </script>
  
</body>
</html>