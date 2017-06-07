<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.Connection,java.sql.Statement,java.sql.ResultSet" %>
   <%@ page import="com.mivim.connection.ConnectionManager" %>
    <%
    	String query="select id,category_name,parent_id from category";
    	Connection connection=null;
    	Statement statement=null;
    	ResultSet resultSet = null;
    	
    	connection=ConnectionManager.getConnection();
    	statement=connection.createStatement();
    	resultSet=statement.executeQuery(query);
    
    %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>item update page</title>
</head>
<body>
		<label style="color:blue">Item Update Form</label><br><br><br>
		<form action="" method="post">
			
	<label style="color:blue">ItemID:</label><input tpye="text" name="item_id"><br><br>
		<label style="color:blue">ItemName:</label><input type="text" name="item_name"><br><br>
			<label style="color:blue">Item Price:</label><input type="text" name="unit_price"><br><br>
			<label style="color:blue">Item_Description:</label><textarea rows="4" cols="50" name="item_description">
			</textarea><br><br>
			<%
			
				
			%>
			<label style="color:blue">Select Category:</label><select name="category_id">
  				<option value="Electronics">Electronics</option>
			</select><br><br>
			<label style="color:blue">Select Sub Category:</label><select name="sub_category_id">
  				<option value="Mobiles">Mobiles</option>
			</select><br><br>
			<label style="color:blue">Select Image</label><input type="file" name="image_path"><br><br>
			<input type="submit" value="update">
			
								
		
		</form>
		
</body>
</html>