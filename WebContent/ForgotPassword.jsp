<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

	<script language="javascript">
		/* window.history.forward(1); */
		browser.cache.offline.enable = false;
		/* function noBack() {
			window.history.forward(1);
			
		} */
		self.close(1);
	</script>

<style>
.loginBlock {
	position: relative;
	background-color: #e6e6ff;
	padding: 35px 90px;
	border-radius: 5px;
	box-shadow: 0px 0px 30px 2px;
	margin-right:20px;
	max-width: 550px;
}
body {
/* background: url(images/back.jpg); */
background-image: linear-gradient(45deg, #884dff, #ff5c33);
font-family: "open sans";
background-size: cover;
background-position: center;
    background-attachment: fixed;
    height: /* 140vh */;
}
.logoContainer {
	padding: 30px 20px;
	color: #041177;
	font-size: 25px;
	letter-spacing: 2px;
}

span.logoRight {
	font-weight: bold;
}
p a btn:hover{
	color:blue;
}
option{

     padding:20px 0;
   }
</style>

<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<div class="container">
<div class="row">
<div class="col-sm-12 col-md-12">
<div style="height:30px;"></div>


<center>		
<br><br>	
<div class="loginBlock">

 <h1><i class="fa fa-lock" aria-hidden="true"></i> Forgot Password</h1>
	
<form method="post" action="AdminLoginCheck">
	<input type="hidden" name="flag" value="resetPassword">
 <div class="form-group">
	<div class="input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-cogs"></i> </span>
		 </div>
		<select class="form-control" name="user" style="width:297px;height:39px;border-radius:4px;border:transparent;">
  			<option value="admin">Admin</option>
  			<option value="student">Student</option>
		</select>
	</div>
	</div>
<div class="form-group">
	<div class="input-group">
	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-user"></i></span>
			 </div>
			<input name="id" class="form-control" placeholder="User Id" type="text" required>
	</div>
	</div>
	
	<div class="row" style="text-align: center">
			<button type="submit" class="btn btn-primary">Reset Password</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-danger">Clear</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/CollegeAdmissionManagementSystem" style="color: white;" class="btn btn-warning">Back</a>
	</div>
	
	</form>
	</div>
	<br><br>
	</center>
	</div>
	</div>
</div>


<script>
	$('.alert').alert();
</script>
</body>

</html>