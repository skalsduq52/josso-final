package com.josso.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ScheduleController {
	
	@RequestMapping(value="schedule", method=RequestMethod.GET)
	public ModelAndView scheduleList() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("schedule/scheduleList");
		return mv;
	}
	
	@RequestMapping(value="schedule/write", method=RequestMethod.GET)
	public ModelAndView scheduleWrite() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("schedule/scheduleWrite");
		return mv;
	}
}
