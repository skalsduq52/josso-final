package com.josso.businessReport.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class MonthlyController {
	// 월간실적보고(목록)
	@RequestMapping(value="report/monthly/list", method=RequestMethod.GET)
	public ModelAndView monthlyList(ModelAndView mv) {
		mv.setViewName("businessReport/monthlyList");
		return mv;
	}
	
	// 월간실적보고(작성)
	@RequestMapping(value="report/monthly/write", method=RequestMethod.GET)
	public ModelAndView monthlyWrite(ModelAndView mv) {
		mv.setViewName("businessReport/monthlyWrite");
		return mv;
	}
	
	// 월간실적보고(디테일페이지)
	@RequestMapping(value="report/monthly/DetailPage", method=RequestMethod.GET)
	public ModelAndView monthlyDetailPage(ModelAndView mv) {
		mv.setViewName("businessReport/monthlyDetailPage");
		return mv;
	}
	
	// 월간실적보고(수정)
	@RequestMapping(value="report/monthly/update", method=RequestMethod.GET)
	public ModelAndView monthlyUpdate(ModelAndView mv) {
		mv.setViewName("businessReport/monthlyUpdate");
		return mv;
	}
}
