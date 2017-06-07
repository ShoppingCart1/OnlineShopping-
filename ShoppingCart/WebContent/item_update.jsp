<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.Connection,java.sql.Statement,java.sql.ResultSet,java.util.List" %>
   <%@ page import="com.mivim.connection.ConnectionManager,com.mivim.dto.AdminDTO,com.mivim.dao.UtilDAO" %>
    <%--  <jsp:include page="utilServlet"/>   --%>
    <%

    	/* List<AdminDTO> list=(List<AdminDTO>)request.getAttribute("categeries"); */
    
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
			<label style="color:blue">Select Category:</label><select name="category_id" onchange='getSubCategry(this)'>
			
			<%List<AdminDTO> list=UtilDAO.getElements();
				for(AdminDTO categories:list)
				{
			%>
  				<option value="<%=categories.getCategory_id() %>"><%=categories.getCategory_name() %></option>
  				<%} %>
			</select><br><br>
			<label style="color:blue">Select Sub Category:</label><select name="sub_category_id">
			
  				<option value=""></option>
  				
			</select><br><br>
			<label style="color:blue">Select Image</label><input type="file" name="image_path"><br><br>
			<input type="submit" value="update">
			
								
		
		</form>
		
		<script type="text/javascript">
		
		function getSubCategry(selectedItem){
			
			
		}
		
		
		</script>
		
</body>
</html>