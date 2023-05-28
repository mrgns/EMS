package com.rnt.ai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.stereotype.Repository;

import com.rnt.ai.connectivity.DbConnection;
import com.rnt.ai.dto.Department;
import com.rnt.ai.dto.Employee;
import com.rnt.ai.dto.UserRegisterDto;

@Repository
public class EmployeDao {
	
	Logger logger = Logger.getLogger(EmployeDao.class.getName());
	
	DbConnection connect = new DbConnection();
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	public List<Employee> getAllEmployeeDetails() {
		List<Employee> list = new ArrayList<>();
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select * from employees");
			rs = pst.executeQuery();
			while(rs.next()) {
				Employee emp = new Employee();
				emp.setEmployeeId(Integer.parseInt(rs.getString("employee_id")));
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
			logger.info("error"+e);
		}
		return list;
	}
	
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

	public List<UserRegisterDto> getAdminData() {
		List<UserRegisterDto> list = new ArrayList<UserRegisterDto>();
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("select * from users where usertype='Admin'");
			rs = pst.executeQuery();
			while(rs.next()) {
				UserRegisterDto dto = new UserRegisterDto();
				dto.setUserid(Integer.parseInt(rs.getString("userid")));
				dto.setEmail(rs.getString("usernm"));
				dto.setPassword(rs.getString("pwd"));
				dto.setUserType(rs.getString("usertype"));
				dto.setUserStatus(rs.getString("userstatus"));
				list.add(dto);
			}
		}catch(Exception e) {
			logger.info("error"+e);
		}
		return list;
	}
	
	public List<UserRegisterDto> getUsersData() {
		List<UserRegisterDto> list = new ArrayList<UserRegisterDto>();
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("select * from users where usertype='User'");
			rs = pst.executeQuery();
			while(rs.next()) {
				UserRegisterDto dto = new UserRegisterDto();
				dto.setUserid(Integer.parseInt(rs.getString("userid")));
				dto.setEmail(rs.getString("usernm"));
				dto.setPassword(rs.getString("pwd"));
				dto.setUserType(rs.getString("usertype"));
				dto.setUserStatus(rs.getString("userstatus"));
				list.add(dto);
			}
		}catch(Exception e) {
			logger.info("error"+e);
		}
		return list;
	}

	public List<Department> getDepartmentDetails() {
		List<Department> list = new ArrayList<Department>();
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Select * from departments");
			rs = pst.executeQuery();
			while(rs.next()) {
				Department dept = new Department();
				dept.setDeptId(rs.getInt("department_id"));
				dept.setDepartmentName(rs.getString("department_name"));
				dept.setLocationId(rs.getInt("location_id"));
				list.add(dept);
			}
			
			}catch(Exception e) {
				logger.info("error"+e);
			}
		return list;
	}
	
	public List<Employee> getManagers(){
		List<Employee> list = new ArrayList();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT  e.employee_id, e.first_name,e.last_name\r\n"
				+ "FROM employees e JOIN  jobs j ON e.job_id = j.job_id\r\n"
				+ " where j.job_title like \"%_Manager\" order by employee_id;");
		try {
			con = connect.getConnection();
			pst = con.prepareStatement(sb.toString());
			rs = pst.executeQuery();
			while(rs.next()) {
				Employee emp = new Employee();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				list.add(emp);
			}
		}catch(Exception e) {
			logger.info("error"+e);
		}
		return list;
	}

}
