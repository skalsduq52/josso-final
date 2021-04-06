package com.josso.board.controller.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.josso.board.vo.Board;
import com.josso.electronicApproval.vo.Paging;

public interface BoardService {
	
	// 공통
	// 디테일
	public Board boardDetail(String boardNum, HttpServletRequest request) throws Exception;
	
	// 수정
	public int boardUpdate(Board board, HttpServletRequest request) throws Exception;
	
	// 삭제
	public int boardDelete(int boardNum) throws Exception;
	

	/* ------------------------------------------------------------- */
	
	
	// 공지사항
	// 공지사항 리스트 조회
	public List<Board> noticeList(Paging page) throws Exception;
	
	// 공지사항 작성
	public int noticeWrite(Board board, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception;

	// 공지사항 갯수
	public int noticeBoardCount(Paging page) throws Exception;


	/* ------------------------------------------------------------- */
	

	// 건의사항
	// 건의사항 리스트 조회
	public List<Board> suggestionList(Paging page) throws Exception;
	
	// 건의사항 작성
	public int suggestionWrite(Board board, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception;
	
	// 건의사항 갯수
	public int suggestionBoardCount(Paging page) throws Exception;
	
}
