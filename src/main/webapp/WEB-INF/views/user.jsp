<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.rnt.ai.dto.UserRegisterDto"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.nav {
	background-color: #e3f2fd;
	width:200px;
}
#NavBarValue{
border: 1px solid #ac4c4c;
    width: 200px;
    background-color: white;
    border-radius: 50px;
    text-align: center;
    color: black;

}
#NavBar{
border: 1px solid #ac4c4c;
    width: 200px;
    background-color: black;
    border-radius: 50px;
    text-align: center;
    color: white;

}

.container {
      display: grid;
      grid-template-columns: repeat(11, 1fr);
      gap: 10px;
    }

    .profile-box {
    	width:200px;
    	height:200px;
      grid-column: 1 / span 3;
      background-color: lightgray;
      padding: 10px;
    }

    .column {
    	width:300px;
    	height:50px;
      background-color: lightblue;
      padding: 10px;
    }
    #box1{
    	margin-top: 16%;
    	margin-left: 6%;
	    height: 200px;
	    width: auto;
    }
    #box2{
    	margin-top: 25%;
	    margin-left: -99%;
	    height: 200px;
	    width: auto;
    }
    #box3 {
    	margin-top: 35%;
	    margin-left: -201%;
	    height: 200px;
	    width: auto;
    }
    #box4 {
    	margin-top: 45%;
	    margin-left: -303%;
	    height: 200px;
	    width: auto;
    }
    #AllBox{}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
	integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<meta charset="ISO-8859-1">
<title>EMS Dashboard User</title>
</head>
<body>
<%
	String usertype = (String) request.getAttribute("usertype");
	UserRegisterDto user = (UserRegisterDto) request.getAttribute("user");
	%>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0"
				style="position: relative; background-color:#AFD3E2; top: 73px;">
				<div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
					<tr>
						<a id="NavBar" title="Add Value using below links" class="nav-link px-0 align-middle">Menu</a><br>
						<a id="NavBarValue"  class="nav-link px-0 align-middle" data-bs-toggle="modal" data-bs-target="#RegionModel">Fill Details</a><br>
						<a id="NavBarValue" class="nav-link px-0 align-middle" data-bs-toggle="modal" data-bs-target="#CountryModel" onclick="CountryData()">Edit</a><br>
						<a id="NavBarValue" class="nav-link px-0 align-middle" data-bs-toggle="modal" data-bs-target="#UploadImageModel">Update Profile</a><br>
						<a href="logout" id="NavBarValue" class="nav-link px-0 align-middle">Logout</a><br>
					</tr>
						
					<hr>
					<!-- <div class="dropdown pb-4">
						<a href="#"
							class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <img src="https://github.com/mdo.png"
							alt="hugenerd" width="30" height="30" class="rounded-circle">
							<span class="d-none d-sm-inline mx-1">loser</span>
						</a>
						<ul class="dropdown-menu dropdown-menu-dark text-small shadow">
							<li><a class="dropdown-item" href="#">Profile</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="logout">Sign out</a></li>
						</ul>
					</div> -->
				</div>
			</div>
			<div class="col">
				<nav class="navbar navbar-expand-lg navbar-light"
					style="margin-left: -269px; height: 73px; background:#AFD3E2; display: flex; justify-content: center;">
					<a class="navbar-brand" style="color: white;" href="#"><b><h2>EMPLOYEE
								MANAGEMENT SYSTEM</h2></b></a> <span
						style="position: relative; color: white; left: 400px; top: 0px;">Role : <%=usertype%></span>
					<span
						style="position: relative; color: white; left: 330px; top: 20px;"><%=user.getEmail()%></span>
				</nav>
				
				<div class="container mt-5">
					<div class="control-form"><h2>Employee Details</h2><br></div>
					<div class="container">
					    <div class="profile-box">
					      <!-- Profile picture here -->
					      <img src="data:image/*;base64,${profile.base64Image}" alt="Profile Picture" style="width: 100%; height: 100%;">
					    </div>
					    <c:forEach items="${emp}" var="emp">
					    <div class="container" id = "AllBox">
						    <div class="container" id="box1" >
							    <div class="column">First Name : ${emp.firstName}</div>
							    <div class="column">First Name : ${emp.lastName}</div>
							 </div><br>
							 <div class="container" id="box2">
							    <div class="column">Email : ${emp.email}</div>
							    <div class="column">Employee Id : ${emp.employeeId}</div>
							    <div class="column">User Id : ${emp.userId}</div>
							  </div><br>
							    <div class="container" id="box3">
							    <div class="column">Contact No : ${emp.phoneNumber}</div>
							    <div class="column">Joining Date : ${emp.hireDate}</div>
							    <div class="column">Salary : ${emp.salary}</div>
							   </div><br>
							   <div class="container" id="box4">
							    <div class="column">Job Id : ${emp.jobId}</div>
							    <div class="column">Manager Id : ${emp.managerId}</div>
							    <div class="column">Department Id : ${emp.departmentId}</div>
							    </div>
					    </div>
					    </c:forEach>
					  </div>
				</div>
			</div>

	</div>
			</div>
			
<script>
	$(document).ready(function(){
		alert("Hi");
		var feature = ${feature};
		$(".saveText").text(feature);
		$("#saveModal").show();
	});
	/* $(document).ready(function(){debugger;
		var status = "[[${status}]]";
		var feature = "${feature}";
		alert(feature);
		$('#saveModal').show();
		$('.saveText').text(feature+" "+status);
		
	}); */
</script>			
			<!--Image Upload Modal -->
	<div class="modal fade" id="UploadImageModel" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Upload Profile Picture</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="frm" method="post" action="uploadImage" enctype="multipart/form-data">
					<div class="modal-body">
						<label>Profile</label>
						 <input type="file" name="image" accept="image/*">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!-- ----------------------------- Save Model --------------------------- -->
<div class="modal saveModal" tabindex="-1" id="saveModal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left:0px!important;">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="saveAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="saveText"> Saved Successfully</span>

                        <button type="button" class="btn saveOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
 <!-- ----------------------------- Save Model End --------------------------- -->
</body>
</html>