package com.rnt.ai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.stereotype.Repository;

import com.rnt.ai.connectivity.DbConnection;
import com.rnt.ai.dto.Country;
import com.rnt.ai.dto.Employee;
import com.rnt.ai.dto.Job;
import com.rnt.ai.dto.Location;
import com.rnt.ai.dto.Region;

@Repository
public class DetailsDao {
	Logger logger = Logger.getLogger(DetailsDao.class.getName());
	
	DbConnection connect = new DbConnection();
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	public List<Location> getAllLocationDetails(){
		
		List<Location> list = new ArrayList<>();
		try {
		
			con = connect.getConnection();
			pst = con.prepareStatement("Select * from locations");
			rs = pst.executeQuery();
			while(rs.next()) {
				Location loc= new Location();
				loc.setLocationId(rs.getInt("location_id"));
				loc.setStreetAddress(rs.getString("street_address"));
				loc.setPostalCode(rs.getString("postal_code"));
				loc.setCity( rs.getString("city"));
				loc.setStateProvince(rs.getString("state_province"));
				loc.setCountryId(rs.getString("country_id"));
				list.add(loc) ;
			}
		}catch(Exception e) {
			logger.info("error"+e);
			}
		return list;
	
}
	
	public List<Region> getAllRegionDetails(){
		List<Region>list=new ArrayList<>();
		try {
			con=connect.getConnection();
			pst=con.prepareStatement("select * from regions");
			rs=pst.executeQuery();
		while (rs.next()) {
			Region reg=new Region();
			reg.setRegionId(rs.getInt("region_id"));
			reg.setRegionName(rs.getString("region_name"));
			list.add(reg);	
		}
	}catch(Exception e) {
		logger.info("error"+e);
		
	}
		return list;
}
	public List<Job>getAllJobDetails(){
		List<Job>list=new ArrayList<>();
		try {
			con=connect.getConnection();
			pst=con.prepareStatement("select * from jobs");
			rs=pst.executeQuery();
		while (rs.next()) {
			Job job=new Job();
			job.setJobId(rs.getInt("job_id"));
			job.setJobTitle(rs.getString("job_title"));
			job.setMaxSalary(rs.getDouble("max_salary"));
			job.setMinSalary(rs.getDouble("min_salary"));
		    list.add(job);
			}
		}
		catch (Exception e) {
			logger.info("error"+e);
		}
		return list;
	}

	public List<Country> getCountryDetails() {
		List<Country>list=new ArrayList<>();
		try {
			con=connect.getConnection();
			pst=con.prepareStatement("select * from countries");
			rs=pst.executeQuery();
		while (rs.next()) {
			Country cm = new Country();
				cm.setCountryId(rs.getString("country_id"));
				cm.setName(rs.getString("country_name"));
				cm.setRegionId(rs.getInt("region_id"));
				list.add(cm);
			}
		}
		catch (Exception e) {
			logger.info("error"+e);
		}
		return list;
	}

	public String saveInfoEmployee(Employee em) {
		StringBuilder sb = new StringBuilder();
		sb.append("update employees set first_name=? , last_name=?"
				+ ", phone_number=? , hire_date=? , job_id=? ,"
				+ "salary=? , manager_id=? , department_id=? "
				+ "where email=?");
		try {
			con = connect.getConnection();
			pst = con.prepareStatement(sb.toString());
			pst.setString(1, em.getFirstName());
			pst.setString(2, em.getLastName());
			pst.setString(3, em.getPhoneNumber());
			pst.setString(4, em.getHireDate());
			pst.setInt(5, em.getJobId());
			pst.setDouble(6, em.getSalary());
			pst.setInt(7, em.getManagerId());
			pst.setInt(8, em.getDepartmentId());
			pst.setString(9, em.getEmail());
			int count = pst.executeUpdate();
				if(count > 0) {
					return "success";
				}
		}catch(Exception e) {
			logger.info("error"+e);
		}
		return "Failed";
	}
	
	
}