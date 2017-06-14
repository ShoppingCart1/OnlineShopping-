<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Update failure</title>


<style type="text/css">
.page_wrap{
    width: 1200px;
     margin: 0 auto;
     height: 980px;
     background-color: #e6e6e6;
}
h1{
text-align: center;
text-decoration: none;
color: gray;
}
 .container1{
margin-top: 20px;
  margin-left: 320px;
  padding: 10px;
}
.container2{
margin-top: -57px;
  margin-left: 700px;
  padding: 10px;  
}
</style>
</head>
<body>
<div class="page_wrap">
<div class="container-fluid">
 
  <div class="row">
    <div class="col-lg-4">
    </div>
    <div class=" col-lg-4">
    <h1 style="color: red;">Failed.!!</h1>
    <h1>Oops..! Error occured while trying to save the changes(Added/Updated) in item list</h1>
    </div>
     <div class=" col-lg-4" >
    </div>
  </div>
</div>
<div class="container1">
    <button type="button" class="btn btn-default"><a style="text-decoration: none;" href="AddItem.jsp">Try again to Add Item</a></button>
    </div>
    <div class="container2">
      <button type="button" class="btn btn-default"><a style="text-decoration: none;" href="item_update.jsp">Try again to Update Item</a></button>
    </div>
    
</div>
</body>
</html>