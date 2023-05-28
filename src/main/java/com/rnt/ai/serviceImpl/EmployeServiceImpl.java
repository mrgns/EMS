package com.rnt.ai.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rnt.ai.dao.DetailsDao;
import com.rnt.ai.dao.EmployeDao;
import com.rnt.ai.dto.Country;
import com.rnt.ai.dto.Department;
import com.rnt.ai.dto.Employee;
import com.rnt.ai.dto.Job;
import com.rnt.ai.dto.Location;
import com.rnt.ai.dto.Region;
import com.rnt.ai.dto.UserRegisterDto;
import com.rnt.ai.service.EmployeService;

@Service
public class EmployeServiceImpl implements EmployeService {
	
	private EmployeDao dao = new EmployeDao();
	
	private DetailsDao emp = new DetailsDao();

	@Override
	public List<Employee> getAllEmployeeDetails() {
		return dao.getAllEmployeeDetails();
	}

	@Override
	public Integer getEmployeeCount() {
		return dao.getEmployeeCount();
	}

	@Override
	public List<UserRegisterDto> getAdminData() {
		return dao.getAdminData();
	}

	@Override
	public List<UserRegisterDto> getUsersData() {
		return dao.getUsersData();
	}

	@Override
	public List<Department> getDepartment() {
		return dao.getDepartmentDetails();
	}

	@Override
	public List<Location> getAllLocationDetails() {
		return emp.getAllLocationDetails();
	}

	@Override
	public List<Job> getAllJobDetails() {
		return emp.getAllJobDetails();
	}

	@Override
	public List<Region> getAllRegionDetails() {
		return emp.getAllRegionDetails();
	}

	@Override
	public List<Country> getCountryDetails() {
		return emp.getCountryDetails();
	}

	@Override
	public String saveEmployeeInfo(Employee em) {
		return emp.saveInfoEmployee(em);
	}

	@Override
	public List<Employee> getManagers() {
		return dao.getManagers();
	}
	
	

}
