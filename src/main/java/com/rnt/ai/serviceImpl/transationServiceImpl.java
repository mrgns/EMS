package com.rnt.ai.serviceImpl;

import java.sql.SQLException;

import com.rnt.ai.dao.TransationDAO;
import com.rnt.ai.dto.Country;
import com.rnt.ai.dto.Department;
import com.rnt.ai.dto.Job;
import com.rnt.ai.dto.Location;
import com.rnt.ai.service.TransationServiceI;

public class transationServiceImpl implements TransationServiceI {

	  TransationDAO transationDao = new TransationDAO();
	@Override
	public String addCountaddCountryry(Country country) {
		try {
			return	transationDao.addCountry(country);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Failed";
	}
	@Override
	public String addLocationation(Location location) {
			try {
				return	transationDao.addLocation(location);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "Failed";
	}
	@Override
	public String addLocationation(Job jOb) {
			try {
				return	transationDao.addJobs(jOb);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "Failed";
	}
	
	@Override
	public String saveRegion(String name) {
		return transationDao.saveRegion(name);
	}
	
	@Override
	public String addDepartment(Department dept) {
		return transationDao.addDepartment(dept);
	}
	
	
	@Override
	public String deleteRegionById(Integer regionId) {
		return transationDao.deleteRegionById(regionId);
	}
	
	@Override
	public String deleteDeptById(Integer deptId) {
		return transationDao.deleteDeptById(deptId);
	}
	
	@Override
	public String deleteJobById(Integer jobId) {
		return transationDao.deleteJobById(jobId);
	}
	
	@Override
	public String deleteCountryById(String countryId) {
		return transationDao.deleteCountryById(countryId);
	}
	
	@Override
	public String deleteLocationById(Integer locationId) {
		return transationDao.deleteLocationById(locationId);
	}
	
	@Override
	public String getRegionById(Integer regionId) {
		return transationDao.getRegionById(regionId);
	}
	
	@Override
	public Country getCountryById(String countryId) {
		return transationDao.getCountryById(countryId);
	}
	
	@Override
	public Location getLocationById(Integer locationId) {
		return transationDao.getLocationById(locationId);
	}
	
	@Override
	public Department getDepartmentById(Integer deptId) {
		return transationDao.getDepartmentById(deptId);
	}
	
	@Override
	public Job getJobById(Integer jobId) {
		return transationDao.getJobById(jobId);
	}
	
	
	

	
	
	

}
