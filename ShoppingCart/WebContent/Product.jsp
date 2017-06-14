<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="com.mivim.*"%>

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
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource var="newDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/Demo" user="root" password="mysql" />
	<div class="row">
		<div class="span6">
			<sql:query var="item" dataSource="${newDS}">
      SELECT * FROM Items where id= '<%=request.getParameter("productId")%>';
</sql:query>
			<input type="hidden" value="${productId}" name="id">

			<c:forEach var="products" items="${item.rows}">
				<hr class="small">
				<form>
					<input type="hidden" name="itemId" value="${products.id}">
					<input type="hidden" name="itemName" value="${products.name}">
					<input type="hidden" name="itemDescription"
						value="${products.description}"> <input type="hidden"
						name="price" value="${products.price}">

				</form>
				<h1 class="text-center">
					<img src="Image/${products.id}.jpg" style="height: 120px;" />
				</h1>
				<h3 class="text-center">
					<a>${products.name}</a>
				</h3>
				<h3 class="text-center">${products.description}</h3>
				<h3 class="text-center">Rs ${products.price}</h3>

				<hr class="small">

				<div class="text-center">
					<button type="button" class="btn btn-primary">Buy Now</button>
					<br>
					<br>

					<form action="AddCartServlet" method="post">
						<input type="hidden" name="itemId" value="${products.id}">
						<input type="hidden" name="itemName" value="${products.name}">
						<input type="hidden" name="itemDescription"
							value="${products.description}"> <input type="hidden"
							name="price" value="${products.price}">
						<button class="btn btn-info" id="addtocart">Add to Cart</button>
					</form>
				</div>

			</c:forEach>
		</div>





	</div>



</body>
</html>