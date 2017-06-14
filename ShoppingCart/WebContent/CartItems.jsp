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