package com.josso.businessReport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	
	// 주간업무보고(목록)
	@RequestMapping(value="report/weekly/list", method=RequestMethod.GET)
	public ModelAndView weeklyList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/weeklyList");
		return mv;
	}
	
	// 주간업무보고(작성)
	@RequestMapping(value="report/weekly/write", method=RequestMethod.GET)
	public ModelAndView weeklyWrite() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/weeklyWrite");
		return mv;
	}
	
	// 주간업무보고(디테일페이지)
	@RequestMapping(value="report/weekly/DetailPage", method=RequestMethod.GET)
	public ModelAndView weeklyDetailPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/weeklyDetailPage");
		return mv;
	}
	
	// 주간업무보고(수정)
	@RequestMapping(value="report/weekly/update", method=RequestMethod.GET)
	public ModelAndView weekly() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/weeklyUpdate");
		return mv;
	}
	
	/* ------------------------------------------------------------------- */
	
	// 월간실적보고(목록)
	@RequestMapping(value="report/monthly/list", method=RequestMethod.GET)
	public ModelAndView monthlyList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/monthlyList");
		return mv;
	}
	
	// 월간실적보고(작성)
	@RequestMapping(value="report/monthly/write", method=RequestMethod.GET)
	public ModelAndView monthlyWrite() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/monthlyWrite");
		return mv;
	}
	
	// 월간실적보고(디테일페이지)
	@RequestMapping(value="report/monthly/DetailPage", method=RequestMethod.GET)
	public ModelAndView monthlyDetailPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/monthlyDetailPage");
		return mv;
	}
	
	// 월간실적보고(수정)
	@RequestMapping(value="report/monthly/update", method=RequestMethod.GET)
	public ModelAndView monthlyUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("businessReport/monthlyUpdate");
		return mv;
	}
	
}
