package com.rnt.ai.dto;

import java.util.Arrays;

public class ImageDto {
	
	private Integer employeeId;
	private Integer imageId;
	private String name;
	private byte[] profile;
	
	private String base64Image;
	
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public Integer getImageId() {
		return imageId;
	}
	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public byte[] getProfile() {
		return profile;
	}
	public void setProfile(byte[] profile) {
		this.profile = profile;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	@Override
	public String toString() {
		return "ImageDto [employeeId=" + employeeId + ", imageId=" + imageId + ", name=" + name + ", profile="
				+ Arrays.toString(profile) + ", base64Image=" + base64Image + "]";
	}
	
	

}
