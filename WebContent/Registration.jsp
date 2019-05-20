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
<title>Register</title>

<script>
	function checkMail() {
	  var xhttp = new XMLHttpRequest();
	  var email = document.getElementById("email");
	  var email1 = document.getElementById("email1");
	  var url = "CheckMail?em=" + email.value;
	  
	  xhttp.onreadystatechange = function() {
	  	if (this.readyState == 4 && this.status == 200) {
	    	var status = this.responseText;
	    	
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
<body>
	<div class="container register-form">
		<div class="form">
			<div class="note">
				<p>Admission Form</p>
			</div>
			<form onsubmit="return validate()" method="post" id= "registration" action="StudentRegister">
			<div class="form-content">
				<div class="row">
					<div class="col-md-6">
					
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="First Name *" name="fname" pattern="[A-Za-z]{1,50}" title="Only Alphabets" required/>
						</div>
						<div class="radio form-group" style="border:1px solid lightgrey;height:39px;border-radius:22px;padding:6px 20px">
							<label>Gender : <input type="radio" value="Female" name="gender">Female</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input type="radio" value="Male "name="gender">Male</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input type="radio" value="Other "name="gender">Other</label>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="dob" id="mydate" placeholder="dd-mm-yyyy" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Address *"
								name="address" required />
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="City *" pattern="[A-Za-z\s]{1,50}" title="Only Alphabets and space"
								name="city" required />
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="10th Percentage *" name="per10" maxlength="5" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="12th Percentage *" name="per12" maxlength="5" required/>
						</div>
						<div class="form-group">
							<input type="email" onkeyup="return validate()" id="email" class="form-control" placeholder="Email *" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
								name="email" required />
							<span id="email1" style="color: red; font-size: 13px;"></span>
						</div>
						<div class="form-group">
						<label>Interested Branch</label>
							<select class="form-control" name="branch" style="width:355px;height:39px;border-radius:22px;">
  							<option value="cse">CSE</option>
  							<option value="ece">ECE</option>
  							<option value="ee">EE</option>
  							<option value="it">IT</option>
  							<option value="me">ME</option>
		</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Last Name *" pattern="[A-Za-z\s]{1,50}" title="Only Alphabets and space"
								name="lname" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Contact *" pattern="[0-9]{10,10}" maxlength="10" title="Must contain 10 digits"
								name="contact" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Age *" id="age" name="age" pattern="[0-9]{1,2}" maxlength="2" title="1 or 2 digits" readonly="true" required />
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="State *" pattern="[A-Za-z\s]{1,50}" title="Only Alphabets and space"
								name="state" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Zip-Code *" pattern="[0-9]{6,6}" title="Must contain 6 digits"
								name="zipcode" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="10th Board *"
								name="board10" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="12th Board *"
								name="board12" required/>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="Password *"
								name="pass" required/>
						</div>
					</div>
				</div>
				<div style="text-align: center">
					<input type="submit" class="btn btnSubmit" style="text-align: center" value="Submit">&nbsp;&nbsp;
					<a href="/CollegeAdmissionManagementSystem"><button type="button" class="btn btnSubmit" style="text-align: center">Cancel</button></a>
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