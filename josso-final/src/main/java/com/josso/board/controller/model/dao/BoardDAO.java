package com.josso.board.controller.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.board.vo.Board;

@Repository
public class BoardDAO {
	
/* 공지사항  */
	
	@Autowired
	SqlSession sqlSession;
	
	// 공지사항 리스트 조회
	public List<Board> selectNoticeAll() throws Exception {
		List<Board> boardList = sqlSession.selectList("board.selectNoticeAll");
		return boardList;
	}
	
	// 공지사항 디테일페이지
	public Board selectNoticeDetail(int boardNum) throws Exception {
		Board board = sqlSession.selectOne("board.selectNoticeDetail");
		return board;
	}
	
	// 공지사항 작성
	public int noticeWrite(Board board) throws Exception {
		int result = sqlSession.insert("board.noticeUpdate");
		return result;
	}

	// 공지사항 수정
	public int noticeUpdate(Board board, int boardNum) throws Exception {
		int result = sqlSession.update("board.noticeDelete");
		return result;
	}
	
	// 공지사항 삭제
	public int noticeDelete(int boardNum) throws Exception {
		int result = sqlSession.delete("board.suggestionDelete");
		return result;
	}
	
	/* ------------------------------------------------------------- */

/* 건의사항  */
	
	// 건의사항 리스트 조회
	public List<Board> selectSuggestionAll() throws Exception {
		List<Board> boardList = sqlSession.selectList("board.selectSuggestionAll");
		return boardList;
	}
	
	// 건의사항 디테일페이지
	public Board selectSuggestionDetail(int boardNum) throws Exception {
		Board board = sqlSession.selectOne("board.selectSuggestionDetail");
		return board;
	}
	
	// 건의사항 작성
	public int suggestionWrite(Board board) throws Exception {
			int result = sqlSession.insert("board.suggestionWrite");
			return result;
	}
	
	// 건의사항 수정
	public int suggestionUpdate(Board board, int boardNum) throws Exception {
		int result = sqlSession.update("board.suggestionUpdate");
		return result;
	}
	
	// 건의사항 삭제
	public int suggestionDelete(int boardNum) throws Exception {
		int result = sqlSession.delete("board.suggestionDelete");
		return result;
	}
	

}
