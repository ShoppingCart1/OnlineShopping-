<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.mivim.dto.StateDto,com.mivim.dto.CategoriesDto,com.mivim.dao.UtilDAO"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>.
<title>User Address</title>
<style type="text/css">
.page_wrap{
    width: 1200px;
    margin: 0 auto;
    height: 920px;
}
.container{
 margin-left: 200px;
}
.container1{
margin-top: 20px;
  margin-left: 0px;
  padding: 10px;
}
.container2{
margin-top: -53px;
  margin-left: 300px;
  padding: 10px;  
}
</style>
</head>
<body>
<div class="page_wrap">
<h1 align="center" style="font-family: cursive;">User Address Form</h1>

<form method="get" action="AddressServlet" class="container">
<div class="container">
<textarea rows="4" cols="50" name="addressline1" placeholder="Enter Address Line 1" style="font-family: monospace;" required></textarea><br><br>
<textarea rows="4" cols="50" name="addressline2" placeholder="Enter Address Line 2" style="font-family: monospace;" required></textarea><br><br>
<label style="color: blue"></label><select
			name="stateId" id="states">
			<option selected disabled>Select State</option>
			<%
				List<StateDto> list = UtilDAO.getStateElements();
				for (StateDto states : list) {
			%>
			<option value="<%=states.getCity_id()%>"><%=states.getCity_name()%></option>
			<%
			System.out.println(states.getCity_id()+" "+states.getCity_name());
				}
			%>
		</select><br>
		<br> <label style="color: blue"></label><select
			name="city" id="city">
			
			<option selected disabled>Select City</option>

		</select><br><br>
<input type="text" name="pincode" placeholder="Enter Pincode here" style="font-family: monospace;" required /><br><br>
<input type="hidden" name="user_id" value="1234"/>
<input type="hidden" name="status" value="1"/>
<div class="container1">
 <button type="submit" class="btn btn-success">Submit</button>
</div> 
   <div class="container2">
    <button type="reset" class="btn btn-danger">Clear</button>
</div>

</div>
</form>
</div>
<script>
		$(document).ready(
				function() {

					$('#states').change(
							function(event) {
								var states = $("select#states").val();
								$.get('UtilServletCity', {
									city_id : states
								}, function(response) {
									var select = $('#city');
									select.find('option').remove();
									$.each(response, function(index, value) {
										$('<option>').val(value.city_name).text(
												value.city_name).appendTo(
												select);
									}, function(error) {
									});
								});
							});

				});
	</script>
</body>
</html>