package com.josso.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.josso.board.controller.model.dao.BoardDAO;
import com.josso.board.controller.model.service.BoardService;
import com.josso.board.vo.Board;
import com.josso.employee.vo.Employee;

@Controller 
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	// 공지사항 (목록)
	@RequestMapping(value="board/notice/list", method=RequestMethod.GET)
	public ModelAndView noticeList(ModelAndView mv) throws Exception {
		List<Board> noticeList =  boardService.selectNoticeAll();
		mv.addObject("noticeList", noticeList);
		mv.setViewName("board/noticeList");
		return mv;
	}
	
	// 공지사항 (작성페이지)
	@RequestMapping(value="board/notice/write", method=RequestMethod.GET)
	public ModelAndView noticeWrite(ModelAndView mv) throws Exception {
		mv.setViewName("board/noticeWrite");
		return mv;
	}
	
	// 공지사항 (글 등록)
	@RequestMapping(value="board/notice/register", method=RequestMethod.POST)
	public ModelAndView noticeRegister(ModelAndView mv, Board board, HttpSession session, HttpServletResponse response) throws Exception {
		boardService.noticeWrite(board, session, response);
		return mv;
	}
	
	// 공지사항 (디테일페이지)
	@RequestMapping(value="board/notice/detailPage", method=RequestMethod.GET)
	public ModelAndView noticeDetail(ModelAndView mv, @RequestParam("num") String boardNum) throws Exception {
		Board noticeBoard = boardService.boardDetail(boardNum);
		String num = boardNum;
		
		mv.addObject("num", num);
		mv.addObject("noticeBoard", noticeBoard);
		mv.setViewName("board/noticeDetail");
		return mv;
	}
	
	// 공지사항 (수정) '브릿지'
	@RequestMapping(value="board/notice/updateBridge", method=RequestMethod.GET)
	public ModelAndView noticeUpdateBridge(ModelAndView mv, @RequestParam("num") String num) throws Exception {
		String num1 = num;
		Board board = boardService.boardDetail(num);
		
		mv.addObject("num1", num1);
		mv.addObject("board", board);
		mv.setViewName("board/noticeUpdate");
		return mv;
	}
	
	// 공지사항 (수정)
	@RequestMapping(value="board/notice/update", method=RequestMethod.POST)
	public ModelAndView noticeUpdate(ModelAndView mv, Board board) throws Exception {
		boardService.boardUpdate(board);
		mv.addObject("num", board.getBoardNum());
		mv.setViewName("redirect:detailPage");
		return mv;
	}
	
	// 공지사항(삭제)
	@RequestMapping(value="board/notice/delete", method=RequestMethod.GET)
	public ModelAndView noticeDelete(ModelAndView mv, @RequestParam("num") int boardNum) throws Exception {
		boardService.boardDelete(boardNum);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	/* ------------------------------------------------------------------- */
	
	// 건의사항 (목록)
	@RequestMapping(value="board/suggestion/list", method=RequestMethod.GET)
	public ModelAndView suggestionList(ModelAndView mv) throws Exception {
		List<Board> suggestionList = boardService.selectSuggestionAll();
		mv.addObject("suggestionList", suggestionList);
		mv.setViewName("/board/suggestionList");
		return mv;
	}
	
	// 건의사항 (글 작성)
	@RequestMapping(value="board/suggestion/write", method=RequestMethod.GET)
	public ModelAndView suggestionWriteBridge(ModelAndView mv) throws Exception {
		mv.setViewName("board/suggestionWrite");
		return mv;
	}
	
	// 건의사항 (글 등록)
	@RequestMapping(value="board/suggestion/register", method=RequestMethod.POST)
	public ModelAndView suggestionWrite(ModelAndView mv, Board board, HttpSession session, HttpServletResponse response) throws Exception {
		boardService.suggestionWrite(board, session, response);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	// 건의사항 (디테일페이지)
	@RequestMapping(value="board/suggestion/detailPage", method=RequestMethod.GET)
	public ModelAndView suggestionDetail(ModelAndView mv, @RequestParam("num") String boardNum) throws Exception {
		Board suggestionBoard = boardService.boardDetail(boardNum);
		String num = boardNum;
		
		mv.addObject("num", num);
		mv.addObject("suggestionBoard", suggestionBoard);
		mv.setViewName("/board/suggestionDetailPage");
		return mv;
	}
	
	
	// 건의사항 (수정) '브릿지'
	@RequestMapping(value="board/suggestion/updateBirdge", method=RequestMethod.GET)
	public ModelAndView suggestionUpdateBridge(ModelAndView mv, @RequestParam("num") String num) throws Exception {
		String num1 = num;
		Board board = boardService.boardDetail(num);
		
		mv.addObject("num1", num1);
		mv.addObject("board", board);
		mv.setViewName("board/suggestionUpdate");
		return mv;
	}
	
	// 건의사항 (수정)
	@RequestMapping(value="board/suggestion/update", method=RequestMethod.POST)
	public ModelAndView suggestionUpdate(ModelAndView mv, Board board, @RequestParam("boarNum") int boardNum) throws Exception {
		boardService.boardUpdate(board);
		mv.setViewName("redirect:detailPage");
		return mv;
	}
	
	// 건의사항(삭제)
	@RequestMapping(value="board/suggestion/delete", method=RequestMethod.GET)
	public ModelAndView suggestionDelete(ModelAndView mv, @RequestParam("num") int boardNum) throws Exception {
		boardService.boardDelete(boardNum);
		mv.setViewName("redirect:list");
		return mv;
	}
	
}
