<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="com.mivim.controller.*"%> 
<%@page import="com.mivim.*"%> 
    
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
<title>Cart</title>
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
    <!-- Section -->
	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ul class="breadcrumb">
				<li class="active"><a href="home.jsp">Home</a> <span
					class="divider">/</span></li>
				<li class="active">Checkout</li>
			</ul>
		</div>
		<div class="table-responsive cart_table">
			<c:choose>
				<c:when test="${cart.numberOfItems == 0}">
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
					<table id="product_table" class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="image">Product</td>
								<td class="description"></td>
					<td class="quantity">Quantity</td>
								<td class="price">Price</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cart_products" items="${cart.items}">
							 <!--<c:out value="${cart.items}"></c:out>-->
							 <c:out value="gggggg"></c:out>
								<c:set var="products" value="${cart_products.product}" />
								<tr>
									<td class="cart_product"><a href=""><img alt="${products.productName}"
											src="images/small/${products.productId}.jpg" /></a></td>
									<td class="cart_description">
										<h4>
											<a href=""><c:out value="${products.productName}" /></a>
										</h4> </br>
										<p class="info">
											Category :
											<c:out value="${products.category}" />
										</p>
										<p class="info">
											Manufacturer:
											<c:out value="${products.productManufacturer}" />
										</p>
									</td>
									<td class="cart_quantity">
										<div class="form-horizontal">
					<form action="update" method="POST">
												<input type="hidden" name="productid"
													value="<c:out value="${products.productId}"/>" /><input
													type="number" name="quantity" size="2" maxlength="2"
													class="input-mini" max="10" min="1"
													value="<c:out value="${cart_products.quantity}"/>" />
												<button class="update btn btn-primary">Update</button>
											</form>
										</div> <!--  										<div class="form-horizontal">
												<button class="increment btn btn-primary">+</button>
												<input class="input-mini" name="mini" type="text" value="1">
												<button class="decrement btn btn-primary">-</button>
												<button class="update btn btn-primary">Update</button>
										</div>
-->
									</td>
									<td class="cart_total">
							
										<p class="product_tot lead">
											Rs:
											<c:out value="${cart_products.total}" />
										</p>
									</td>
																		<td class="cart_delete">
										<form action="remove" method="POST">
											<input type="hidden" name="pid"
												value="<c:out value="${product.productId}"/>" />
											<button type="submit"
												class="cart_quantity_delete btn btn-primary">
												<i class="fa fa-times" id="remove"></i>
											</button>
										</form>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td>&nbsp;</td>
								<td><a role="button" href="checkout_unreg.jsp"
									id="checkoutbutton" class="btn btn-primary">Proceed to
										Checkout
										</button></td>
								<td><button id="continueshopping" id="continuebutton"
										class="btn btn-primary pull-left">Continue Shopping</button>
									<p id="subtotal_cart" class="lead">Total:</p></td>
								<td class="cart_sub_total">
									<p class="lead">
										Rs.
										<c:out value="${cart.total}" />
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		</div>
	</section>
	<script>
		$(function updateTotal() {
			var $totprice = 0;
			$('table#product_table > tbody > tr').each(function() {
				if (!$(this).hasClass('.cart_sub_total')) {
					var $prodprice = $(this).find('p.product_tot').text();
					var $arr = $prodprice.split(':');
					var $prodtot = parseFloat($arr[1]);
					console.log($prodtot);
					$totprice = parseFloat($totprice) + parseFloat($prodtot);
					console.log($totprice);
				}
			});
			return false;
		});
		$('#remove').click(function() {
			var itemToRemove = $(this).attr("data-id");
		});
		function ajax(options, callback) {
			var defaults = {
				success : function(data) {
					if (!redirectIfNecessary($(data))) {
						var extraData = getExtraData($(data));
						callback(data, extraData);
					}
				}
			};
			$.extend(options, defaults);
			$.ajax(options);
		}
		function serializeObject($object) {
			var o = {};
			var a = $object.serializeArray();
			$.each(a, function() {
				if (o[this.name] !== undefined) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		}
	</script>


</body>
</html>