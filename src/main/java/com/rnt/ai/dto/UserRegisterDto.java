package com.rnt.ai.dto;


public class UserRegisterDto {
	
	private Integer userid;
	private String name;
	private String email;
	private String password;
	private String userType;
	private String userStatus;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	@Override
	public String toString() {
		return "UserRegisterDto [userid=" + userid + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", userType=" + userType + ", userStatus=" + userStatus + "]";
	}
	
	
	

}
