<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.mivim.dto.CategoriesDto,com.mivim.dto.AdminDTO,com.mivim.dao.UtilDAO"%>
<%--  <jsp:include page="utilServlet"/>   --%>
<%
	 AdminDTO adminDTO=(AdminDTO)request.getAttribute("updateFormDetails");
	String itemId=adminDTO.getItem_id();
	String itemName=adminDTO.getItem_name();
	String unitPrice=adminDTO.getUnit_price();
	String inventary=adminDTO.getInventory();
	String itemDescription=adminDTO.getItem_description();
	String categoryId=adminDTO.getCategory_id();
	String subCategoryId=adminDTO.getSub_category();

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ItemUpdatePage</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="adminForm.css">
</head>
<body>
	<jsp:include page="adminHeader.jsp"/>
	<div class="form-style">
	<fieldset>
	<legend> Update Item Info</legend>
	<form action="ItemUpdateServlet" method="post">

		<label style="color: blue">ItemId:</label><input
			type="text" value="<%=itemId %>" required disabled>
			<input type="hidden" value="<%=itemId %>" name="itemId">
			<br>
		<br> <label style="color: blue">ItemName:</label><input
			type="text" name="itemName" value="<%=itemName %>" required><br>
		<br> <label style="color: blue">Item Price:</label><input
			type="text" name="unitPrice" value="<%=unitPrice %>"required><br>
		<br> <label style="color: blue">Inventory:</label><input
			type="text" name="inventary" value="<%=inventary %>"><br>
		<br> <label style="color: blue">Item_Description:</label>
		<textarea rows="4" cols="50" name="itemDescription" value="<%=itemDescription %>" p>
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

		</select>
		
		<br> <input type="hidden" name="operation" value="UpdateItem">
		<input type="submit" value="update">

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