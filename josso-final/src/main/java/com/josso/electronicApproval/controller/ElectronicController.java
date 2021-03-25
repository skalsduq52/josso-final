package com.josso.electronicApproval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ElectronicController {

	@RequestMapping(value="elecApproval", method=RequestMethod.GET)
	public ModelAndView approvalMain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/electronicApproval/electronicApprovalMain");
		return mv;
	}
}
