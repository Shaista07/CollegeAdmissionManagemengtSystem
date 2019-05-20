<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.note {
	text-align: center;
	height: 80px;
	background: -webkit-linear-gradient(left, #0072ff, #8811c5);
	color: #fff;
	font-weight: bold;
	line-height: 80px;
}

.form-content {
	padding: 5%;
	border: 1px solid #ced4da;
	margin-bottom: 2%;
}

.form-control {
	border-radius: 1.5rem;
}

.btnSubmit {
	border: none;
	border-radius: 1.5rem;
	padding: 1%;
	width: 20%;
	cursor: pointer;
	background: #0062cc;
	color: #fff;
}
</style>
<title>Update Profile</title>


<script language="javascript">
	window.history.forward(1);
	browser.cache.offline.enable = false;
	function noBack() {
		browser.cache.offline.enable = false;
		window.history.forward(1);
		
	}
</script>


<script>
	function checkMail() {
	  var xhttp = new XMLHttpRequest();
	  var email = document.getElementById("email");
	  var email1 = document.getElementById("email1");
	  var email2 = document.getElementById("email").getAttribute("prev-data");
	  
	  var url = "CheckMail?em=" + email.value;
	  
	  xhttp.onreadystatechange = function() {
	  	if (this.readyState == 4 && this.status == 200) {
			
	  		var status = this.responseText;
	    	
			if(email.value == email2) {
				status = "true";
			}
			
	    	console.log(status);
	    	
	    	if(status == "true") {
	    		email1.innerHTML = "";
	    		return true;
	    	}
	    	else if(status == "false"){
	    		email1.innerHTML = "<b>Invalid Email</b>";
	    		return false;
	    	}
	    	else {
	    		email1.innerHTML = "<b>AJAX error</b>";
	    		return false;
	    	}
	    }
	  };
	  
	  xhttp.open("GET", url, true);
	  xhttp.send();
	}
</script>

<script>
	function validate() {
		checkMail();
		var em1 = document.getElementById("email1").innerHTML;
		if(em1 == "")
			return true;
		else
			return false;
	}
</script>

</head>
<body onload="noBack()">
	<%
	response.setHeader("Cache-Control", "no-cache, no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma","no-cache");
	if(session.getAttribute("userName") == null){
		response.sendRedirect("/CollegeAdmissionManagementSystem/");
		return;
	}
	
	String update = request.getParameter("update");
	%>
	
	
	<div class="container register-form">
		<div class="form">
			<div class="note">
				<p>Update Profile</p>
			</div>
			
			<form onsubmit="return validate()" method="post" action="/CollegeAdmissionManagementSystem/AdminHome?flag=update<%=update%>" method="post">
			<div class="form-content">
				<%if(update.equals("details")) { %>
					<div class="form-group">
						<input type="text" name="id" class="form-control" readonly="readonly" style="background-color: #f2f2f2;" value="${userName.id }">
					</div>
					<div class="form-group">
						<input type="text" name="name" class="form-control" placeholder="Name" style="" value="${userName.name }" pattern="[A-Za-z\s]{1,50}" title="Only Alphabets and space" required>
					</div>
					<div class="form-group">
						<input type="text" name="contact" class="form-control" placeholder="Contact Number" style="" value="${userName.contact }" pattern="[0-9]{10,10}" maxlength="10" required>
					</div>
					<div class="form-group">
						<input onkeyup="return validate()" prev-data="${userName.email }" id="email" type="email" name="email" class="form-control" placeholder="Email ID" style="" value="${userName.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
						<span id="email1" style="color: red; font-size: 13px;"></span>
					</div>
					<div class="form-group">
						<input type="text" name="address" class="form-control" placeholder="Address" style="" value="${userName.address }" required>
					</div>
				<%} %>
				
				<%if(update.equals("password")) { %>
					<div class="form-group">
						<input type="text" name="id" class="form-control" readonly="readonly" style="background-color: #f2f2f2;" value="${userName.id }">
					</div>
					<div class="form-group">
						<input type="password" name="oldpass" class="form-control" placeholder="Current Password" style="" required>
					</div>
					<div class="form-group">
						<input type="password" name="newpass" class="form-control" placeholder="New Password" style="" required>
					</div>
				<%} %>
				
				
				<div style="text-align: center">
					<input type="submit" class="btn btnSubmit" style="text-align: center" value="Submit">&nbsp;&nbsp;
					<a href="/CollegeAdmissionManagementSystem/AdminHome?flag=adminHome"><button type="button" class="btn btnSubmit" style="text-align: center">Cancel</button></a>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>