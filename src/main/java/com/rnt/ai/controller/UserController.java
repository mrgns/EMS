package com.rnt.ai.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rnt.ai.Constants.UrlConstant;
import com.rnt.ai.dto.Employee;
import com.rnt.ai.dto.ImageDto;
import com.rnt.ai.dto.UserRegisterDto;
import com.rnt.ai.service.UserService;
import com.rnt.ai.serviceImpl.UserServiceImpl;

@Controller
public class UserController {
	
	UserService userService = new UserServiceImpl();
	
	
	@RequestMapping(UrlConstant.userurl)
	public ModelAndView userHome(Model model,HttpSession session) {
		UserRegisterDto user = (UserRegisterDto) session.getAttribute("user");
		if (user != null) {
			List<Employee> emp = userService.getDetailsByUserId(user.getUserid());
			model.addAttribute("user", user);
			model.addAttribute("emp", emp);
			model.addAttribute("profile", userService.getProfileImage(emp.get(0).getEmployeeId()));
			model.addAttribute("usertype", "User");
			session.setAttribute("emp", emp.get(0));
			return new ModelAndView(UrlConstant.user);
		}
		return new ModelAndView(UrlConstant.error);
		
	}
	
	@PostMapping("uploadImage")
	public ModelAndView uploadProfile(@RequestParam("image") MultipartFile Image,RedirectAttributes red,
			HttpSession session) throws IOException {
		UserRegisterDto user = (UserRegisterDto) session.getAttribute("user");
		if (user != null) {
			Employee emp = (Employee) session.getAttribute("emp");
			ImageDto image = new ImageDto();
			image.setEmployeeId(emp.getEmployeeId());
			image.setName(Image.getOriginalFilename());
			image.setBase64Image(Base64.getEncoder().encodeToString(Image.getBytes()));
			String status = userService.uploadImageInfo(image);
			red.addFlashAttribute("feature","Image Upload");
			red.addFlashAttribute("Status", "success");
			return new ModelAndView("redirect:/userurl");
		}
		return new ModelAndView(UrlConstant.error);
	}

}
