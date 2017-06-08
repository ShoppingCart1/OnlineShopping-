
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.mivim.dto.CategoriesDto,com.mivim.dao.UtilDAO"%>
<%--  <jsp:include page="utilServlet"/>   --%>
<%
	/* List<AdminDTO> list=(List<AdminDTO>)request.getAttribute("categeries"); */
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Item Page</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<label style="color: blue">AddItemForm</label>
	<br>
	<br>
	<br>
	<form action="ItemUpdateServlet" method="post">

		<label style="color: blue">ItemID:</label><input tpye="text"
			name="itemId" required><br>
		<br> <label style="color: blue">ItemName:</label><input
			type="text" name="itemName" required><br>
		<br> <label style="color: blue">Item Price:</label><input
			type="text" name="unitPrice" required><br>
		<br> <label style="color: blue">Inventory:</label><input
			type="text" name="inventory"><br>
		<br> <label style="color: blue">Item_Description:</label>
		<textarea rows="4" cols="50" name="itemDescription">
			</textarea>
		<br>
		<br> <input type="hidden" name="statusCode" value="1">
		<%
			
		%>
		<label style="color: blue">Select Category:</label><select
			name="categoryId" id="categories">
			<option selected disabled>SelectCategory</option>
			<%
				List<CategoriesDto> list = UtilDAO.getElements();
				for (CategoriesDto categories : list) {
			%>
			<option value="<%=categories.getId()%>"><%=categories.getCategoryName()%></option>
			<%
				}
			%>
		</select><br>
		<br> <label style="color: blue">Select Sub Category:</label><select
			name="subCategoryId" id="subCategories">

			<option selected disabled>SelectSubCategory</option>

		</select><br>
		<br> <label style="color: blue">Select Image</label><input
			type="file" /><br>
			<input type="hidden" id="imagePath" name="imagePath">
		<br> <input type="hidden" name="operation" value="Additem">
		<input type="submit" value="update">

	</form>

	<script>
		$(document).ready(
				function() {

					$('#categories').change(
							function(event) {
								var categories = $("select#categories").val();
								$.get('UtilServlet', {
									category_id : categories
								}, function(response) {
									var select = $('#subCategories');
									select.find('option').remove();
									$.each(response, function(index, value) {
										$('<option>').val(value.id).text(
												value.categoryName).appendTo(
												select);
									}, function(error) {
									});
								});
							});

				});
	</script>
	
<script type="text/javascript">
    $(document).ready(function(){
    	$('input[type="file"]').change(function(e){
            var fileName = e.target.files[0].name;
            var tmppath = URL.createObjectURL(e.target.files[0]);
            debugger
            $("#imagePath").val(fileName);
            
        });
    });
</script>
</body>
</html>