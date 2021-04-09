package com.josso.staff.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.josso.employee.controller.model.service.EmployeeService;
import com.josso.employee.vo.Employee;

import freemarker.template.SimpleDate;

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
	@RequestMapping(value="staff/address/detail", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String addressDetail(@RequestParam("employeeNumber") String employeeNumber, HttpServletResponse response) throws Exception {
		// response 인코딩 설정
		response.setCharacterEncoding("UTF-8");
		// employee에 select한 데이터 담아주기
		Employee result = employeeService.selectEmployee(employeeNumber);
		// JSON전송객체 생성
		JSONObject job = new JSONObject();
		// 고용일자(Date를 String으로 변환)
		SimpleDateFormat format = new SimpleDateFormat("yy / MM / dd");
		String hiredate = format.format(result.getEmployeeHireDate());
		// 데이터타입 바꿔주고 나면 value값 picture로 바꿔주기
		job.put("picture", result.getEmployeePicture());
		job.put("name", result.getEmployeeName());
		job.put("number", result.getEmployeeNumber());
		job.put("rank", result.getRankCode());
		job.put("position", result.getPositionCode());
		job.put("email", result.getEmployeeEmail());
		job.put("tel", result.getEmployeeExtensionNumber());
		job.put("phone", result.getEmployeePhone());
		job.put("hiredate", hiredate);
		
		return job.toJSONString();
	}

	
}
