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
<title>Insert title here</title>
</head>
<body>
<!-- Section -->
	<section>
		<hr class="soft" />
		<c:choose>
			<c:when test="${empty cart}">
				<table class="table table-condensed">
					<tbody>
						<tr>
							<div class="hero-unit">
								<h3>No Items to Checkout!! Add Items to your shopping cart
									and comeback!! :)</h3>
								<a href="Home.jsp" class="btn btn-primary btn-large">Continue
									Shopping</a>
							</div>
						</tr>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<div class="review-payment">
					<h2>Review Your Order</h2>
				</div>
				<div class="table-responsive cart_info">
					<table class="table table-condensed">
						<thead>
						<tr class="cart_menu">
								<td class="image">Product</td>
								<td class="description">Description</td>
								<td class="quantity">Quantity</td>
								<td class="total">Total</td>
								<td class="action"></td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cart_products" items="${cart.items}">
								<c:set var="products" value="${cart_products.product}" />
								<tr>
									<td class="cart_product"><a href=""><img
											src="images/small/${productID}.jpg" alt=""></a></td>
									<td class="cart_description">
										<h4>
											<c:url var="url" value="/product">
												<c:param name="productId" value="${products.productId}" />
											</c:url>
											<a href="${url}"><c:out value="${products.productName}" /></a>
										</h4>
										<p class="info">
											Category:
											<c:out value="${products.category}" />
										</p>
										<p class="info">
											Manufacturer:
											<c:out value="${products.productManufacturer}" />
										</p>
									</td>
									<td class="cart_quantity">
										<p class="info">
											<c:out value="${cart_products.quantity}" />
										</p>
									</td>
									<td class="cart_total">
										<p class="cart_total_price">
											<c:out value="${cart_products.total}" />
										</p>
									</td>
									<td class="cart_delete"><a role="button" href="cart"
										class="btn btn-default" href="">Edit</a></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="3">&nbsp;</td>
											<td colspan="2">
									<div class="well">
										<table class="table table-condensed total-result">
											<tr>
												<td>Cart Sub Total</td>
												<td>
													<p>
														Rs.
														<c:out value="${cart.total}" />
													</p>
												</td>
											</tr>
											<tr class="shipping-cost">
												<td>Shipping Cost</td>
												<td>Free</td>
											</tr>
											<tr>
												<td>Total</td>
												<td>
													<p>
											Rs.
														<c:out value="${cart.total}" />
													</p>
												</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr class="soft" />
				<div class="paymentinfo">
					<p class="lead">Payment Information</p>
					<div class="span6">
						<div class="well">
							<ul id="payment-methods">
								<li><img src="images/mastercard.png" alt="Master Card"></li>
								<li><img src="images/visa.png" alt="Visa Express"></li>
								<li><img src="images/paypal.png" alt="Paypal"></li>
								<li><img src="images/AEx.png" alt="American Express"></li>
								<li><img src="images/discover.png" alt="Discover"></li>
							</ul>
							</br>
							<form action="purchase" method="post">
								<fieldset>
									<div class="control-group">
										<label for="cardType">Select your Card</label> <select
											id="cardType_SelectedValue" name="cardType.SelectedValue">
											<option>Master Card</option>
											<option>Visa Express</option>
											<option>American Express</option>
											<option>Discover</option>
										</select>
									</div>
									<div class="control-group">
										<label id="cardnumber" for="cardNumber">Credit Card
											Number</label>
										<div class="controls">
										<input class="span3" id="cardNumber" name="cardnumber"
												type="text" placeholder="">
										</div>
									</div>
									<div class="control-group">
										<label id="expire" for="expireDate">Expiry Date</label>
										<div class="controls">
											<input type="text" class="input-mini" size="1" maxlength="2"
												placeholder="MM"> <span class="divider">/</span> <input
												type="text" class="input-mini" size="2" maxlength="4"
												placeholder="YYYY">
										</div>
										<label id="expire" for="expireDate">Expiry Date</label>
										<div class="controls">
											<input type="text" class="input-mini" maxlength="3"placeholder="CVV" />
										</div>
										<div class="controls">
											<button role="submit" class="btn btn-primary">Purchase</button>
											<button role="reset" class="btn btn-primray">Reset</button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	</section>

</body>
</html>