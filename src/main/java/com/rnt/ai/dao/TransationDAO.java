package com.rnt.ai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import com.rnt.ai.connectivity.DbConnection;
import com.rnt.ai.dto.Country;
import com.rnt.ai.dto.Department;
import com.rnt.ai.dto.Job;
import com.rnt.ai.dto.Location;

public class TransationDAO {

	Logger logger = Logger.getLogger(TransationDAO.class.getName());
	
	DbConnection connect = new DbConnection();
	private Connection connection;
	private PreparedStatement psmt;
	private ResultSet rs;

	public String addCountry(Country country) throws SQLException {
		StringBuffer query = new StringBuffer();
		try {
			int success = 0;
			query.append("insert into countries values(?,?,?)");
			connection = connect.getConnection();
			psmt = connection.prepareStatement(query.toString());
			psmt.setString(1, country.getCountryId());
			psmt.setString(2, country.getName());
			psmt.setInt(3, country.getRegionId());
			success = psmt.executeUpdate();
			if (success > 0)
				return "success";
		} catch (SQLException e) {
			logger.info("error : "+e);
		}
		return "Failed";
	}

	public String addLocation(Location location) throws SQLException {
		int success = 0;
		try {
			StringBuffer query = new StringBuffer();
			query.append("insert into locations(street_address,postal_code,city,state_province,country_id)");
			query.append("values(?,?,?,?,?)");
			connection = connect.getConnection();
			psmt = connection.prepareStatement(query.toString());
			psmt.setString(1, location.getStreetAddress());
			psmt.setString(2, location.getPostalCode());
			psmt.setString(3, location.getCity());
			psmt.setString(4, location.getStateProvince());
			psmt.setString(5, location.getCountryId());
			success = psmt.executeUpdate();
			if (success > 0)
				return "success";
		} catch (SQLException e) {
			logger.info("error : "+e);
		}
		return "Failed";
	}

	public String addJobs(Job Job) throws SQLException {
		StringBuffer query = new StringBuffer();
		int success = 0;
		query.append("insert into jobs(job_title,min_salary,max_salary) values(?,?,?)");
		try {
			connection = connect.getConnection();
			psmt = connection.prepareStatement(query.toString());
			psmt.setString(1, Job.getJobTitle());
			psmt.setDouble(2, Job.getMinSalary());
			psmt.setDouble(3, Job.getMaxSalary());
			success = psmt.executeUpdate();
			if (success > 0)
				return "success";
		} catch (SQLException e) {
			logger.info("error : "+e);
		}
		return "Failed";
	}

	public String saveRegion(String name) {
		int status = 0;
		try {
			connection = connect.getConnection();
			psmt = connection.prepareStatement("Insert into regions(region_name) values(?)");
			psmt.setString(1, name);
			status = psmt.executeUpdate();
			if (status > 0)
				return "success";

		} catch (Exception e) {
			logger.info("error : "+e);
		}
		return "Failed";
	}

	public String addDepartment(Department dept) {
		try {
			Integer status = 0;
			connection = connect.getConnection();
			psmt = connection.prepareStatement("Insert into departments(department_name,location_id) values(?,?)");
			psmt.setString(1, dept.getDepartmentName());
			psmt.setInt(2, dept.getLocationId());
			status = psmt.executeUpdate();
			if (status > 0)
				return "success";
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		return "Failed";
	}

	public String deleteRegionById(Integer regionId) {
		try {
			Integer status = 0;
			connection = connect.getConnection();
			psmt = connection.prepareStatement("delete from regions where region_id = ? ");
			psmt.setInt(1, regionId);
			status = psmt.executeUpdate();
			if(status > 0)
				return "success";
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		
		return "Failed";
	}

	public String deleteDeptById(Integer deptId) {
		try {
			Integer status = 0;
			connection = connect.getConnection();
			psmt = connection.prepareStatement("delete from departments where department_id = ? ");
			psmt.setInt(1, deptId);
			status = psmt.executeUpdate();
			if(status > 0)
				return "success";
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		
		return "Failed";
	}

	public String deleteJobById(Integer jobId) {
		try {
			Integer status = 0;
			connection = connect.getConnection();
			psmt = connection.prepareStatement("delete from jobs where job_id = ? ");
			psmt.setInt(1, jobId);
			status = psmt.executeUpdate();
			if(status > 0)
				return "success";
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		
		return "Failed";
	}

	public String deleteCountryById(String countryId) {
		try {
			Integer status = 0;
			connection = connect.getConnection();
			psmt = connection.prepareStatement("delete from countries where country_id = ? ");
			psmt.setString(1, countryId);
			status = psmt.executeUpdate();
			if(status > 0)
				return "success";
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		
		return "Failed";
	}

	public String deleteLocationById(Integer locationId) {
		try {
			Integer status = 0;
			connection = connect.getConnection();
			psmt = connection.prepareStatement("delete from locations where location_id = ? ");
			psmt.setInt(1, locationId);
			status = psmt.executeUpdate();
			if(status > 0)
				return "success";
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		
		return "Failed";
	}

	public String getRegionById(Integer regionId) {
		try {
			connection = connect.getConnection();
			psmt = connection.prepareStatement("Select region_name from regions where region_id = ?");
			psmt.setInt(1, regionId);
			rs = psmt.executeQuery();
			if(rs.next())
				return rs.getString(1);
		}catch(Exception e) {
			logger.info("Error : "+e);
		}
		return "not Found";
	}

	public Country getCountryById(String countryId) {
		Country country = new Country();
		try {
			connection = connect.getConnection();
			psmt = connection.prepareStatement("Select * from countries where country_id = ?");
			psmt.setString(1, countryId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				country.setCountryId(countryId);
				country.setName(rs.getString("country_name"));
				country.setRegionId(rs.getInt("region_id"));
			}	
		}catch(Exception e) {
			logger.info("Error : "+e);
		}
		return country;
	}

	public Location getLocationById(Integer locationId) {
		Location loc = new Location();
		try {
			connection = connect.getConnection();
			psmt = connection.prepareStatement("Select * from locations where location_id = ?");
			psmt.setInt(1, locationId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				loc.setLocationId(locationId);
				loc.setStreetAddress(rs.getString("street_address"));
				loc.setCity(rs.getString("city"));
				loc.setStateProvince(rs.getString("state_province"));
				loc.setCountryId(rs.getString("country_id"));
				loc.setPostalCode(rs.getString("postal_code"));
			}
				
		}catch(Exception e) {
			logger.info("Error : "+e);
		}
		return loc;
	}

	public Department getDepartmentById(Integer deptId) {
		Department dept = new Department();
		try {
			connection = connect.getConnection();
			psmt = connection.prepareStatement("Select * from departments where department_id = ?");
			psmt.setInt(1, deptId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dept.setDeptId(deptId);
				dept.setDepartmentName(rs.getString("department_name"));
				dept.setLocationId(rs.getInt("location_id"));
			}
		}catch(Exception e) {
			logger.info("Error : "+e);
		}
		return dept;
	}

	public Job getJobById(Integer jobId) {
		Job job = new Job();
		try {
			connection = connect.getConnection();
			psmt = connection.prepareStatement("Select * from jobs where job_id = ?");
			psmt.setInt(1, jobId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				job.setJobId(jobId);
				job.setJobTitle(rs.getString("job_title"));
				job.setMaxSalary(rs.getDouble("max_salary"));
				job.setMinSalary(rs.getDouble("min_salary"));
			}
		}catch(Exception e) {
			logger.info("Error : "+e);
		}
		return job;
	}
}
