package com.josso.board.controller.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.board.vo.Board;
import com.josso.board.vo.BoardPaging;

@Repository
public class BoardDAO {
	
/* 공지사항  */
	
	@Autowired
	SqlSession sqlSession;
	
	
	// 공통(디테일 / 수정 / 삭제 / 조회수)
	// 수정
	public int boardUpdate(Board board) throws Exception {
		System.out.println("서비스impl의 boardNum값 : " + board.getBoardNum());
		System.out.println(board);
		int result = sqlSession.update("board.Update", board);
		return result;
	}
	
	//  삭제
	public int boardDelete(int boardNum) throws Exception {
		int result = sqlSession.delete("board.Delete", boardNum);
		return result;
	}
	
	// 조회수 올리기
	public int hitUpdate(String boardNum) throws Exception {
		int result = sqlSession.update("board.hit", boardNum);
		return result;
	}
	
	
	/* ------------------------------------------------------------- */
	
	
	// 공지사항
	// 공지사항 디테일
	public Board noticeDetail(String boardNum) throws Exception {
		Board board = sqlSession.selectOne("board.selectDetail", boardNum);
		return board;
	}
	
	
	// 공지사항 리스트 조회
	public List<Board> noticeList(BoardPaging page) throws Exception {
		List<Board> boardList = sqlSession.selectList("board.selectNoticeAll", page);
		return boardList;
	}
	
	// 공지사항 작성
	public int noticeWrite(Board board) throws Exception {
		int result = sqlSession.insert("board.noticeWrite", board);
		return result;
	}

	// 공지사항 개시물 갯수
	public int noticeBoardCount(BoardPaging page) throws Exception {
		int count = sqlSession.selectOne("board.noticeBoardCount", page);
		return count;
	}
	
	/* ------------------------------------------------------------- */

	// 건의사항
	// 건의사항 디테일
	public Board suggestionDetail(String boardNum) throws Exception {
		Board board = sqlSession.selectOne("board.selectDetail", boardNum);
		return board;
	}
	
	// 건의사항 리스트 조회
	public List<Board> suggestionList(BoardPaging page) throws Exception {
		List<Board> boardList = sqlSession.selectList("board.selectSuggestionAll", page);
		return boardList;
	}
	
	// 건의사항 작성
	public int suggestionWrite(Board board) throws Exception {
			int result = sqlSession.insert("board.suggestionWrite", board);
			return result;
	}
	
	// 건의사항 게시물 갯수
	public int suggestionBoardCount(BoardPaging page) throws Exception {
		System.out.println("DAO에 들어온 페이지 카운트 값 : " + page.getCount());
		int count = sqlSession.selectOne("board.suggestionBoardCount", page);
		return count;
	}
	
	

}
