package com.josso.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller 
public class BoardController {
	
	// 공지사항 (목록)
	@RequestMapping(value="board/notice/list", method=RequestMethod.GET)
	public ModelAndView noticeList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/noticeList");
		return mv;
	}
	
	// 공지사항 (작성)
	@RequestMapping(value="board/notice/write", method=RequestMethod.GET)
	public ModelAndView noticeWrite() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/noticeWrite");
		return mv;
	}
	
	// 공지사항 (디테일페이지)
	@RequestMapping(value="board/notice/detailPage", method=RequestMethod.GET)
	public ModelAndView noticeDetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/noticeDetailPage");
		return mv;
	}
	
	// 공지사항 (수정)
	@RequestMapping(value="board/notice/update", method=RequestMethod.GET)
	public ModelAndView noticeUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/noticeUpdate");
		return mv;
	}
	
	/* ------------------------------------------------------------------- */
	
	// 건의사항 (목록)
	@RequestMapping(value="board/suggestion/list", method=RequestMethod.GET)
	public ModelAndView suggestionList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/suggestionList");
		return mv;
	}
	
	// 건의사항 (작성)
	@RequestMapping(value="board/suggestion/write", method=RequestMethod.GET)
	public ModelAndView suggestionWrite() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/suggestionWrite");
		return mv;
	}
	
	// 건의사항 (디테일페이지)
	@RequestMapping(value="board/suggestion/detailPage", method=RequestMethod.GET)
	public ModelAndView suggestionDetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/suggestionDetailPage");
		return mv;
	}
	
	// 건의사항 (수정)
	@RequestMapping(value="board/suggestion/update", method=RequestMethod.GET)
	public ModelAndView suggestionUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/suggestionUpdate");
		return mv;
	}
}
