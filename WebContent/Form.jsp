<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="com.pack.beans.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<meta charset="ISO-8859-1">
<title>Registration Form</title>
<script>
	window.history.forward(1);
	browser.cache.offline.enable = false;
	function noBack() {
		browser.cache.offline.enable = false;
		window.history.forward(1);
		
	}
</script>


<!-- <script>
function genScreenshot() {
    html2canvas(document.body, {
      onrendered: function(canvas) {
      $('#content').html("");
			$('#content').append(canvas);
      
      if (navigator.userAgent.indexOf("MSIE ") > 0 || 
					navigator.userAgent.match(/Trident.*rv\:11\./)) 
			{
      	var blob = canvas.msToBlob();

        window.navigator.msSaveBlob(blob,'Test file.png');
        
      }
      else   {
        
        $('#test').attr('href', canvas.toDataURL("image/png"));
        doc = new jsPDF({
                     unit: 'px',
                     format: 'a4'
                 });
                doc.addImage(canvas.toDataURL("image/png"), 'JPEG', 0, 0);
                doc.save('ExportFile.pdf');
                form.width(cache_width);
        //$('#test').attr('download','Test file.png');
        $('#test')[0].click();
         }
      
      
      }
    });
}
</script> -->
<script>
	var doc = new jsPDF('p', 'pt', 'a4');
	var specialElementHandlers = {
	    '#editor': function (element, renderer) {
	        return true;
	    }
	};
</script>

<style type="text/css">
html2canvas {
     width: 10px;
     height: 200px;
}

td {
	padding-left: 7px;
	padding-right: 7px;
}

.div + .div {
	border-left: 1px solid #ddd;
}

#academics th {
	width: 50%;
}

#academics td {
	width: 50%;
}

#academics tr {
	border-bottom: 1px solid #ddd;
}
</style>

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
	
	Student st = (Student)session.getAttribute("userName");
	
	Map<String, String> branch = new HashMap<>();
	branch.put("cse", "Computer Science and Engineering");
	branch.put("ece", "Electronics and Communication Engineering");
	branch.put("it", "Information Technology");
	branch.put("ee", "Electrical Engineering");
	branch.put("me", "Mechanical Engineering");
	%>
	
	<div class="container">
	<h6>Please download(FROM PC OR LAPTOP) and bring the form given below on the day of College Admission</h6><br>
	<h6>*** IMPORTANT *** If the downloaded form is not formatted properly then just print the page, save the page as pdf an print</h6>
	<div class="container-fluid" id="content" style="border: 1px solid black;">
		
		<div class="container-fluid" style="text-align: center;">
			<h4 style="color: blue;">Future Institute Of Engineering And Management</h4>
			<h6>Sonarpur, West Bengal</h6>
		</div>
		
		<hr>
		<br>
		<div class="row">
			<div class="col-md-10 div">
				<table>
					<tr>
						<td><b>Name</b></td>
						<td>${userName.firstname }&nbsp;${userName.lastname }</td>
					</tr>
					<tr>
						<td><b>ID</b></td>
						<td>${userName.id }</td>
					</tr>
					<tr>
						<td><b>Stream selected</b></td>
						<td><%=branch.get(st.getBranch_name()) %></td>
					</tr>
					<tr>
						<td><b>Course</b></td>
						<td>Bachelor&nbsp;Of&nbsp;Technology</td>
					</tr>
				</table>
			</div>
			<div class="col-md-2 div">
				<div class="container" style="border: 1px solid black; text-align: center; height: 100%; width: 75%;">
					<p style="font-size: 12px;">Please attach a passport sized photo</p>
				</div>
			</div>
		</div>
		<br>
		<hr>
		<br>
		<table id="academics">
			<tr>
				<th></th>
				<th>Marks %</th>
				<th>Board</th>
			</tr>
			<tr>
				<th>10th</th>
				<td>${userName.per10 }</td>
				<td>${userName.board10 }</td>
			</tr>
			<tr>
				<th>12th</th>
				<td>${userName.per12 }</td>
				<td>${userName.board12 }</td>
			</tr>
		</table>
		<br><br>
		___________________________<br>(Signature of candidate)<br><br><br>
		<div class="container-fluid" style="text-align: center;">
			<h5 style="text-decoration: underline;">Documents to bring on the day of Admission</h5>	
		</div>
		<ol>
			<li>This form</li>
			<li>Government ID Original and 2 photocopies(Aadhar card, PAN Card or Voter ID card)</li>
			<li>Birth proof original and 2 photocopies</li>
			<li>Address Proof and 2 photocopies</li>
			<li>10th and 12th marksheet original and 2 photocopies</li>
		</ol>
	</div>
	<div id="editor"></div>
	<br>
	<div class="row">
		<button id="cmd" class="btn btn-success"><i class="fas fa-download"></i>&nbsp;&nbsp;Download form</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<form method="post" action="/CollegeAdmissionManagementSystem/StudentHome">
			<input type="hidden" name="flag" value="studentHome">
			<button class="btn btn-warning">Go Back</button>
		</form>
	</div>
	
	</div>
	<a id="test"></a>
	<br>
	
	
	<script>
	$('#cmd').click(function () {
	    doc.fromHTML($('#content').html(), 15, 15, {
	        'width': 170,
	            'elementHandlers': specialElementHandlers
	    });
	    doc.save('FIEMAdmissionform.pdf');
	});
	</script>
</body>
</html>