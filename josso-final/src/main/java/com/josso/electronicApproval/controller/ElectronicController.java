package com.josso.electronicApproval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ElectronicController {

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
	
	@RequestMapping(value="elecApproval/signing", method=RequestMethod.GET)
	public ModelAndView approvalSigning(@RequestParam(name = "middle") String middle,
			@RequestParam(name = "last") String last) {
		System.out.println(last);
		ModelAndView mv = new ModelAndView();
		mv.addObject("middle",middle);
		mv.addObject("last",last);
		mv.setViewName("/electronicApproval/signing");
		return mv;
	}
	
}
