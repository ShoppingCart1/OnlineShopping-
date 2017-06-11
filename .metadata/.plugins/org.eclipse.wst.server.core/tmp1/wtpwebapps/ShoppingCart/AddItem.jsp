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
	
	<link rel="stylesheet" type="text/css" href="adminForm.css">
</head>
<body>
	<div class="form-style">
	<fieldset>
	<legend>Add Item Page</legend>
	<form action="ItemUpdateServlet" method="post">

		
		 <input
			type="text" name="itemName" required placeholder="Item Name *"><br>
		<input
			type="text" name="unitPrice" required placeholder="Item Price *"><br>
		<input
			type="text" name="inventary" required placeholder="Inventary *"><br>

			<textarea name="itemDescription" placeholder="About Item with Description"></textarea>
		<br>
		<br> <input type="hidden" name="statusCode" value="1">
		<input type="hidden" name="operation" value="AddItem">
		<%
			
		%>
		<label style="color: blue">Category:</label><select
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
		<br> <label style="color: blue">SubCategory:</label><select
			name="subCategoryId" id="subCategories">

			<option selected disabled>SelectSubCategory</option>

		</select><br>
		<br> <!-- <label style="color: blue">Select Image</label><input
			type="file" /><br>
			<input type="hidden" id="imagePath" name="imagePath">
		<br> <input type="hidden" name="operation" value="Additem">
 -->		<input type="submit" value="update">

	</form>
</fieldset>
</div>
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
	
<!-- <script type="text/javascript">
    $(document).ready(function(){
    	$('input[type="file"]').change(function(e){
            var fileName = e.target.files[0].name;
            var tmppath = URL.createObjectURL(e.target.files[0]);
            debugger
            $("#imagePath").val(fileName);
            
        });
    });
</script> -->
</body>
</html>