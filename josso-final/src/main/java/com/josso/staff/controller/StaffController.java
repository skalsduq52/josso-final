package com.josso.staff.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	/* ------------------------------------------------------------------- */
	
	// 팝업창
	@ResponseBody
	@RequestMapping(value="staff/address/detail", method=RequestMethod.POST)
	public String addressDetail(@RequestParam("employeeNumber") String employeeNumber, HttpServletResponse response) throws Exception {
		// 들어오는 신호
		System.out.println("아작스들어옴");
		// 들어온 데이터 확인
		System.out.println("employeeNumber : " + employeeNumber);

		// employee에 select한 데이터 담아주기
		Employee result = employeeService.selectEmployee(employeeNumber);
		
		JSONObject job = new JSONObject();
		
		System.out.println(result.getEmployeeName());
		
		job.put("picture", result.getEmployeePicture());
		job.put("name", result.getEmployeeName());
		job.put("number", result.getEmployeeName());
		job.put("department", result.getEmployeeName());
		job.put("rank", result.getEmployeeName());
		job.put("position", result.getEmployeeName());
		job.put("email", result.getEmployeeName());
		job.put("tel", result.getEmployeeName());
		job.put("phone", result.getEmployeeName());
		job.put("hiredate", result.getEmployeeName());
		
		// mv.addObject("result", result);
		
		return job.toJSONString();
	}

	
}
