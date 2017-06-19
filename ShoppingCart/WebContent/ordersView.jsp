<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.util.*,com.mivim.dto.AddCartDto"%>
<%String address=(String)request.getAttribute("address"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>MyOrders</title>
<style type="text/css">
	td{
		text-align:center;
	
	}
	tr{
		padding-bottom: 10em;
	}
	body{
		padding:0px 100px 0px 100px;
		background-color: #f4f4f4;
}
	
</style>

</head>
<body>
	<jsp:include page="adminHeader.jsp"/>
	<div class="w3-container w3-light-blue">
  <h1 align="center">My Orders</h1>
</div>
		<table class="w3-table-all w3-hoverable">
			
				<thead style="background-color: #696763; font-size: 20px;">
							<tr class="w3-blue">
								<td colspan="2"><strong>Item Name</strong></td>
								<td><strong>Address</strong></td>
								<td><strong>TotalPrice</strong></td>
								<td><strong>Quantity</strong></td>
							</tr>
						</thead>
			
		<c:forEach items="${placeOrderDetails}" var="dto">
			<tr>
			<td name="itmeId"><img src="Image/${dto.getItem_id()}.jpeg"
				alt="Image/${dto.getItem_id()}.jpeg" width="100px" height="100px" />
			<td class="w3-text-blue"><c:out value="${dto.getItemName()}" /></td>
			<td><c:out value="<%=address %>"/></td>
			<td><c:out value="${dto.getTotalPrice()}" /></td>
			<td><c:out value="${dto.getQuantity()}"></c:out></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>