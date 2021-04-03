package com.josso.board.controller.model.service;

import java.util.List;

import com.josso.board.vo.Board;

public interface BoardService {
	
/* 공지사항  */
	
	// 공지사항 리스트 조회
	public List<Board> selectNoticeAll() throws Exception;
	
	// 공지사항 디테일페이지
	public Board selectNoticeDetail(int boardNum) throws Exception;
	
	// 공지사항 작성
	public int noticeWrite(Board board) throws Exception;

	// 공지사항 수정
	public int noticeUpdate(Board board, int boardNum) throws Exception;
	
	// 공지사항 삭제
	public int noticeDelete(int boardNum) throws Exception;

	/* ------------------------------------------------------------- */
	

/* 건의사항  */
	
	// 건의사항 리스트 조회
	public List<Board> selectSuggestionAll() throws Exception;
	
	// 건의사항 디테일페이지
	public Board selectSuggestionDetail(int boardNum) throws Exception;
	
	// 건의사항 작성
	public int suggestionWrite(Board board) throws Exception;
	
	// 건의사항 수정
	public int suggestionUpdate(Board board, int boardNum) throws Exception;
	
	// 건의사항 삭제
	public int suggestionDelete(int boardNum) throws Exception;
	

}
