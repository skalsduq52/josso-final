package com.josso.board.controller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.board.controller.model.dao.BoardDAO;
import com.josso.board.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired 
	BoardDAO boardDao;
	
	
	// 공지사항 리스트 조회
	@Override
	public List<Board> selectNoticeAll() throws Exception {
		List<Board> NoticeList = boardDao.selectNoticeAll();
		return NoticeList;
	}
	
	// 공지사항 디테일페이지
	public Board selectNoticeDetail(int boardNum) throws Exception {
		Board NoticeDetail = boardDao.selectNoticeDetail(boardNum);
		return NoticeDetail;
	}
	
	// 공지사항 작성
	public int noticeWrite(Board board) throws Exception {
		int result = boardDao.noticeWrite(board);
		return result;
	}

	// 공지사항 수정
	public int noticeUpdate(Board board, int boardNum) throws Exception {
		int result = boardDao.noticeUpdate(board, boardNum);
		return result;
	}
	
	// 공지사항 삭제
	public int noticeDelete(int boardNum) throws Exception {
		int result = boardDao.noticeDelete(boardNum);
		return result;
	}

	/* ------------------------------------------------------------- */
	

/* 건의사항  */
	
	// 건의사항 리스트 조회
	public List<Board> selectSuggestionAll() throws Exception {
		List<Board> SuggestionList = boardDao.selectSuggestionAll();
		return SuggestionList;
	}
	
	// 건의사항 디테일페이지
	public Board selectSuggestionDetail(int boardNum) throws Exception {
		Board SuggestionDetail = boardDao.selectSuggestionDetail(boardNum);
		return SuggestionDetail;
	}
	
	// 건의사항 작성
	public int suggestionWrite(Board board) throws Exception {
		int result = boardDao.suggestionWrite(board);
		return result;
	}
	
	// 건의사항 수정
	public int suggestionUpdate(Board board, int boardNum) throws Exception {
		int result = boardDao.suggestionUpdate(board, boardNum);
		return result;
	}
	
	// 건의사항 삭제
	public int suggestionDelete(int boardNum) throws Exception {
		int result = boardDao.suggestionDelete(boardNum);
		return result;
		
	}
	

}
