package com.rnt.ai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;

import org.springframework.stereotype.Repository;

import com.rnt.ai.connectivity.DbConnection;

@Repository
public class EmployeeDetailsDao {
	
	Logger logger = Logger.getLogger(EmployeeDetailsDao.class.getName());
	
	DbConnection connect = new DbConnection();
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public Integer getEmployeeCount() {
		Integer count = 0;
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select count(*) as count from employees");
			rs = pst.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("count"));
			}
		}catch(Exception e) {
			logger.info("error"+e);
		}
		return count;
	}
	
	public Integer getAdminCount() {
		Integer count = 0;
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select count(*) as count from Users where usertype='Admin'");
			rs = pst.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("count"));
			}
		}catch(Exception e) {
			logger.info("error"+e);
		}
		return count;
	}
	
	
	public Integer getUserCount() {
		Integer count = 0;
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select count(*) as count from Users where usertype='User'");
			rs = pst.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("count"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	public Integer getCountryCount() {
		Integer count = 0;
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select count(*) as count from countries");
			rs = pst.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("count"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public Integer getDepartmentCount() {
		Integer count = 0;
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select count(*) as count from departments");
			rs = pst.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("count"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	public Integer getJobsCount() {
		Integer count = 0;
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select count(*) as count from jobs");
			rs = pst.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("count"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public Integer getLocationsCount() {
		Integer count = 0;
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select count(*) as count from locations");
			rs = pst.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("count"));
			}
		}catch(Exception e) {
			logger.info("error"+e);
		}
		return count;
	}
	public Integer getRegionsCount() {
		Integer count = 0;
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select count(*) as count from regions");
			rs = pst.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("count"));
			}
		}catch(Exception e) {
			logger.info("error"+e);
		}
		return count;
	}
	
	
}
