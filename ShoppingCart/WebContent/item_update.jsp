<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.Connection,java.sql.Statement,java.sql.ResultSet" %>
   <%@ page import="com.mivim.connection.ConnectionManager" %>
    <%
    	String query="select id,category_name,parent_id from category";
    	Connection connection=null;
    	Statement statement1=null;
    	Statement statement2=null;
    	ResultSet resultSet1 = null;
    	ResultSet resultSet2 = null;
    	
    	connection=ConnectionManager.getConnection();
    	statement1=connection.createStatement();
    	statement2=connection.createStatement();
    	resultSet1=statement1.executeQuery(query);
    	resultSet2=statement2.executeQuery(query);
    
    %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>item update page</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
</head>
<body ng-app="">
		<label style="color:blue">Item Update Form</label><br><br><br>
		<form action="" method="post">
			
	<label style="color:blue">ItemID:</label><input tpye="text" name="item_id"><br><br>
		<label style="color:blue">ItemName:</label><input type="text" name="item_name"><br><br>
			<label style="color:blue">Item Price:</label><input type="text" name="unit_price"><br><br>
			<label style="color:blue">Item_Description:</label><textarea rows="4" cols="50" name="item_description">
			</textarea><br><br>
			<%
			
				
			%>
			<label style="color:blue">Select Category:</label><select name="category_id" ng-model="selected_category_id">
			<%while(resultSet2.next())
				{
					String category_name=resultSet2.getString("category_name");
					String category_id=resultSet2.getString("id");
					String parent_id=resultSet2.getString("parent_id");
					if(parent_id.equals("0"))
					{
				%>
  				<option value="<%=category_id%>"><%=category_name %></option>
  				<%}} 
  				%>
			</select><br><br>
			<label style="color:blue">Select Sub Category:</label><select name="sub_category_id">
			<%while(resultSet1.next()){
				String sub_category_name=resultSet1.getString("category_name");
				String sub_category_id=resultSet1.getString("id");
				String parent_id=resultSet1.getString("parent_id");
				%><%String parent_category_id="";%>{{selected_category_id}}
				
				<%
				if(!(parent_id.equals("0")))
				{
				%>
  				<option value="<%=sub_category_id%>"><%=sub_category_name %></option>
  				<%} }%>
			</select><br><br>
			<label style="color:blue">Select Image</label><input type="file" name="image_path"><br><br>
			<input type="submit" value="update">
			
								
		
		</form>
		
</body>
</html>