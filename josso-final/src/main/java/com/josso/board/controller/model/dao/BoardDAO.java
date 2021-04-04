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
	public Board selectNoticeDetail(String boardNum) throws Exception {
		Board board = sqlSession.selectOne("board.selectNoticeDetail", boardNum);
		return board;
	}
	
	// 공지사항 작성
	public int noticeWrite(Board board) throws Exception {
		int result = sqlSession.insert("board.noticeWrite", board);
		return result;
	}

	// 공지사항 수정
	public int noticeUpdate(Board board) throws Exception {
		System.out.println("서비스impl의 boardNum값 : " + board.getBoardNum());
		int result = sqlSession.update("board.noticeUpdate", board);
		return result;
	}
	
	// 공지사항 삭제
	public int noticeDelete(String boardNum) throws Exception {
		int result = sqlSession.delete("board.noticeDelete", boardNum);
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
		Board board = sqlSession.selectOne("board.selectSuggestionDetail", boardNum);
		return board;
	}
	
	// 건의사항 작성
	public int suggestionWrite(Board board) throws Exception {
			int result = sqlSession.insert("board.suggestionWrite", board);
			return result;
	}
	
	// 건의사항 수정
	public int suggestionUpdate(Board board) throws Exception {
		int result = sqlSession.update("board.suggestionUpdate", board);
		return result;
	}
	
	// 건의사항 삭제
	public int suggestionDelete(int boardNum) throws Exception {
		int result = sqlSession.delete("board.suggestionDelete", boardNum);
		return result;
	}
	
	// 조회수 올리기
	public int hitUpdate(String boardNum) throws Exception {
		int result = sqlSession.update("board.hit", boardNum);
		return result;
	}

}
