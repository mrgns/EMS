<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Models</title>
 <style>
    #job_id, #dep_id, #man_id{
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
        }
        
        .saveModal .modal-dialog {
    height: 200px;
    width: 300px;
    font-family: FuturaPT-Book;
  }

  .saveModal .saveAnimation {
    height: 110px;
    width: 110px;
    font-family: FuturaPT-Book;
    font-size: 16px;
  }

  .saveModal .saveText {
    font-family: FuturaPT-Book;
    font-size: 16px;
    color: var(--contentColor);
  }

  .saveModal .saveOk {
    height: 35px;
    width: 60px;
    padding: 5px 10px;
    background: var(--sky-blue);
    color: var(--white);
    margin: 10px 0 0 0;
  }
        
    </style>
</head>
<body>

	<!-- Modal -->
	<div class="modal fade" id="RegionModel" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Add
						Region</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="frm" method="Post" action="addRegion">
					<div class="modal-body">
						<label>Region Name</label> 
						<input type="hidden" id="region_id" value="" name="regionId">
						<input type="text" id="regionName" name="name">
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


	<!-- -----------------------CountryModel----------------------------- -->
	<div class="modal fade" id="CountryModel" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Add
						Country Details</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="frm" method="Post" action="addCountry">
					<div class="modal-body">
						 <td>
							 <label>Country ID</label> 
							 <input type="text" name="countryId" id="countryId" class="form-control" placeholder="Ex. IN for India">
						</td> 
						<br>
						<td>
							<label>Country Name</label> 
							<input type="text" name="name" id="countryName" class="form-control"></td>
						<br>
						<td>
							<label>Region Id</label> 
							<select id="regionId" name="regionId" class="form-control">
							
							</select>
						</td>
						<br>
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

	<!-- -----------------------CountryModel end----------------------------- -->
	<div class="modal fade" id="LocationModel" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Add
						New Location</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="frm" method="Post" action="addLocation">
					<div class="modal-body">
						<td>
						<!--<label>Location Id</label>  -->
						<input type="hidden" name="locationId" id="locationId" class="form-control" placeholder="1000 - 99999"></td>
						<td>
							<label>Street Adress</label> 
							<input type="text" name="streetAddress" id="streetAddress" class="form-control"></td>
						<td>
							<label> Postal code</label> 
							<input type="text" name="postalCode" id="postalCode" class="form-control"></td>
						<td>
							<label>City</label> 
							<input type="text" name="city" id="city1" class="form-control"></td>
						<td>
							<label>State Provinance</label>
						    <input type="text" name="stateProvince" id="stateProvince1" class="form-control">
						<td>
						<td>
							<label>Country Id</label> 
							<select id="countryId" name="countryId" class="form-control">
								<option>Select Country</option>
							</select>
						</td>

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
	<!-- location end  -->


	<div class="modal fade" id="JobModel" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Add
						New Job</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="frm" method="Post" action="addJob">
					<div class="modal-body">

						<!-- <td><label>Job Id</label> </td> -->
						<input type="hidden" name="jobId" id="jobId" class="form-control">
						<td>
							<label>Job Title</label> 
							<input type="text" name="name" id="jobTitle" class="form-control">
						</td>
						<td>
							<label> Min salary</label> 
							<input type="text" name="minSalary" id="minSalary" class="form-control" placeholder="8400.00">
						</td>
						<td>
							<label>Max Salary</label>
							<input type="text" name="maxSalary" id="maxSalary" class="form-control" placeholder="18400.00">
						</td>


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
<!----------------------------------- Job mdel  end -------------------------->

	<div class="modal fade" id="DepartmentModel" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Add
						New Department</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="frm" method="Post" action="addDepartment">
					<div class="modal-body">

						 <td>
							 <label>Department Id</label> 
							 <input type="hidden" name="deptId" id="deptId" class="form-control"></td> 
						  <td>
							<label>Department Name</label>
						 	<input type="text" name="departmentName" id="departmentName" class="form-control">
						 </td>
							<td>
								<label>Location Id</label>
								 <select id="LocationId" name="locationId" class="form-control">
									<option value=""> select Location</option>
								</select>
							</td>


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
	<!-- Department module end -->
	
	
	
	
	
	<div class="modal fade" id="employeeModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 75vw; margin-left: -230px;">
  <form action="newEmployee" method="post" enctype="multipart/form-data">
      <div class="modal-header border-bottom-0">
        <h5 class="modal-title" id="exampleModalLabel">Add Employee Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <div class="row">
                <div class="col-4">
                    <label for="employee" class="form-label">Employee ID</label>
                    <!-- <input type="number" name="employeeId" class="form-control" id="employee">   -->
                </div>
                <div class="col-4">
                    <label for="first_name" class="form-label">First Name</label>
                    <input type="text" name="firstName" class="form-control" id="first_name" required>  
                </div>
                <div class="col-4">
                    <label for="last_name" class="form-label">Last Name</label>
                    <input type="text" name="lastName" class="form-control" id="last_name" required>  
                </div>
                <div class="col-4 mt-2">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" id="email" required>  
                </div>
                <div class="col-4 mt-2">
                    <label for="ph_no" class="form-label">Phone Number</label>
                    <input type="number" name="phoneNumber" class="form-control" id="ph_no" required>  
                </div>
                <div class="col-4 mt-2">
                    <label for="hire_date" class="form-label">Hire Date</label>
                    <input type="date" name="hireDate" class="form-control" id="hire_date" required>  
                </div>
                <div class="col-4 mt-2">
                    <label for="job_id" class="form-label">Job ID</label>
                    <select name="jobId" id="job_id"  style="width:100%;" required>
                        <option selected>Select Job</option>
                    </select> 
                </div>
                <div class="col-4 mt-2">
                    <label for="salary" class="form-label">Salary</label>
                    <input type="number" name="salary" class="form-control" id="salary" required>  
                </div>
                <div class="col-4 mt-2">
                    <label for="man_id" class="form-label">Manager ID</label>
                    <select name="managerId" id="man_id"  style="width:100%;" required>
                        <option selected>select manager</option>
                    </select> 
                </div>
                <div class="col-4 mt-2">
                    <label for="dep_id" class="form-label">Department ID</label>
                    <select name="departmentId" id="dep_id" style="width:100%;" required>
                        <option selected>Select department</option>
                    </select> 
                </div>
                <div class="col-4 mt-2">
                    <label for="profile_pic" class="form-label">Add Profile Photo</label>
                    <input type="file" name="picture" class="form-control" id="profile_pic" accept="image/*">  
                </div>
            </div>
      </div>
      <div class="modal-footer border-top-0">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
  </form>
    </div>
  </div>
</div>

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
</body>
</html>
