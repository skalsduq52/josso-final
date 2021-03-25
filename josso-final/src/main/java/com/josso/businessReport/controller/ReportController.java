package com.josso.businessReport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
 
	@RequestMapping(value="report/weekly", method=RequestMethod.GET)
	public ModelAndView weekly() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/WeeklyList");
		return mv;
	}
	
	@RequestMapping(value="report/monthly", method=RequestMethod.GET)
	public ModelAndView monthly() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/MonthlyList");
		return mv;
	}
}
