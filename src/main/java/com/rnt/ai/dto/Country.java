package com.rnt.ai.dto;

public class Country {
	
	private String countryId;
	private String name;
	private Integer regionId;
	
	
	
	public String getCountryId() {
		return countryId;
	}
	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getRegionId() {
		return regionId;
	}
	public void setRegionId(Integer regionId) {
		this.regionId = regionId;
	}

	public String toString() {
		return "Country [countryId=" + countryId + ", name=" + name + ", regionId=" + regionId + "]";
		
	}
	
	

}
