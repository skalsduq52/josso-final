package com.josso.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ScheduleController {
	
	@RequestMapping(value="scheduleList.do")
	public ModelAndView scheduleList(ModelAndView mv) {
		System.out.println("못 갔다");
		mv.setViewName("schedule/scheduleList");
		System.out.println("갔따");
		return mv;
	}
}
