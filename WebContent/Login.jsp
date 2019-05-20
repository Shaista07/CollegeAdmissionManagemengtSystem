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
	background-color: transparent;
	padding: 35px 90px;
	border-radius: 5px;
	box-shadow: 0px 0px 30px 2px;
	margin-right:20px;
	max-width: 550px;
}
body {
background: url(images/back.jpg);
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

<script>
	function showPass() {
		var x = document.getElementById("password");
		var y = document.getElementById("showpassword");
		console.log("TEST\"");
		console.log(y.innerHTML);
		if(y.innerHTML == "<i class=\"fas fa-eye-slash\"></i>") {
			y.innerHTML = "<i class=\"fas fa-eye\"></i>";
			x.type = "text";
		}
		
		else if(y.innerHTML == "<i class=\"fas fa-eye\"></i>") {
			y.innerHTML = "<i class=\"fas fa-eye-slash\"></i>";
			x.type = "password";
		}
		return true;
	}
</script>


<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<div class="container">
<div class="row">
<div class="col-sm-12 col-md-12">
<div style="height:30px;"></div>
<div class="logoContainer">
				<span ><center>FUTURE INSTITUTE OF ENGINEERING AND MANAGEMENT<br></span><span class="logoRight">ADMISSION MANAGEMENT SYSTEM</center> </span>
			</div>

<center>			
<div class="loginBlock">

 <h1><i class="fa fa-lock" aria-hidden="true"></i> Login</h1>
 <form action="Registration.jsp">
 	<div class="form-group">
	<button type="submit" class="btn btn-primary btn-block" href=""> Student Registration  </button>
	</div>
</form>
	
	
<form method="post" action="AdminLoginCheck">
	<input type="hidden" name="flag" value="login">
 <div class="form-group">
	<div class="input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-cogs"></i> </span>
		 </div>
		<select name="user" style="width:297px;height:39px;border-radius:4px;border:transparent;">
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
			<input name="uname" class="form-control" placeholder="User Id" type="text" required>
	</div>
	</div>
	<div class="form-group">
	<div class="input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		 </div>
	    <input id="password" style="border-right: none;" class="form-control" placeholder="******" type="password" name="pass" required>
	    <div class="input-group-append">
		    <span style="" onclick="return showPass()" class="input-group-text" id="showpassword"><i class='fas fa-eye-slash'></i></span>
		</div>
	</div>
	</div> 
	
	<%-- <c:if test="${incorrect eq true }">
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
		  <strong>Incorrect Credentials!</strong> Please try again.
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
	</c:if> --%>
	<div class="form-group">
	<button type="submit" class="btn btn-primary btn-block"> Login  </button>
	<button type="reset" class="btn btn-danger btn-block"> Reset  </button>
	</div>
	
	</form>
	<p class="text-center"><a href="ForgotPassword.jsp" class="btn" style="color:#ff0000;font-size:20px;"><b>Forgot password?</b></a></p>
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