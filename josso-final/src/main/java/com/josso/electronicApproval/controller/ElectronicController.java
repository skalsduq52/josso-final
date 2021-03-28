package com.josso.electronicApproval.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.josso.electronicApproval.controller.model.dao.electronicApprovalDAO;
import com.josso.employee.vo.Employee;

@Controller
public class ElectronicController {
	
	@Autowired
	electronicApprovalDAO ed;

	@RequestMapping(value="elecApproval", method=RequestMethod.GET)
	public ModelAndView approvalMain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/electronicApproval/electronicApprovalMain");
		return mv;
	}
	
	@RequestMapping(value="elecApproval/waiting", method=RequestMethod.GET)
	public ModelAndView approvalWaiting() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/electronicApproval/waitingSign");
		return mv;
	}
	
	@RequestMapping(value="elecApproval/reception", method=RequestMethod.GET)
	public ModelAndView approvalRecept() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/electronicApproval/receptionSign");
		return mv;
	}
	
	@RequestMapping(value="elecApproval/my", method=RequestMethod.GET)
	public ModelAndView approvalMy() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/electronicApproval/mySign");
		return mv;
	}
	
	@RequestMapping(value="elecApproval/signing", method=RequestMethod.POST)
	public ModelAndView approvalSigning(@RequestParam(name = "middle") String middle,
										@RequestParam(name = "middlename") String middleName,
										@RequestParam(name = "last") String last,
										@RequestParam(name = "lastname") String lastName) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("middle",middle);
		mv.addObject("middleName",middleName);
		mv.addObject("last",last);
		mv.addObject("lastName",lastName);
		mv.setViewName("/electronicApproval/signing");
		return mv;
	}
	
	@RequestMapping(value="elecApproval/serachName", method=RequestMethod.POST)
	public void approvalSearch(Employee emp, HttpServletResponse response) throws Exception {
		System.out.println(emp.getEmployeeName());
		List<Employee> empList = ed.selectEmpAll(emp);
		if(empList.size()==0) {
			System.out.println("없는 사람");
		}else {
			// 전송용 최종 json 객체
			 JSONObject sendJson = new JSONObject();
			 // JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
			 JSONArray empArray = new JSONArray();
			 
			 for(Employee employee : empList){
				 //user 정보 저장할 json 객체 선언
				 JSONObject em = new JSONObject();
				 em.put("dCode", employee.getDepartmentCode());
				 em.put("rCode", employee.getRankCode());
				 em.put("name", employee.getEmployeeName());
				 empArray.add(em);
			}
			 sendJson.put("list", empArray);
			 response.setContentType("application/json; charset=utf-8");
			 PrintWriter out = response.getWriter();
			 System.out.println(sendJson.toJSONString());
			 out.println(sendJson.toJSONString());
			 out.flush();
			 out.close();
		}
	}
	
}
