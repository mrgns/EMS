package com.rnt.ai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.stereotype.Repository;

import com.rnt.ai.connectivity.DbConnection;
import com.rnt.ai.dto.Employee;
import com.rnt.ai.dto.ImageDto;

@Repository
public class UserDao {

	Logger logger = Logger.getLogger(UserDao.class.getName());
	
	DbConnection connect = new DbConnection();
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public List<Employee> getDetailsByUserId(Integer userid) {
		List<Employee> list = new ArrayList<>();
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select * from employees where user_id = ?");
			pst.setInt(1, userid);
			rs = pst.executeQuery();
			while(rs.next()) {
				Employee emp = new Employee();
				emp.setUserId(userid);
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				emp.setEmail(rs.getString("email"));
				emp.setPhoneNumber(rs.getString("phone_number"));
				emp.setHireDate(rs.getString("hire_date"));
				emp.setJobId(rs.getInt("job_id"));
				emp.setSalary(rs.getDouble(("salary")));
				emp.setManagerId(rs.getInt("manager_id"));
				emp.setDepartmentId(rs.getInt("department_id"));
				list.add(emp);
			}
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		return list;
	}
	
	public ImageDto getProfile(Integer id) {
		ImageDto image = new ImageDto();
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("select * from employee_profile where employee_id = ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				image.setEmployeeId(rs.getInt("employee_id"));
				image.setImageId(rs.getInt("emp_profile_id"));
				image.setName(rs.getString("emp_profile_name"));
				image.setBase64Image(rs.getString("emp_profile_picture"));
			}
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		return image;
	}

	public String uploadImageInfo(ImageDto image) {
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Insert into employee_profile(employee_id,emp_profile_name,emp_profile_picture)"
					+ " values(?,?,?)");
			pst.setInt(1, image.getEmployeeId());
			pst.setString(2, image.getName());
			pst.setString(3, image.getBase64Image());
			int count = pst.executeUpdate();
			if(count > 0) {
				return "success";
			}
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		return "Failed";
	}

}
