<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>Home Page</title>
<style>

th + th, td + td {
	border-left: 1px solid #ddd;
}

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

table {
	display: block;
	max-height: 500px;
	overflow-y: auto;
}
</style>

<script language="javascript">
	window.history.forward(1);
	browser.cache.offline.enable = false;
	function noBack() {
		browser.cache.offline.enable = false;
		window.history.forward(1);
		
	}
	
	function test(m) {
		var em = document.getElementById("em");
		em.value = m;
		return true;
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
	
	<div class="row">
		<div class="col-sm-3 col-md-3 info">
                <div class="position-sticky">
                    <img src="<c:url value='/images/icon.gif'/>" style="margin:20px 65px; width: 80%;" /> 
                </div>
                <div style="color:white;text-align:center;"><h2>Welcome, ${userName.name }</h2>
                <h3 >${userName.designation}</h3><br>
                <h4>${userName.address }</h4>
                <h5>${userName.contact }</h5>
                <h5>${userName.email }</h5>
                </div>
            </div>
		<div class="col-sm-9 col-md-9">
			<div class="row">
				<div class="jumbotron" style="background: -webkit-linear-gradient(left, #0066cc, #000066);color:silver;">
					<div class="row">
						<div class="col-sm-3 col-md-3" style="text-align: center;"></div>
						<div class="col-sm-3 col-md-3" style="text-align: center;">
								<button type="submit" class="btn btn-success" data-toggle="modal" data-target="#mail" style="font-size: 14px; border-radius: 10px; color: black; width: 80%;"><b>Send Mail</b></button>
						</div>
						
						
						<div id="mail" class="modal fade" role="dialog">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-body">
						        <form action="/CollegeAdmissionManagementSystem/AdminHome?flag=mail" method="post">
						        	<div class="form-content">
						        		<div class="form-group">
											<input id="em" type="email" name="receive" class="form-control" style="" placeholder="Receipants seperated by comma or space(Leave blank for all confirmed candidates)">
										</div>
										<div class="form-group">
											<input type="text" name="subject" class="form-control" style="" placeholder="Subject">
										</div>
										<div class="form-group">
											<textarea name="message" class="form-control" rows="4" cols="50" style="" placeholder="Message Body" required></textarea>
										</div>
										<hr>
										<div class="form-group">
											<div class="row">
												<div style="text-align: center;" class="col-md-4 col-xs-6">
													<button type="reset" style="width: 50%;" class="btn btn-info">Reset</button>
												</div>
												<div style="text-align: center;" class="col-md-4 col-xs-6">
													<button type="submit" style="width: 50%;" class="btn btn-success">Send</button>
												</div>
												<div style="text-align: center;" class="col-md-4 col-xs-6">
													<button type="button" style="width: 50%;" class="btn btn-danger" data-dismiss="modal">Cancel</button>
												</div>
											</div>
										</div>
						        	</div>
						        </form>
						      </div>
						    </div>
						  </div>
						</div>
						
						
						
						<div class="col-sm-3 col-md-3" style="text-align: right;">
						
							<div class="dropdown">
							  <button class="btn btn-info dropdown-toggle" style="font-size: 14px; border-radius: 10px; color: black; width: 70%;" type="button" data-toggle="dropdown"><b>Edit Profile&nbsp;</b><span class="caret"></span></button>
							  <ul class="dropdown-menu">
							    <li>
									<form action="UpdateAdmin.jsp" method="post">
										<input type="hidden" name="update" value="details">
										<button class="btn" style="background-color: white; color: black; text-align: center; border: none; width: 100%;">Update Details</button>
									</form>
								</li>
							    <li class="divider"></li>
							    <li>
							    	<form action="UpdateAdmin.jsp" method="post">
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
			
			<c:if test="${index eq 1 }">
				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				  <li style="width: 49%; background-color: #f9f9f3;" class="nav-item active">
				    <a style="min-height: 50px; text-align: center; color: black" class="nav-link" id="pills-one-tab" data-toggle="pill" href="#pills-one" role="tab" aria-controls="pills-one" aria-selected="true">Confirmed Candidate Registrations</a>
				  </li>
				  <li style="width: 49%; background-color: #f9f9f3;" class="nav-item">
				    <a style="min-height: 50px; text-align: center; color: black" class="nav-link" id="pills-two-tab" data-toggle="pill" href="#pills-two" role="tab" aria-controls="pills-two" aria-selected="false">Pending Candidate Registrations</a>
				  </li>
				</ul>
			</c:if>
			
			<c:if test="${index eq 2 }">
				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				  <li style="width: 49%; background-color: #f9f9f3;" class="nav-item">
				    <a style="min-height: 50px; text-align: center; color: black" class="nav-link" id="pills-one-tab" data-toggle="pill" href="#pills-one" role="tab" aria-controls="pills-one" aria-selected="true">Confirmed Candidate Registrations</a>
				  </li>
				  <li style="width: 49%; background-color: #f9f9f3;" class="nav-item active">
				    <a style="min-height: 50px; text-align: center; color: black" class="nav-link" id="pills-two-tab" data-toggle="pill" href="#pills-two" role="tab" aria-controls="pills-two" aria-selected="false">Pending Candidate Registrations</a>
				  </li>
				</ul>
			</c:if>
			
			
			
			
			<div class="tab-content" id="pills-tabContent">
			  <c:if test="${index eq 1 }">
			  
			  <div class="tab-pane fade active in" id="pills-one" role="tabpanel" aria-labelledby="pills-one-tab">

					<div class="row">
						<div class="col-sm-12 col-md-12"><br>
							<input type="text" class="form-control" style="width: 80%;" placeholder="Search" id="myInput1" ><br>
							<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>Student ID</th>
										<th>Name</th>
										<th>Contact</th>
										<th>10th Percentage</th>
										<th>10th Board</th>
										<th>12th Percentage</th>
										<th>12th Board</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="myTable1">
									
									<c:forEach var="stu" items="${requestScope.list}">
										<tr>
											<td>${stu.id}</td>
											<td>${stu.firstname}&nbsp;${stu.lastname }</td>
											<td>${stu.contact }</td>
											<td>${stu.per10 }</td>
											<td>${stu.board10 }</td>
											<td>${stu.per12 }</td>
											<td>${stu.board12 }</td>
											<td>
												<div class="row">
													<div class="col-sm-6 col-md-6">
														<form action="/CollegeAdmissionManagementSystem/AdminHome?flag=viewConfirm&sid=${stu.id}" method="post">
															<button type="submit" class="btn" style="font-size: 11px; background-color: #d0d015; border-radius: 22px; color: white; width: 110%;">View</button>
														</form>
													</div>
													<div class="col-sm-6 col-md-6">
														<button onclick="return test('${stu.email}')" data-toggle="modal" data-target="#mail" type="submit" class="btn" style="font-size: 11px; background-color: #ffad33; border-radius: 22px; color: white; width: 110%;">Mail</button>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
						</div>
						<div class="col-sm-1 col-md-1"></div>
					</div>

				</div>
			  
			  <div class="tab-pane fade" id="pills-two" role="tabpanel" aria-labelledby="pills-two-tab">
					<div class="row">
						<div class="col-sm-12 col-md-12"><br>
							<input type="text" class="form-control" style="width: 80%;" placeholder="Search" id="myInput2" ><br>
							<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>Student ID</th>
										<th>Name</th>
										<th>Contact</th>
										<th>10th Percentage</th>
										<th>10th Board</th>
										<th>12th Percentage</th>
										<th>12th Board</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="myTable2">
									
									<c:forEach var="pstu" items="${requestScope.pendingList}">
										<tr>
											<td>${pstu.id}</td>
											<td>${pstu.firstname}&nbsp;${pstu.lastname }</td>
											<td>${pstu.contact }</td>
											<td>${pstu.per10 }</td>
											<td>${pstu.board10 }</td>
											<td>${pstu.per12 }</td>
											<td>${pstu.board12 }</td>
											<td>
												<div class="row">
													<div class="col-sm-4 col-md-4">
														<form action="/CollegeAdmissionManagementSystem/AdminHome?flag=confirm&sid=${pstu.id}" method="post">
															<button type="submit" class="btn" style="font-size: 11px; background-color:green;border-radius: 22px;color:white; width: 135%;">Accept</button>
														</form>
													</div>
													<div class="col-sm-4 col-md-4">
														<form action="/CollegeAdmissionManagementSystem/AdminHome?flag=reject&sid=${pstu.id}" method="post">
															<button type="submit" class="btn" style="font-size: 11px; background-color:red;border-radius: 22px;color:white; width: 135%;">Reject</button>
														</form>
													</div>
													<div class="col-sm-4 col-md-4">
														<form action="/CollegeAdmissionManagementSystem/AdminHome?flag=viewPending&sid=${pstu.id}" method="post">
															<button type="submit" class="btn" style="font-size: 11px; background-color: #d0d015; border-radius: 22px; color: white; width: 135%;">View</button>
														</form>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				
				
				
				
				<c:if test="${index eq 2 }">
			  
			  <div class="tab-pane fade" id="pills-one" role="tabpanel" aria-labelledby="pills-one-tab">

					<div class="row">
						<div class="col-sm-12 col-md-12"><br>
							<input type="text" class="form-control" style="width: 80%;" placeholder="Search" id="myInput1" ><br>
							<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>Student ID</th>
										<th>Name</th>
										<th>Contact</th>
										<th>10th Percentage</th>
										<th>10th Board</th>
										<th>12th Percentage</th>
										<th>12th Board</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="myTable1">
									
									<c:forEach var="stu" items="${requestScope.list}">
										<tr>
											<td>${stu.id}</td>
											<td>${stu.firstname}&nbsp;${stu.lastname }</td>
											<td>${stu.contact }</td>
											<td>${stu.per10 }</td>
											<td>${stu.board10 }</td>
											<td>${stu.per12 }</td>
											<td>${stu.board12 }</td>
											<td>
												<div class="row">
													<div class="col-sm-6 col-md-6">
														<form action="/CollegeAdmissionManagementSystem/AdminHome?flag=viewConfirm&sid=${stu.id}" method="post">
															<button type="submit" class="btn" style="font-size: 11px; background-color: #d0d015; border-radius: 22px; color: white; width: 100%;">View</button>
														</form>
													</div>
													<div class="col-sm-6 col-md-6">
														<button onclick="return test('${stu.email}')" data-toggle="modal" data-target="#mail" type="submit" class="btn" style="font-size: 11px; background-color: #ffad33; border-radius: 22px; color: white; width: 110%;">Mail</button>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
						</div>
						<div class="col-sm-1 col-md-1"></div>
					</div>

				</div>
			  
			  <div class="tab-pane fade active in" id="pills-two" role="tabpanel" aria-labelledby="pills-two-tab">
					<div class="row">
						<div class="col-sm-12 col-md-12"><br>
							<input type="text" class="form-control" style="width: 80%;" placeholder="Search" id="myInput2" ><br>
							<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>Student ID</th>
										<th>Name</th>
										<th>Contact</th>
										<th>10th Percentage</th>
										<th>10th Board</th>
										<th>12th Percentage</th>
										<th>12th Board</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="myTable2">
									
									<c:forEach var="pstu" items="${requestScope.pendingList}">
										<tr>
											<td>${pstu.id}</td>
											<td>${pstu.firstname}&nbsp;${pstu.lastname }</td>
											<td>${pstu.contact }</td>
											<td>${pstu.per10 }</td>
											<td>${pstu.board10 }</td>
											<td>${pstu.per12 }</td>
											<td>${pstu.board12 }</td>
											<td>
												<div class="row">
													<div class="col-sm-4 col-md-4">
														<form action="/CollegeAdmissionManagementSystem/AdminHome?flag=confirm&sid=${pstu.id}" method="post">
															<button type="submit" class="btn" style="font-size: 11px; background-color:green;border-radius: 22px;color:white; width: 135%;">Accept</button>
														</form>
													</div>
													<div class="col-sm-4 col-md-4">
														<form action="/CollegeAdmissionManagementSystem/AdminHome?flag=reject&sid=${pstu.id}" method="post">
															<button type="submit" class="btn" style="font-size: 11px; background-color:red;border-radius: 22px;color:white; width: 135%;">Reject</button>
														</form>
													</div>
													<div class="col-sm-4 col-md-4">
														<form action="/CollegeAdmissionManagementSystem/AdminHome?flag=viewPending&sid=${pstu.id}" method="post">
															<button type="submit" class="btn" style="font-size: 11px; background-color: #d0d015; border-radius: 22px; color: white; width: 135%;">View</button>
														</form>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
				</c:if>
			</div>
			
		</div>
	</div>
	
	
	<script>
	$(document).ready(function(){
	  $("#myInput1").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myTable1 tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
	
	$(document).ready(function(){
	  $("#myInput2").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myTable2 tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
	</script>
	
</body>
</html>