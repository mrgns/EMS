package com.rnt.ai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;

import org.springframework.stereotype.Repository;

import com.rnt.ai.connectivity.DbConnection;
import com.rnt.ai.dto.UserRegisterDto;

@Repository
public class LoginDao {
	
	Logger logger = Logger.getLogger(LoginDao.class.getName());
	
	DbConnection connect = new DbConnection();
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;

	public String registerUser(UserRegisterDto user) {
		
		StringBuffer sb = new StringBuffer();
		sb.append("Insert into employees(user_id,first_name,last_name,email,hire_date)");
		sb.append("values(?,?,?,?,default)");
		
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("Insert Into Users(name,usernm,pwd) values(?,?,?)");
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			int count = pst.executeUpdate();
			if(count > 0) {
				count = 0;
				pst = con.prepareStatement("Select userid from users where usernm = ?");
				pst.setString(1, user.getEmail());
				rs = pst.executeQuery();
				if(rs.next()) {
					user.setUserid(rs.getInt("userid"));
					pst = con.prepareStatement(sb.toString());
					pst.setInt(1, user.getUserid());
					pst.setString(2, user.getName().split(" ")[0]);
					pst.setString(3, user.getName().split(" ")[1]);
					pst.setString(4, user.getEmail());
					count = pst.executeUpdate();
					if(count > 0)
						return "success";
				}
			}
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		return "failed";
	}
	
	public UserRegisterDto getUser(String name) {
		UserRegisterDto dto = new UserRegisterDto();
		try {
			con = connect.getConnection();
			pst = con.prepareStatement("select * from users where usernm = '"+name+"'");
			rs = pst.executeQuery();
			if(rs.next()) {
				dto.setUserid(Integer.parseInt(rs.getString("userid")));
				dto.setEmail(rs.getString("usernm"));
				dto.setPassword(rs.getString("pwd"));
				dto.setUserType(rs.getString("usertype"));
				dto.setUserStatus(rs.getString("userstatus"));
			}
		}catch(Exception e) {
			logger.info("error : "+e);
		}
		return dto;
	}
	

}
