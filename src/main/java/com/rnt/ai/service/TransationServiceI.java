package com.rnt.ai.service;

import org.springframework.stereotype.Service;

import com.rnt.ai.dto.Country;
import com.rnt.ai.dto.Department;
import com.rnt.ai.dto.Job;
import com.rnt.ai.dto.Location;

@Service
public interface TransationServiceI {

	String addCountaddCountryry(Country country);

	String addLocationation(Location location);

	String addLocationation(Job jOb);

	String saveRegion(String name);

	String addDepartment(Department dept);

	String deleteRegionById(Integer regionId);

	String deleteDeptById(Integer deptId);

	String deleteJobById(Integer jobId);

	String deleteCountryById(String countryId);

	String deleteLocationById(Integer locationId);

	String getRegionById(Integer regionId);

	Country getCountryById(String countryId);

	Location getLocationById(Integer locationId);

	Department getDepartmentById(Integer deptId);

	Job getJobById(Integer jobId);
}
