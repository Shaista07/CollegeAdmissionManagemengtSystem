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
<link
	href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
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
			
			<form onsubmit="return validate()" id="registration" method="post" action="/CollegeAdmissionManagementSystem/StudentHome?flag=update<%=update%>" method="post">
			<div class="form-content">
				<%if(update.equals("details")) { %>
					<input type="hidden" class="form-control" id="age" name="age" value="${userName.age }"/>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" name="id" class="form-control" readonly="readonly" style="background-color: #f2f2f2;" value="${userName.id }">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input onkeyup="return validate()" prev-data="${userName.email }" id="email" type="email" class="form-control" placeholder="Email *" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" value="${userName.email }" required />
								<span id="email1" style="color: red; font-size: 13px;"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="First Name *" name="fname" pattern="[A-Za-z]{1,50}" title="Only Alphabets" value="${userName.firstname }" required/>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Last Name *" pattern="[A-Za-z\s]{1,50}" title="Only Alphabets and space" value="${userName.lastname }" name="lname" required/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Contact *" pattern="[0-9]{10,10}" title="Must contain 10 digits" maxlength="10" name="contact" value="${userName.contact }" required/>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="dd-mm-yyyy" id="mydate" name="dob" value="${userName.dob }"  required/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Address *" name="address" value="${userName.address }" required />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="State *" pattern="[A-Za-z\s]{1,50}" title="Only Alphabets and space" value="${userName.state }" name="state" required/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="City *" pattern="[A-Za-z\s]{1,50}" title="Only Alphabets and space" name="city" value="${userName.city }" required />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Zip-Code *" pattern="[0-9]{6,6}" title="Must contain 6 digits" name="zipcode" value="${userName.zipcode }" required/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="10th Percentage *" name="per10" maxlength="5" value="${userName.per10 }" required/>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="10th Board *" name="board10" readonly="readonly" style="background-color: #f2f2f2;" value="${userName.board10 }"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="12th Percentage *" name="per12" maxlength="5" value="${userName.per12 }" required/>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="12th Board *" name="board12" readonly="readonly" style="background-color: #f2f2f2;" value="${userName.board12 }"/>
							</div>
						</div>
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
					<a href="/CollegeAdmissionManagementSystem/StudentHome?flag=studentHome"><button type="button" class="btn btnSubmit" style="text-align: center">Cancel</button></a>
				</div>
			</div>
			</form>
		</div>
	</div>
	<script>
	$(document).ready(function() {

		$('#mydate').datepicker({dateFormat: "dd-mm-yy",
			changeMonth: true,
			changeYear: true,
			yearRange: '-80:+0',
			onSelect: function(value, ui) {
			var today = new Date(); 
			var age = parseInt(today.getFullYear()) - parseInt(ui.selectedYear);
			$('#age').val(age);}
			});
		$("#registration")
		.validate(
				{
					rules : {
						"age" : {
							required : true,
							digits : true,
							min : 18,
							max : 25

						}
					},
				messages : {
					"age" : {
						required : "Age is required",
						min : "You are too young to join.",
						max : "Age should be within 25 years.",
						digits : "Only digits are allowed"
					}
				}
				});
	});

	</script>
</body>
</html>