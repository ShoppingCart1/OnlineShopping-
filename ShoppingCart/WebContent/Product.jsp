<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ page import="com.mivim.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>	
<body>
<sql:setDataSource
    var="newDS"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/Demo"
    user="root" password="root"
/>
<div class="row">
   <div class="span6">
<sql:query var="item"   dataSource="${newDS}">
      SELECT * FROM Items where id= '<%= request.getParameter("productId") %>';
</sql:query>
	<input  type="hidden" value="${productId}" name="id">
				
		<c:forEach var="products" items="${item.rows}">
		 <hr class="small">
			<h1 class="text-center"><img src="Image/${products.id}.jpg" style="height: 120px;"/></h1>
				<h3 class="text-center"><a >${products.name}</a></h3>
				<h3 class="text-center">${products.description}</h3>
				<h3 class="text-center">Rs ${products.price}</h3>
		 <hr class="small">
		</c:forEach> 
		       <div class="text-center">
				<button type="button"class="btn btn-primary">Buy Now</button><br><br>
			 
			  
				<form method="post" action="AddCartServlet" class="addCartForm">
							
				<button class="btn btn-info" id="addtocart">Add to Cart</button>
							
				</form>
				</div>
</div>
			
					

					
						
			</div>
			
<!--Scripts start here-->	
<script>
		var productPrice = "${product.productPrice}";
		var productId = "${productID}";
		function updateHeaderCartItemsCount(newCount) {
			$('.headerCartItemsCount').html(newCount);
			$('.headerCartItemsCountWord').html(
					(newCount == 1) ? ' item' : ' items');
		}
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
		// This script is used to update the price
		// based on the provided quantity
		$(function() {
			$('input.input-mini').keyup(function(event) {
				var quantity = $('input.input-mini').val();
				var totalPrice = quantity * productPrice;
				var subTotal = totalPrice + ".0";
				if ($.isNumeric(quantity)) {
					$('td.price').text(subTotal);
				}
			});
		});
		// This script is used to update the price
		// when the quantity field is empty
		$(function() {
			$('input.input-mini').focusout(function() {
				var quant = $('input.input-mini').val();
				if (quant == '') {
					var totalPrice = productPrice;
					$('td.price').text(totalPrice);
				}
			});
		});
		var form = $('addCartForm');
		var itemRequest = serializeObject(form);
		var cartItems = "${cart.numberOfItems}";
		$(function() {
			$('#addtocart').click(function(event) {
				$('#themodal').modal('toggle');
				$.ajax({
					url : $form.attr('action'),
					type : "POST",
					success : function(data) {
						updateHeaderCartItemsCount(cartItems);
						alert(cartItems);
					}
				});
			});
		});
		// Disables a button
		$(function disableButton() {
			jQuery.fn.extend({
				disable : function(state) {
					return this.each(function() {
						this.disabled = state;
					});
				}
			});
			$('#disabledbutton').disable(true);
		});
	</script>

<!-- Scripts end here -->
			
</body>
</html>