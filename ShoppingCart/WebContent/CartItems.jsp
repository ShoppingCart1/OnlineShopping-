<%@page import="com.mivim.dto.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.util.*,com.mivim.dto.AddCartDto"%>
<%
	String username = (String) session.getAttribute("customerName");
	String userId = (String) session.getAttribute("userId");
	if (username != null) {
%>

<%
	Set<AddCartDto> listDto = (Set<AddCartDto>) session.getAttribute("addcart");
		request.setAttribute("addcart", listDto);
		int counter = listDto.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Add Cart</title>
<style type="text/css">
#continue {
	position: fixed;
	width: 100px;
	height: 150px;
	bottom: 3px;
	right: 100px;
	padding-right: 56px;
	font-size: 18px;
	z-index: 999;
}
#continueShopping
{
	position: fixed;
	height:150px;
	bottom: 3px;
	right: 200px;
	padding-right: 100px;
	font-size: 18px;
	z-index: 999;
}

a:link, a:visited {
	background-color: #3ab7ff;
	color: white;
	padding: 8px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;

}
a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}

a:hover, a:active {
	background-color: #59c2ff;
    color: white;
}
.button2 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
    width: 120px;
   	height: 35px;
}

.button2:hover {
    background-color: #008CBA;
    color: white;
}
</style>
</head>
<body ng-app="">
	
				<jsp:include page="header.jsp"/>
				<form action="OrderItemServlet" method="post" name="orderForm"
					id="orderFrom">
					<table id="res" class="table" name="orders" width="100%">
						<thead style="background-color: #e8e8e8; font-size: 20px;">
							<tr class="cart_menu">
								<td style="padding-left: 20px;"><strong>Product</strong></td>
								<td class="numeric"><strong>Name</strong></td>
								<td class="numeric"><strong>Price</strong></td>
								<td class="numeric"><strong>Quantity</strong></td>
								<td class="numeric"><strong>Total</strong></td>
							</tr>
						</thead>

						<tbody>
							<c:set var="count" value="0" scope="page" />
							<c:forEach items="${addcart}" var="dto">
								<tr>
									<c:set var="count" value="${count + 1}" scope="page" />
									<td name="itmeId"><img src="Image/${dto.getItemId()}.jpeg"
										alt="Image/${dto.getItemId()}.jpeg" width="100px"
										height="100px" />
									<td><c:out value="${dto.getItemName()}" /></td>
									<c:set var="price" value="${dto.getUnitPirce()}" />
									<td><c:out value="${dto.getUnitPirce()}" /></td>
									<td><input type="number" name="quantity" min="1"
										max="${dto.getInventary()}" ng-init="quantity${count}='1'"
										ng-model="quantity${count}" required></td>
									<td>{{quantity${count}*${price}}}</td>
									<input type="hidden" name="itemId" value="${dto.getItemId()}" />

									<input type="hidden" name="totalPrice"
										value="{{quantity${count}*${price}}}" />
								<tr>
							</c:forEach>

						</tbody>
						<tfoot>
							<tr>
								<td id="continue"><input type="submit" value="continue" class="button2"></td>
								<td id="continueShopping"><a href="index.jsp">ContinueShopping</a></td>
							</tr>
						</tfoot>
						</form>

					</table>
		
	</div>

	<div class="w3-container" style="float: left:">

		<button
			onclick="document.getElementById('id01').style.display='block'"
			class="w3-button w3-green w3-large">&#x26E8; Address</button>

		<div id="id01" class="w3-modal">
			<div class="w3-modal-content w3-card-4 w3-animate-zoom"
				style="max-width: 600px">

				<div class="w3-center w3-blue">
					<br> <span
						onclick="document.getElementById('id01').style.display='none'"
						class="w3-button w3-xlarge w3-hover-red w3-display-topright"
						title="Close Modal">&times;</span>
					<h4>Address</h4>
				</div>

				<form class="w3-container" action="AddressServlet" id="address"
					method="get">
					<div class="w3-section" id="displayAddress">
						<input type="hidden" name="userId" value="<%=userId%>"> <input
							class="w3-input w3-border w3-margin-bottom" type="text"
							placeholder="Address Line1" name="addressline1" id="addressline1"
							required /> <input class="w3-input w3-border" type="text"
							placeholder="Address Line2" name="addressline2" id="addressline2"
							required /><br> <input class="w3-input w3-border"
							type="text" placeholder="Enter state" name="state" id="state"
							required /> <br> <input class="w3-input w3-border"
							type="text" placeholder="Enter city" name="city" id="city"
							required> <br> <input class="w3-input w3-border"
							type="text" placeholder="Enter Pincode" name="pincode"
							id="pincode" required>
						<button class="w3-button w3-block w3-green w3-section w3-padding"
							type="submit">Submit</button>

					</div>
				</form>
			</div>

		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="w3-container">

		<button
			onclick="document.getElementById('id02').style.display='block'"
			class="w3-button w3-blue">Payment Mode</button>

		<div id="id02" class="w3-modal">
			<div class="w3-modal-content">
				<header class="w3-container w3-teal"> <span
					onclick="document.getElementById('id02').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
				<h2>Select PaymentMode</h2>
				</header>
				<form class="w3-container w3-card-4">
					<p>
						<input class="w3-radio" type="radio" name="gender"
							value="CashOnDelivery" checked> <label>CashOnDelivery</label>
					</p>
					<p>
						<input class="w3-radio" type="radio" name="gender"
							value="DebitCard" disabled> <label>DebitCard</label>
					</p>
					<p>
						<input class="w3-radio" type="radio" name="gender"
							value="CreditCard" disabled> <label>CreditCard</label>
					</p>
				</form>

			</div>
		</div>
	</div>
	<%
		} else {
			response.sendRedirect("user_login.jsp");
		}
	%>
	<script type="text/javascript">
		var frm = $('#address');

		frm.submit(function(e) {

			e.preventDefault();

			$.ajax({
				type : frm.attr('method'),
				url : frm.attr('action'),
				data : frm.serialize(),
				success : function(data) {
					$('#displayAddress').html(data);
					console.log('Submission was successful.');
					console.log(data);
				},
				error : function(data) {
					console.log('An error occurred.');
					console.log(data);
				},
			});
		});
	</script>
</body>
</html>