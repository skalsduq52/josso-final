package com.josso.board.controller.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.josso.board.vo.Board;
import com.josso.board.vo.BoardPaging;

public interface BoardService {
	
	// 공통
	// 수정
	public int boardUpdate(Board board) throws Exception;
	
	// 삭제
	public int boardDelete(int boardNum) throws Exception;
	

	/* ------------------------------------------------------------- */
	
	
	// 공지사항
	// 건의사항 디테일
	public Board noticeDetail(String boardNum, HttpServletRequest request) throws Exception;

	// 공지사항 리스트 조회
	public List<Board> noticeList(BoardPaging page) throws Exception;
	
	// 공지사항 작성
	public int noticeWrite(Board board, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception;

	// 공지사항 갯수
	public int noticeBoardCount(BoardPaging page) throws Exception;


	/* ------------------------------------------------------------- */
	

	// 건의사항
	// 건의사항 디테일
	public Board suggestionDetail(String boardNum, HttpServletRequest request) throws Exception;

	// 건의사항 리스트 조회
	public List<Board> suggestionList(BoardPaging page) throws Exception;
	
	// 건의사항 작성(글쓰기)
	public int suggestionWrite(Board board, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception;
	
	// 건의사항 작성(답글달기)
	public int suggestionReply(Board board, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception;
	
	// 건의사항 갯수
	public int suggestionBoardCount(BoardPaging page) throws Exception;
	
}
