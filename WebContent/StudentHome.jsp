<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Student Home</title>
<style>
.position-sticky {
    top: 1rem;
}

.card-title {
    font-size: 2.4rem;
}

.card-body {
    font-size: 2rem;
}

.info {
    min-height: 737px;
    background: #093772;
}
</style>

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

	<%
		List<String> status = (ArrayList<String>)request.getAttribute("status");
	%>
	<div class="row">
		<div class="col-sm-3 col-md-3 info">
                <div class="position-sticky">
                    <img src="<c:url value='/images/icon.gif'/>" style="margin:20px 65px; width: 80%;" /> 
                </div>
                <div style="color:white;text-align:center;"><h2>Welcome, ${userName.firstname }&nbsp;${userName.lastname }</h2>
                <h4>ID: ${userName.id }</h4>
                <h4> Applicant</h4><br>
                <h4>${userName.state },${userName.city}</h4>
                <h5>${userName.contact }</h5>
                <h5>${userName.email }</h5>
                </div>
            </div>
		<div class="col-sm-9 col-md-9">
			<div class="row">
				<div class="jumbotron" style="background: -webkit-linear-gradient(left, #0066cc, #000066);color:silver;">
					<div class="row">
						<div class="col-sm-3 col-md-3" style="text-align: center;">
							
						</div>
						<div class="col-sm-3 col-md-3" style="text-align: center;">
							<%if(status.contains("photo") && status.contains("aadhar") && status.contains("marksheet")) { %>
								<form action="Form.jsp">
									<button type="submit" class="btn btn-warning" style="font-size: 14px; border-radius: 10px; color: black; width: 80%;"><b>Download Form</b></button>
								</form>
							<%} %>
						</div>
						<div class="col-sm-3 col-md-3" style="text-align: right;">
							
							<div class="dropdown">
							  <button class="btn btn-info dropdown-toggle" style="font-size: 14px; border-radius: 10px; color: black; width: 70%;" type="button" data-toggle="dropdown"><b>Edit Profile&nbsp;</b><span class="caret"></span></button>
							  <ul class="dropdown-menu">
							    <li>
									<form action="UpdateStudent.jsp" method="post">
										<input type="hidden" name="update" value="details">
										<button class="btn" style="background-color: white; color: black; text-align: center; border: none; width: 100%;">Update Details</button>
									</form>
								</li>
							    <li class="divider"></li>
							    <li>
							    	<form action="UpdateStudent.jsp" method="post">
							    		<input type="hidden" name="update" value="password">
										<button class="btn" style="background-color: white; color: black; text-align: center; border: none; width: 100%;">Update Password</button>
									</form>
							    </li>
							  </ul>
							</div>
							
						</div>
						<div class="col-sm-3 col-md-3" style="text-align: center;">
							<form action="Logout.jsp">
								<button type="submit" class="btn btn-danger" style="font-size: 14px; border-radius: 10px; color: black; width: 70%;"><span class="glyphicon glyphicon-log-out"></span>&nbsp;<b>Logout</b></button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-1 col-md-1"></div>
				<div class="col-sm-10 col-md-10">
					
					<div class="panel panel-default">
					    <div style="text-align: center;" class="panel-heading"><h4>Please complete these tasks</h4></div>
					    <div class="panel-body">
					    	
					    	<%if(status.contains("photo")) { %>
					    		<button type="button" class="btn btn-success" data-toggle="collapse" data-target="#photo"><span class="glyphicon glyphicon-ok"></span> Re-Upload your photo</button>
					    	<%} %>
					    	<%if(!status.contains("photo")) { %>
					    		<button type="button" class="btn btn-warning" data-toggle="collapse" data-target="#photo"><span class="glyphicon glyphicon-alert"></span> Upload your photo</button>
					    	<%} %>
					    	<div class="collapse" id="photo">
					    		<div class="panel panel-default">
									<div class="panel-body">
										<form action="/CollegeAdmissionManagementSystem/StudentHome?flag=photo&sid=${userName.id }" method="post">
											Upload your photo : <input type="file" required><br>
											<button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-upload"></span> Upload</button>
										</form>
									</div>
								</div>
					    	</div>
					    	
					    	<br><br>
					    	<%if(status.contains("aadhar")) { %>
					    		<button type="button" class="btn btn-success" data-toggle="collapse" data-target="#aadhar"><span class="glyphicon glyphicon-ok"></span> Re-Upload your Aadhar Card</button>
					    	<%} %>
					    	<%if(!status.contains("aadhar")) { %>
					    		<button type="button" class="btn btn-warning" data-toggle="collapse" data-target="#aadhar"><span class="glyphicon glyphicon-alert"></span> Upload your Aadhar Card</button>
					    	<%} %>
					    	<div class="collapse" id="aadhar">
					    		<div class="panel panel-default">
									<div class="panel-body">
										<form action="/CollegeAdmissionManagementSystem/StudentHome?flag=aadhar&sid=${userName.id }" method="post">
											Upload scanned copy of your aadhar card : <input type="file" required><br>
											<button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-upload"></span> Upload</button>
										</form>
									</div>
								</div>
					    	</div>
					    	
					    	<br><br>
					    	<%if(status.contains("marksheet")) { %>
					    		<button type="button" class="btn btn-success" data-toggle="collapse" data-target="#marksheet"><span class="glyphicon glyphicon-ok"></span> Re-Upload your Marksheets</button>
					    	<%} %>
					    	<%if(!status.contains("marksheet")) { %>
					    		<button type="button" class="btn btn-warning" data-toggle="collapse" data-target="#marksheet"><span class="glyphicon glyphicon-alert"></span> Upload your Marksheets</button>
					    	<%} %>
					    	<div class="collapse" id="marksheet">
					    		<div class="panel panel-default">
									<div class="panel-body">
										<form action="/CollegeAdmissionManagementSystem/StudentHome?flag=marksheet&sid=${userName.id }" method="post">
											Upload scanned copy of your 10 marksheet : <input type="file" required><br>
											Upload scanned copy of your 10+2 marksheet : <input type="file" required><br>
											<button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-upload"></span> Upload</button>
										</form>
									</div>
								</div>
					    	</div>
					    	
					    	
						</div>
					</div>
					
				</div>
				<div class="col-sm-1 col-md-1"></div>
			</div>
		</div>
	</div>
</body>
</html>