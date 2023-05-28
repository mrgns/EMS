package com.rnt.ai.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rnt.ai.dao.UserDao;
import com.rnt.ai.dto.Employee;
import com.rnt.ai.dto.ImageDto;
import com.rnt.ai.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	UserDao userDao = new UserDao();
	
	@Override
	public List<Employee> getDetailsByUserId(Integer userid) {
		return userDao.getDetailsByUserId(userid);
	}

	@Override
	public String uploadImageInfo(ImageDto image) {
		return userDao.uploadImageInfo(image);
	}

	@Override
	public ImageDto getProfileImage(Integer employeeId) {
		return userDao.getProfile(employeeId);
	}

}
