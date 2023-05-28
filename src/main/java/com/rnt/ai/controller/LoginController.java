package com.rnt.ai.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rnt.ai.Constants.UrlConstant;
import com.rnt.ai.dto.UserRegisterDto;
import com.rnt.ai.service.LoginService;
import com.rnt.ai.serviceImpl.LoginServiceImpl;


@Controller
public class LoginController {
	
	private LoginService loginService = new LoginServiceImpl();
	
	@GetMapping(UrlConstant.home)
	public ModelAndView home(){
		return new ModelAndView(UrlConstant.index);
	}
	@GetMapping(UrlConstant.index)
	public ModelAndView index(){
		return new ModelAndView(UrlConstant.index);
	}

	@PostMapping(UrlConstant.login)
	public void loginUser(String name, String password, Model model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HashMap<String, Object> map = loginService.getUser(name, password);
		if (map.get("type").equals("ADMIN")) {
			HttpSession session = request.getSession();
			session.setAttribute("user", map.get("user"));
			 session.setMaxInactiveInterval(1800);
			response.sendRedirect(UrlConstant.adminurl);
		}

		else if (map.get("type").equals("USER")) {
			HttpSession session = request.getSession();
			session.setAttribute("user", map.get("user"));
			response.sendRedirect(UrlConstant.userurl);
		} else if (map.get("type").equals("Not Found"))
			response.sendRedirect(UrlConstant.error);
	}
	
	@GetMapping(UrlConstant.register)
	public ModelAndView register() {
		return new ModelAndView(UrlConstant.register);

	}
	
	@PostMapping(UrlConstant.regUser)
	public ModelAndView newUser(UserRegisterDto user, Model model) {
		String status  = loginService.registerUser(user);
		model.addAttribute("status" , status);
		model.addAttribute("feature" ,"register");
		return new ModelAndView("redirect:/");
	}

	@GetMapping(UrlConstant.logout)
	public ModelAndView logoutUser(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute("user");
		}
		return new ModelAndView("redirect:/");
	}

}
