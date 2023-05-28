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
</style>
<meta charset="ISO-8859-1">
<title>EMS Dashboard</title>
<!-- Fontawesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<%
	String usertype = (String) request.getAttribute("usertype");
	UserRegisterDto user = (UserRegisterDto) request.getAttribute("user");
	HashMap<String, Integer> map = (HashMap<String, Integer>) request.getAttribute("count");
	%>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0"
				style="position: relative; background-color:#AFD3E2; top: 73px;">
				<div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
					<tr>
						<a id="NavBar" title="Add Value using below links" class="nav-link px-0 align-middle">Menu</a><br>
						<a id="NavBarValue"  class="nav-link px-0 align-middle" data-bs-toggle="modal" data-bs-target="#RegionModel">Region</a><br>
						<a id="NavBarValue" class="nav-link px-0 align-middle" data-bs-toggle="modal" data-bs-target="#CountryModel" onclick="CountryData()">Country</a><br>
						<a id="NavBarValue" class="nav-link px-0 align-middle" data-bs-toggle="modal" data-bs-target="#LocationModel" onclick="locationData()">Location</a><br>
						<a id="NavBarValue" class="nav-link px-0 align-middle" data-bs-toggle="modal" data-bs-target="#JobModel">Job</a><br>
						<a id="NavBarValue" class="nav-link px-0 align-middle" data-bs-toggle="modal" data-bs-target="#DepartmentModel" onclick="deptData()">Department</a><br>
						<a id="NavBarValue" class="nav-link px-0 align-middle" data-bs-toggle="modal" data-bs-target="#employeeModel" onclick="getSelectedList()">Employee</a><br>
						<a href="logout" id="NavBarValue" class="nav-link px-0 align-middle">Logout</a><br>
					</tr>
						
					<hr>
					<div class="dropdown pb-4">
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
					</div>
				</div>
			</div>
			<div class="col">
				<nav class="navbar navbar-expand-lg navbar-light"
					style="margin-left: -269px; height: 73px; background:#AFD3E2; display: flex; justify-content: center;">
					<a class="navbar-brand" style="color: white;" href="#"><b><h2>EMPLOYEE
								MANAGEMENT SYSTEM</h2></b></a> <span
						style="position: relative; color: white; left: 480px; top: 0px;"><%=usertype%></span>
					<span
						style="position: relative; color: white; left: 410px; top: 20px;"><%=user.getEmail()%></span>
				</nav>


				<div class="container mt-5">
					<div class="row" style="margin-left: 200px;">
						<div class="col-12 col-sm-2 mt-2 cards"  id="adminBtn" 
							style="border: 1px solid black; background-color:#19A7CE; height: 150px; margin: 4px;">
							<div class="card card-block" style="background-color:#19A7CE;">
								<br> <br> <i class="fa-solid fa-user fa-2xl"
									style="color: #1f4b51;"></i><br>
								<p class="CardName">Admins</p>
								<p class="CardCount">
									Counts :
									<%=map.get("adminCount")%></p>
							</div>
						</div>
						<div class="col-12 col-sm-2 mt-2 cards" id="userBtn"
							style="border: 1px solid black; background-color:#FF55BB; height: 150px; margin: 4px;">
							<div class="card card-block" style="background-color:#FF55BB;">
								<br> <br> <i class="fa-solid fa-user fa-2xl"
									style="color: #1f4b51;"></i><br>
								<p class="CardName">User</p>
								<p class="CardCount">
									Counts :
									<%=map.get("userCount")%></p>
							</div>
						</div>
						<div class="col-12 col-sm-2 mt-2 cards" id="employeeBtn"
							style="border: 1px solid black; background-color:#7A3E65; height: 150px; margin: 4px;">
							<div class="card card-block" style="background-color:#7A3E65;">
								<p class="CardName">Employees</p>
								<p class="CardCount">
									Counts :
									<%=map.get("empCount")%>
						</p>
					</div>
				</div>
				<div class="col-12 col-sm-2 mt-2 cards" id="deptBtn"
					style="border: 1px solid black; background-color:#00FFCA; height: 150px; margin: 4px;">
					<div class="card card-block" style="background-color:#00FFCA;">
						<br> <br> <i class="fa-duotone fa-buildings fa-2xl"></i>
						<p class="CardName">Department</p>
						<p class="CardCount">
							Counts :
							<%=map.get("deptCount")%></p>
					</div>
				</div>
			</div>

		</div>
		<br>

		<div class="container">
			<div class="row" style="margin-left: 200px;">
				<div class="col-sm-2 mr-3" id="jobBtn"
					style="border: 1px solid black; background-color:#9BA4B5; height: 150px; margin: 4px;">
					<div class="card card-block" style="background-color:#9BA4B5;">
						<i class="fa-light fa-laptop-file"></i>
						<p class="CardName">Jobs</p>
						<p class="CardCount">
							Counts :
							<%=map.get("jobCount")%></p>
					</div>
				</div>
				<div class="col-sm-2" id="countryBtn"
					style="border: 1px solid black; background-color:#62CDFF; height: 150px; margin: 4px;">
					<div class="card card-block" style="background-color:#62CDFF;">
						<p class="CardName">Country</p>
						<p class="CardCount">
							Counts :
							<%=map.get("countryCount")%></p>
					</div>
				</div>
				<div class="col-sm-2" id="locationBtn"
					style="border: 1px solid black; background-color:#E5BA73; height: 150px; margin: 4px;">
					<div class="card card-block" style="background-color:#E5BA73;">
						<p class="CardName">Location</p>
						<p class="CardCount">
							Counts :
							<%=map.get("locCount")%></p>
					</div>
				</div>
				<div class="col-sm-2" id="regionBtn"
					style="border: 1px solid black; background-color:#2E4F4F; height: 150px; margin: 4px;">
					<div class="card card-block" style="background-color:#2E4F4F;">
						<p class="CardName">Regions</p>
						<p class="CardCount">
							Counts :
							<%=map.get("regionCount")%></p>
					</div>
				</div>
			</div>

		</div>
		<div class="container" id="MainTable" style="margin-top: 50px;">
			<table id="myTableBody" class="table table-sm-3 table-dark">
				<thead>
					<tr>
						<th>Employee Id</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone Number</th>
						<th>hire_date</th>
						<th>job_id</th>
						<th>salary</th>
						<th>Action</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${emp}" var="emp">
						<%-- <c:out value="${emp}"/> --%>
						<tr class="table-light">
							<td>${emp.employeeId}<br></td>
							<td>${emp.firstName}  ${emp.lastName}</td>
							<td>${emp.email}</td>
							<td>${emp.phoneNumber}</td>
							<td>${emp.hireDate}</td>
							<td>${emp.jobId}</td>
							<td>${emp.salary}</td>
							<td>
									<a class="btn btn-success" onclick="editEmployee(${emp.employeeId})"> Edit</a>
									<a class="btn btn-danger" href="deleteEmployee?employeeId=${emp.employeeId}"> Delete</a>
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="container" id="MainTable2" style="margin-top: 50px;">
				<table id="AdminTable" class="table table-sm table-dark">
					<thead>
						<tr>
							<th>User Id</th>
							<th>Name</th>
							<th>Email</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody class="table table-sm table-light">
	
					</tbody>
					
				</table>
				</div>
				<div class="container" id="MainTable3" style="margin-top: 50px;">
					<table id="DeptTable" class="table table-sm table-dark">
						<thead>
							<tr>
								<th>Department Id</th>
								<th>Department Name</th>
								<th>location Id</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody class="table table-sm table-light">
							
						</tbody>
					</table>
		</div>
		
		<div class="container" id="MainTable4" style="margin-top: 50px;">
					<table id="JobsTable" class="table table-sm table-dark">
						<thead>
							<tr>
								<th>Job Id</th>
								<th>Job Name</th>
								<th>Min Salary</th>
								<th>Max Salary</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody class="table table-sm table-light">
							
						</tbody>
					</table>
		</div>
		<div class="container" id="MainTable5" style="margin-top: 50px;">
					<table id="countryTable" class="table table-sm table-dark">
						<thead>
							<tr>
								<th>Country Id</th>
								<th>Country Name</th>
								<th>Region Id</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody class="table table-sm table-light">
							
						</tbody>
					</table>
		</div>
		<div class="container" id="MainTable6" style="margin-top: 50px;">
					<table id="JobsTable" class="table table-sm table-dark">
						<thead>
							<tr>
								<th>Job Id</th>
								<th>Job Name</th>
								<th>Min Salary</th>
								<th>Max Salary</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody class="table table-sm table-light">
							
						</tbody>
					</table>
					</div>
					<div class="container" id="MainTable7" style="margin-top: 50px;">
						<table id="LocationTable" class="table table-sm table-dark">
							<thead>
								<tr>
									<th>location Id</th>
									<th>streetAddress</th>
									<th>postalCode</th>
									<th>city</th>
									<th>stateProvince</th>
									<th>countryId</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody class="table table-sm table-light">
								
							</tbody>
						</table>
					</div>
					<div class="container" id="MainTable8" style="margin-top: 50px;">
						<table id="regionTable" class="table table-sm table-dark">
							<thead>
								<tr>
									<th>Region Id</th>
									<th>Region Name</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody class="table table-sm table-light">
								
							</tbody>
						</table>
						</div>
					</div>
		

	</div>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
	<jsp:include page="models.jsp"></jsp:include>
	<script type="text/javascript" src="resources/js/ajaxcalls.js"></script>
	<link href="<c:url value="/css/design.css" />" rel="stylesheet">
	
<script>
	
		$(document).ready(function() {
			$('#myTableBody').DataTable();
			
			$('#MainTable').hide();
			$('#MainTable2').hide();
			$('#MainTable3').hide();
			$('#MainTable4').hide();
			$('#MainTable5').hide();
			$('#MainTable6').hide();
			$('#MainTable7').hide();
			$('#MainTable8').hide();
		});
		
		function HideTables(){
			$('#MainTable').hide();
			$('#MainTable2').hide();
			$('#MainTable3').hide();
			$('#MainTable4').hide();
			$('#MainTable5').hide();
			$('#MainTable6').hide();
			$('#MainTable7').hide();
			$('#MainTable8').hide();
		}

	$("#adminBtn").click(function(){
		$.ajax({
		    url: 'getAdmin',
		    method: 'GET',
		    dataType: 'json',
		    success: function(data) {
		    	console.log(data);
		    	  var tableBody = $('#AdminTable').find('tbody');
		    	  tableBody.empty();
		    	  
		    	    $.each(data, function(index, item) {
		    	      var newRow = $('<tr>').append(
		    	        $('<td>').text(item.userid),
		    	        $('<td>').text(item.name),
		    	        $('<td>').text(item.email),
		    	        $('<td>').text(item.userStatus),
		    	      );
	
		    	      tableBody.append(newRow);
		    	    });
		    	    HideTables();
		    		$('#MainTable2').show();
		       
		    },
		    error: function(xhr, status, error) {
		     
		    }
		});
	});

		$("#userBtn").click(function(){
			$.ajax({
			    url: 'getUser',
			    method: 'GET',
			    dataType: 'json',
			    success: function(data) {
			    	console.log(data);
			    	  var tableBody = $('#AdminTable').find('tbody');
						tableBody.empty();
			    	    $.each(data, function(index, item) {
			    	      var newRow = $('<tr>').append(
			    	        $('<td>').text(item.userid),
			    	        $('<td>').text(item.name),
			    	        $('<td>').text(item.email),
			    	        $('<td>').text(item.userStatus),
			    	        $('<td>').html('<a onclick="editUser('+item.userid+')" class="btn btn-success" style="color:black; width:50px;">Edit</a>'+
			    	        		'&nbsp;<a href="deleteUser?userid='+item.userid+'" class="btn btn-danger" style="color:black;" >Delete</a>')
			    	      );
		
			    	      tableBody.append(newRow);
			    	    });
			    	    HideTables();
			    	    $('#AdminTable').DataTable();
			    		$('#MainTable2').show();
			       
			    },
			    error: function(xhr, status, error) {
			     
			    }
			});
		});

	$("#employeeBtn").click(function(){
		HideTables();
		$('#MainTable').show();
	});
	
	$("#deptBtn").click(function(){
		$.ajax({
		    url: 'getDepartments',
		    method: 'GET',
		    dataType: 'json',
		    success: function(data) {
		    	console.log(data);
		    	  var tableBody = $('#DeptTable').find('tbody');
		    	  tableBody.empty();
		    	  
		    	    $.each(data, function(index, item) {
		    	      var newRow = $('<tr>').append(
		    	        $('<td>').text(item.deptId),
		    	        $('<td>').text(item.departmentName),
		    	        $('<td>').text(item.locationId),
		    	        $('<td>').html('<a onclick="editDept('+item.deptId+')" class="btn btn-success" style="color:black; width:50px;">Edit</a>'+
		    	        		'&nbsp;<a href="deleteDept?deptId='+item.deptId+'" class="btn btn-danger" style="color:black;" >Delete</a>')
		    	        	);
		    	      tableBody.append(newRow);
		    	    });
		    		HideTables();
		    		$('#DeptTable').DataTable();
		    		$('#MainTable3').show();
		       
		    },
		    error: function(xhr, status, error) {
		      
		    }
		});
	});
	$("#jobBtn").click(function(){
		$.ajax({
		    url: 'getJob',
		    method: 'GET',
		    dataType: 'json',
		    success: function(data) {
		    	console.log(data);
		    	  var tableBody = $('#JobsTable').find('tbody');
		    	  tableBody.empty();
		    	  
		    	    $.each(data, function(index, item) {
		    	      var newRow = $('<tr>').append(
		    	        $('<td>').text(item.jobId),
		    	        $('<td>').text(item.jobTitle),
		    	        $('<td>').text(item.minSalary),
		    	        $('<td>').text(item.maxSalary),
		    	        $('<td>').html('<a onclick="editJob('+item.jobId+')" class="btn btn-success" style="color:black; width:50px;">Edit</a>'+
		    	        		'&nbsp;<a href="deletejob?jobId='+item.jobId+'" class="btn btn-danger" style="color:black;" >Delete</a>')
		    	        	);
		    	      tableBody.append(newRow);
		    	    });
		    		HideTables();
		    		$('#JobsTable').DataTable();
		    		$('#MainTable4').show();
		       
		    },
		    error: function(xhr, status, error) {
		      
		    }
		});
	});
	
	
	$("#countryBtn").click(function(){
		$.ajax({
		    url: 'getCountries',
		    method: 'GET',
		    dataType: 'json',
		    success: function(data) {
		    	console.log(data);
		    	  var tableBody = $('#countryTable').find('tbody');
		    	  tableBody.empty();
		    	  
		    	    $.each(data, function(index, item) {
		    	      var newRow = $('<tr>').append(
		    	        $('<td>').text(item.countryId),
		    	        $('<td>').text(item.name),
		    	        $('<td>').text(item.regionId),
		    	        $('<td>').html('<a onclick="editCountry('+item.countryId+')" class="btn btn-success" style="color:black; width:50px;">Edit</a>'+
		    	        		'&nbsp;<a href="deleteCountry?countryId='+item.countryId+'" class="btn btn-danger" style="color:black;" >Delete</a>')
		    	        	);
		    	      tableBody.append(newRow);
		    	    });
		    		HideTables();
		    		$('#countryTable').DataTable();
		    		$('#MainTable5').show();
		       
		    },
		    error: function(xhr, status, error) {
		     
		    }
		});
	});
	
	$("#locationBtn").click(function(){
		$.ajax({
		    url: 'getLocations',
		    method: 'GET',
		    dataType: 'json',
		    success: function(data) {
		    	console.log(data);
		    	  var tableBody = $('#LocationTable').find('tbody');
		    	  tableBody.empty();
		    	  
		    	    $.each(data, function(index, item) {
		    	      var newRow = $('<tr>').append(
		    	        $('<td>').text(item.locationId),
		    	        $('<td>').text(item.streetAddress),
		    	        $('<td>').text(item.postalCode),
		    	        $('<td>').text(item.city),
		    	        $('<td>').text(item.stateProvince),
		    	        $('<td>').text(item.countryId),
		    	        $('<td>').html('<a onclick="editLocation('+item.locationId+')" class="btn btn-success" style="color:black; width:50px;">Edit</a>'+
		    	        		'&nbsp;<a href="deleteLocation?locationId='+item.locationId+'" class="btn btn-danger" style="color:black;" >Delete</a>')
		    	        );
		    	      tableBody.append(newRow);
		    	    });
		    		HideTables();
		    		$('#LocationTable').DataTable();
		    		$('#MainTable7').show();
		       
		    },
		    error: function(xhr, status, error) {
		    }
		});
		
	});
	$("#regionBtn").click(function(){
		$.ajax({
		    url: 'getRegion',
		    method: 'GET',
		    dataType: 'json',
		    success: function(data) {
		    	console.log(data);
		    	  var tableBody = $('#regionTable').find('tbody');
		    	  tableBody.empty();
		    	  
		    	    $.each(data, function(index, item) {
		    	      var newRow = $('<tr>').append(
		    	        $('<td>').text(item.regionId),
		    	        $('<td>').text(item.regionName),
		    	        $('<td>').html('<a onclick="editRegion('+item.regionId+')" class="btn btn-success" style="color:black; width:50px;">Edit</a>'+
		    	        		'&nbsp;<a href="deleteRegion?regionId='+item.regionId+'" class="btn btn-danger" style="color:black;" >Delete</a>')
		    	    );
		    	      tableBody.append(newRow);
		    	    });
		    		HideTables();
		    		$('#regionTable').DataTable();
		    		$('#MainTable8').show();
		       
		    },
		    error: function(xhr, status, error) {
		    }
		});
		
	});
	</script>	

	<script >
	function CountryData(){
		$.ajax({
		    url: 'getRegion',
		    method: 'GET',
		    dataType: 'json',
		    success: function(data) {
 				 $.each(data, function(index, item) {
 				 	$('#regionId').append('<option value="' + item.regionId + '">' + item.regionName + '</option>');
 				 });
 			},
 			error: function(err){
 				console.log("error");
 			}
 		});
 	};
	 	
	 	function locationData() {
	 	    $.ajax({
	 	        url: 'getCountries',
	 	        method: 'GET',
	 	        dataType: 'json',
	 	        success: function(data) {
	 	            $.each(data, function(index, item) {
	 	                $('#countryId').append('<option value="' + item.countryId + '">' + item.name + '</option>');
	 	            });
	 	        },
	 	        error: function(err) {
	 	            console.log("error");
	 	        }
	 	    });
	 	}

	 	function deptData() {
	 	    $.ajax({
	 	        url: 'getLocations',
	 	        method: 'GET',
	 	        dataType: 'json',
	 	        success: function(data) {
	 	            $.each(data, function(index, item) {
	 	                var add =  item.streetAddress + ", " + item.city + ", " + item.stateProvince + ", " + item.countryId + ", " + item.postalCode;
	 	                $('#LocationId').append('<option value="' + item.locationId + '">' + add + '</option>');
	 	            });
	 	        },
	 	        error: function(err) {
	 	            console.log("error");
	 	        }
	 	    });
	 	}

	 	
	 	function getSelectedList(){
	 		$.ajax({
			    url: 'getSelectedList',
			    method: 'GET',
			    dataType: 'json',
			    success: function(data) {
			    	var jobs = data['jobs'];
			    	var depts = data['depts'];
			    	var managers = data['managers'];
			    	
			    	$.each(jobs, function(index, item) {
			    		$('#job_id').append('<option value="'+item.jobId+'">'+item.jobTitle+'</option>');
			    	});
			    	
			    	$.each(depts, function(index, item) {
			    		$('#dep_id').append('<option value="'+item.deptId+'">'+item.departmentName+'</option>');
			    	});
			    	$.each(managers, function(index, item) {
			    		console.log(item);
			    		$('#man_id').append('<option value="'+item.employeeId+'">'+item.firstName+" "+item.lastName+'</option>');
			    	});
			    	
	 			},
	 			error: function(err){
	 				console.log("error");
	 			}
	 		});
	 	}
	 	
	 	 $(document).ready(function(){
	 		 var status = '${status}';
	 		 var feature = '${feature}';
	 		if(status != ""){
		 		 if(status == 'success'){
		 			swal({
		 				  title: '${feature}',
		 				  text: '${status}',
		 				  icon: "success",
		 				  button: "close",
		 			});
		 		 }else{
		 			swal({
		 				  title: '${feature}',
		 				  text: '${status}',
		 				  icon: "error",
		 				  button: "close",
		 			});
		 		 }
	 		} 
	 		
	 	}); 
	 	 
	 	 function editRegion(id){
	 		$.ajax({
	 		    url: 'getRegionById',
	 		    method: 'GET',
	 		    data: {
	 		        regionId: id 
	 		    },
	 		    success: function(data) {
	 		    	
	 		    	$('#region_id').val(id);
	 		    	$('#regionName').val(data);
			 		$('#RegionModel').modal('show');
	 		    },
	 		    error: function(xhr, status, error) {
	 		        console.log(error);
	 		    }
	 		});
	 	 }
	 	 
	 	
	</script>
	
</body>
</html>