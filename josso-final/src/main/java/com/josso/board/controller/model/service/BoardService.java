package com.josso.board.controller.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.josso.board.vo.Board;

public interface BoardService {
	
/* 공지사항  */
	
	// 공지사항 리스트 조회
	public List<Board> selectNoticeAll() throws Exception;
	
	// 공지사항 디테일페이지
	public Board selectNoticeDetail(String boardNum) throws Exception;
	
	// 공지사항 작성
	public int noticeWrite(Board board, HttpSession session, HttpServletResponse response) throws Exception;

	// 공지사항 수정
	public int noticeUpdate(Board board) throws Exception;
	
	// 공지사항 삭제
	public int noticeDelete(String boardNum) throws Exception;

	/* ------------------------------------------------------------- */
	

/* 건의사항  */
	
	// 건의사항 리스트 조회
	public List<Board> selectSuggestionAll() throws Exception;
	
	// 건의사항 디테일페이지
	public Board selectSuggestionDetail(int boardNum) throws Exception;
	
	// 건의사항 작성
	public int suggestionWrite(Board board) throws Exception;
	
	// 건의사항 수정
	public int suggestionUpdate(Board board) throws Exception;
	
	// 건의사항 삭제
	public int suggestionDelete(int boardNum) throws Exception;
	

}
