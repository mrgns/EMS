package com.rnt.ai.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.rnt.ai.dto.Employee;
import com.rnt.ai.dto.ImageDto;

public interface UserService {

	List<Employee> getDetailsByUserId(Integer userid);

	String uploadImageInfo(ImageDto image);

	ImageDto getProfileImage(Integer employeeId);

}
