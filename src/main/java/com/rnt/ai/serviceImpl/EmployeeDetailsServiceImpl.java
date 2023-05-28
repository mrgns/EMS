package com.rnt.ai.serviceImpl;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.rnt.ai.dao.EmployeeDetailsDao;
import com.rnt.ai.service.EmployeeDetailsService;

@Service
public class EmployeeDetailsServiceImpl implements EmployeeDetailsService {

	private EmployeeDetailsDao employeeDetailsDao = new EmployeeDetailsDao() ;
	
	
	@Override
	public HashMap<String, Integer> getCounts() {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("adminCount", employeeDetailsDao.getAdminCount());
		map.put("userCount", employeeDetailsDao.getUserCount());
		map.put("empCount", employeeDetailsDao.getEmployeeCount());
		map.put("jobCount", employeeDetailsDao.getJobsCount());
		map.put("countryCount", employeeDetailsDao.getCountryCount());
		map.put("regionCount", employeeDetailsDao.getRegionsCount());
		map.put("deptCount", employeeDetailsDao.getDepartmentCount());
		map.put("locCount", employeeDetailsDao.getLocationsCount());
		return map;
	}

}
