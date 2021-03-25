package com.josso.staff.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class StaffController {  
	
	// 조직도
	@RequestMapping(value="staff/organization", method=RequestMethod.GET)
	public ModelAndView organization() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("staff/staffOrganization");
		return mv;
	}
	
	/* ------------------------------------------------------------------- */
	
	// 주소록
	@RequestMapping(value="staff/address/list", method=RequestMethod.GET)
	public ModelAndView StaffAddressList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("staff/staffAddress");
		return mv;
	}
	

	
}
