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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
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
	color: #fff;
}

table, td {
	padding: 10px;
	border-top: 1px solid #ddd;
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
	
	%>
	
	
	<div class="container register-form">
		<div class="form">
			<div class="note">
				<p>View Student</p>
			</div>
			<br>
			<div class="table-responsive" style="">
				<table class="table" style="">
					<tr>
						<td style="text-align: left"><b>ID</b></td>
						<td style="text-align: left">${student.id }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>Name</b></td>
						<td style="text-align: left">${student.firstname }&nbsp;${student.lastname }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>Gender</b></td>
						<td style="text-align: left">${student.gender }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>Date of birth(yyyy-mm-dd)</b></td>
						<td style="text-align: left">${student.dob }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>Email ID</b></td>
						<td style="text-align: left">${student.email }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>Contact Number</b></td>
						<td style="text-align: left">${student.contact }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>Address</b></td>
						<td style="text-align: left">${student.address }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>State</b></td>
						<td style="text-align: left">${student.state }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>City</b></td>
						<td style="text-align: left">${student.city }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>Zipcode</b></td>
						<td style="text-align: left">${student.zipcode }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>10th Percentage</b></td>
						<td style="text-align: left">${student.per10 }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>10th Board</b></td>
						<td style="text-align: left">${student.board10 }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>12th Percentage</b></td>
						<td style="text-align: left">${student.per12 }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>12th Board</b></td>
						<td style="text-align: left">${student.board12 }</td>
					</tr>
					<tr>
						<td style="text-align: left"><b>Branch Opted</b></td>
						<td style="text-align: left">${student.branch_name }</td>
					</tr>
					<c:if test="${status eq 'Confirm' }">
						<tr>
							<td style="text-align: left"><b>Actions Performed</b></td>
							
							<td style="text-align: left">
								<c:if test="${actions eq null }">
									<div class="alert alert-danger">
										<i class="fas fa-times"></i>&nbsp;&nbsp;<strong>No actions are completed</strong>
									</div>
								</c:if>
								<c:forEach var="act" items="${actions }">
									<c:if test="${act eq 'photo' }">
										<div class="alert alert-success">
											<i class="fas fa-check"></i>&nbsp;&nbsp;<strong>Uploaded photo</strong>
										</div>
									</c:if>
									<c:if test="${act eq 'aadhar' }">
										<div class="alert alert-success">
										    <i class="fas fa-check"></i>&nbsp;&nbsp;<strong>Aadhar Card Uploaded</strong>
										</div>
									</c:if>
									<c:if test="${act eq 'marksheet' }">
										<div class="alert alert-success">
										    <i class="fas fa-check"></i>&nbsp;&nbsp;<strong>Marksheets uploaded</strong>
										</div>
									</c:if>
								</c:forEach>
							</td>
						</tr>
					</c:if>
				</table>
			</div>
			<form method="post" action="/CollegeAdmissionManagementSystem/AdminHome" method="post">
				<input type="hidden" name="flag" value="adminHome">
				<div style="text-align: center">
					<button type="submit" class="btn btn-warning btnSubmit" style="text-align: center">Home</button>
				</div>
			</form>
			<br>
		</div>
	</div>
</body>
</html>