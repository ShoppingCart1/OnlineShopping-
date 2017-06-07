<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>  
<%@ page import="java.time.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
//Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ecommerce");

%>

<h1>Add New Product Details</h1>
<form method="post" action="AddItemServlet">
<label for="item_id">Item ID</label>
<input type="text" name="item_id"><br><br>
<label for="item_name">Item Name</label>
<input type="text" name="item_name"><br><br>
<label for="unit_price">Item Price</label>
<input type="text" name="unit_price"><br><br>
<label for="file">Select an Image file to upload:</label>
<br> <br>
<input type = "file" name = "file" size = "50" />
<br> <br>
<label for="inventory">Inventory</label>
<input type="text" name="inventory"><br><br>
<label for="item_description">Item Description</label>
<input type="text" name="item_description"><br><br>
<label for="status">Status</label>
<input type="text" name="status"><br><br>
<label for="category">Category</label>

<select name="category">
  <option value="none">Please Select the category</option>
  <option value="mobileaccessories">Mobile Accessories</option>
  <option value="laptops">Laptops</option>
  <option value="desktoppcs">DesktopPcs</option>
  <option value="tablets">Tablets</option>
  <option value="television">Television</option>
  <option value="computeraccessories">Computer Accessories</option>
  <option value="camera">camera</option>
  <option value="footwear">FootWear</option>
  <option value="sportwear">SportWear</option>
  <option value="watches">watches</option>
  <option value="topwear">TopWear</option>
  <option value="footwear">FootWear</option>
  <option value="cloths">Cloths</option>
  <option value="sportwear">SportWear</option>
  <option value="watches">watches</option>
  <option value="furniture">Furniture</option>
  <option value="dining&serving">Dining & Serving</option>
  <option value="kitchenstorage">Kitchen Storage</option>
  <option value="lighting">Lighting</option>
  <option value="homedecor">Home Decor</option>
</select>
<br><br>
<input type="submit" value="Submit">
<input type="reset" value="Clear"><br><br>
</form>
</body>
</html>