package com.josso.staff.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.josso.employee.controller.model.service.EmployeeService;
import com.josso.employee.vo.Employee;

@Controller
public class StaffController {  
	
	@Autowired
	EmployeeService employeeService;
	
	// 조직도
	@RequestMapping(value="staff/organization", method=RequestMethod.GET)
	public ModelAndView organization(ModelAndView mv)throws Exception {
		
		mv.setViewName("staff/staffOrganization");
		return mv;
	}
	
	/* ------------------------------------------------------------------- */
	
	// 주소록
	@RequestMapping(value="staff/address/list", method=RequestMethod.GET)
	public ModelAndView StaffAddressList(ModelAndView mv) throws Exception {
		List<Employee> employeeList = employeeService.selectEmployeeAll();
		
		mv.addObject("employeeList", employeeList);
		mv.setViewName("staff/staffAddress");
		return mv;
	}
	

	
}
