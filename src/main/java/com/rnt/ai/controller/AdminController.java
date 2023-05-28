package com.rnt.ai.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rnt.ai.Constants.UrlConstant;
import com.rnt.ai.dto.Country;
import com.rnt.ai.dto.Department;
import com.rnt.ai.dto.Job;
import com.rnt.ai.dto.Location;
import com.rnt.ai.dto.Region;
import com.rnt.ai.dto.UserRegisterDto;
import com.rnt.ai.service.EmployeService;
import com.rnt.ai.service.EmployeeDetailsService;
import com.rnt.ai.serviceImpl.EmployeServiceImpl;
import com.rnt.ai.serviceImpl.EmployeeDetailsServiceImpl;

@Controller
public class AdminController {

	private EmployeeDetailsService employeeDetailsService = new EmployeeDetailsServiceImpl();

	private EmployeService employeService = new EmployeServiceImpl();

	@RequestMapping(UrlConstant.adminurl)
	public ModelAndView adminPage(HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		UserRegisterDto user = (UserRegisterDto) session.getAttribute("user");
		if (user != null) {
			model.addAttribute("user", user);
			model.addAttribute("usertype", "Admin");
//			model.addAttribute("status", "Admin");
//			model.addAttribute("feature", "Admin");
			model.addAttribute("count", employeeDetailsService.getCounts());
			request.setAttribute("emp", employeService.getAllEmployeeDetails());
			return new ModelAndView(UrlConstant.admin);
		}
		return new ModelAndView(UrlConstant.error);
	}
	
	// Fetch all Admins Data
	@GetMapping(value="getAdmin", produces="application/json")
	public ResponseEntity<List<UserRegisterDto>> getAdmin() {
	    List<UserRegisterDto> list = employeService.getAdminData();
	    return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// Fetch all Users Data
	@GetMapping(value="getUser", produces="application/json")
	public ResponseEntity<List<UserRegisterDto>> getUsers() {
		List<UserRegisterDto> list = employeService.getUsersData();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// Fetch all departments Data
	@GetMapping(value="getDepartments", produces="application/json")
	public ResponseEntity<List<Department>> getDepartmentData() {
		List<Department> list = employeService.getDepartment();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("deleteUser")
	public @ResponseBody String deleteUser(@RequestParam("id") Integer id) {
		System.out.println("deleted");
		return "success";
		
	}
	
	// Fetch all location Data
	@GetMapping(value="getLocations",produces="application/json")
	public ResponseEntity<List<Location>>getAllLocationDetails(){
		List<Location> list=employeService.getAllLocationDetails();
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}
	
	// Fetch all Jobs Data
	@GetMapping(value="getJob",produces="application/json")
	public ResponseEntity<List<Job>> getAllJobDetails(){
		List<Job> list=employeService.getAllJobDetails();
		return new ResponseEntity<>(list  ,HttpStatus.OK);
		
	}
	
	// Fetch all Regions Data
	@GetMapping(value="getRegion",produces="application/json")
	public ResponseEntity<List<Region>> getAllRegionDetails(){
		List<Region> list=employeService.getAllRegionDetails();
		return new ResponseEntity<>(list  ,HttpStatus.OK);
		
	}
	
	// Fetch all countries Data
	@GetMapping(value="getCountries",produces="application/json")
	public ResponseEntity<List<Country>> getCountryDetails(){
		List<Country> list=employeService.getCountryDetails();
		return new ResponseEntity<>(list  ,HttpStatus.OK);
		
	}
	
	@GetMapping("getSelectedList")
	@ResponseBody
	public HashMap<String, Object> getAllLists(){
		HashMap<String, Object> map = new HashMap();
		map.put("jobs", employeService.getAllJobDetails());
		map.put("depts", employeService.getDepartment());
		map.put("managers", employeService.getManagers());
		return map;
	}
}
