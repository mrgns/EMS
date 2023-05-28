package com.rnt.ai.service;



import java.util.HashMap;

import com.rnt.ai.dto.UserRegisterDto;

public interface LoginService {

	String registerUser(UserRegisterDto user);

	HashMap<String,Object> getUser(String name, String password);
	
}
