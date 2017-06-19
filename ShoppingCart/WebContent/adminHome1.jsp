<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.mivim.dto.LoginDto"
    import="java.sql.*"
    %>
    
     <%
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 
    new java.util.Date();
    
    String name=null;
    if(session.getAttribute("currentSessionUser")==null)
    {
    %><% name = (String)(session.getAttribute("currentSessionUser"));
    		
   			
    		%>
  
<!DOCTYPE html>
<html>
<head>

<meta charSet="UTF-8" content="text/html">
<title>AdminLogged</title>
<script type="text/javascript" src="min.js"></script>
<style>
body {
	background: url(4.jpg);
	background-repeat:no-repeat;
	background-size:cover;
	color: #000;
	font: 14px Arial;
	margin: 0 auto;
	padding: 0;
	width:100%;
	position: relative;
	
}

#id1{background-repeat:no-repeat;
	background-size:cover;
	color: #000;
	font: 14px Arial;
	margin: 0 auto;
	padding: 0;
	width:85%;
	position: relative;}


#main{	
		width:100%;
		height:700px;
		background-color:#edebe5;
		-webkit-box-shadow: 1px 10px 21px 3px rgba(10,10,10,1);
-moz-box-shadow: 1px 10px 21px 3px rgba(10,10,10,1);
box-shadow: 1px 10px 21px 3px rgba(10,10,10,1);
		
		
	}
	#title
	{
		font-size:50px;
	
	}
	

#footerid{width:100%;
background-color:#ffffff;
    color:black;
    clear:both;
    text-align:center;
   padding:5px;
   font-color:black;
   font-size:15px;

}
				
		</style>
</head>
<body>
        <div id="id1">
<jsp:include page="adminHeader2.jsp"/>
   
<iframe src=""  id="main" name="main" frameborder="0" ></iframe>
  </div>
<footer id="footerid"><h5> copy rights &#169 mivimtech.com</h5>

</footer>
<%}
else
response.sendRedirect("index.jsp");%> 

</body>
</html>
