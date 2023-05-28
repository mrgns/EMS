package com.rnt.ai.serviceImpl;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.rnt.ai.dao.LoginDao;
import com.rnt.ai.dto.UserRegisterDto;
import com.rnt.ai.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	private LoginDao dao = new LoginDao();
	
	@Override
	public String registerUser(UserRegisterDto user) {
		return dao.registerUser(user);
		
	}

	@Override
	public HashMap<String,Object> getUser(String name, String password) {
		UserRegisterDto user = dao.getUser(name);
		String type = "Not Found";
		if(user.getUserid() != null) {
			if(user.getPassword().equals(password)) {
				if(user.getUserType().equals("Admin") && user.getUserStatus().equals("Active"))
					type = "ADMIN";
				else if (user.getUserType().equals("User") && user.getUserStatus().equals("Active"))
					type = "USER";
			}else
				type = "Not Found";
		}
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("user", user);
		return map;
	}

}
