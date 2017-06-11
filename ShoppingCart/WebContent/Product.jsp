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
  
  
<title>Insert title here</title>

</head>

<body>
<div class="row">
			<div class="span6">
				<input  type="hidden" value="${id}" name="id">
				<c:out value="${products.id}"></c:out>
				
				<p class="lead">${product.name}</p>
				<button type="button"class="btn btn-primary pull-right" data-toggle="modal" data-target="#themodal">Buy Now</button>
				<p>${product.price}</p>
				
				<br>
				<p>${product.description}</p>
			</div>
			<div id="themodal" class="modal fade" role="dialog">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3>Add Item to the Cart</h3>
				</div>

				<div class="modal-body">
					
							<p class="text-success">Product - ${product.name} will
								be added to your Shopping Cart.</p>
						

					<hr />
					<div>
						<table class="table table-condensed">
							<thead>
								<tr>
									<td>Product</td>
									<td>Quantity</td>
									<td>Price</td>
								</tr>
							</thead>
							<tbody>
								<tr class="active">
									<td><img src="Images/${id}.jpg" /></td>
									<td><input class="input-mini" type="text" placeholder="1"></td>
									<td class="price">${product.price}</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="modal-footer">
						<form method="post" action="addProducts" class="addCartForm">
							
									<button class="btn btn-primary pull-left" id="addtocart">Add
										to Cart</button>
								

							<a href="Home.jsp" class="btn" data-dismiss="modal">Continue
								Shopping</a> <a id="yesbutton" href="checkout.jsp" class="btn btn-primary">Place
								Order</a>
						</form>
					</div>
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