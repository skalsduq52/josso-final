package com.josso.staff.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class StaffController {  
	
	@RequestMapping(value="staff/organization", method=RequestMethod.GET)
	public ModelAndView organization() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("staff/StaffOrganization");
		return mv;
	}
	
	@RequestMapping(value="staff/address", method=RequestMethod.GET)
	public ModelAndView StaffAddress() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("staff/StaffAddress");
		return mv;
	}
}
