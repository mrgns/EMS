package com.rnt.ai.dto;

public class Department {
	
	private Integer deptId;
	private String departmentName;
	private Integer locationId;
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public Integer getLocationId() {
		return locationId;
	}
	public void setLocationId(Integer locationId) {
		this.locationId = locationId;
	}
	@Override
	public String toString() {
		return "Department [deptId=" + deptId + ", departmentName=" + departmentName + ", locationId=" + locationId
				+ "]";
	} 
}
