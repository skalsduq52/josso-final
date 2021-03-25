package com.josso.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller 
public class BoardController {
	
	@RequestMapping(value="board/notice", method=RequestMethod.GET)
	public ModelAndView notice() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/noticeList");
		return mv;
	}
	
	@RequestMapping(value="board/suggestion", method=RequestMethod.GET)
	public ModelAndView suggestion() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/SuggestionList");
		return mv;
	}
}
