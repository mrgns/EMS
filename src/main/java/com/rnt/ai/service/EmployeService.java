package com.rnt.ai.service;

import java.util.List;

import com.rnt.ai.dto.Country;
import com.rnt.ai.dto.Department;
import com.rnt.ai.dto.Employee;
import com.rnt.ai.dto.Job;
import com.rnt.ai.dto.Location;
import com.rnt.ai.dto.Region;
import com.rnt.ai.dto.UserRegisterDto;

public interface EmployeService {

	List<Employee> getAllEmployeeDetails();
	
	Integer getEmployeeCount();

	List<UserRegisterDto> getAdminData();

	List<UserRegisterDto> getUsersData();

	List<Department> getDepartment();

	List<Location> getAllLocationDetails();

	List<Job> getAllJobDetails();

	List<Region> getAllRegionDetails();

	List<Country> getCountryDetails();

	String saveEmployeeInfo(Employee emp);
	
	List<Employee> getManagers();

}
