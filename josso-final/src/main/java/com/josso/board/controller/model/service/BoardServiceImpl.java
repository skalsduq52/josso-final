package com.josso.board.controller.model.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.board.controller.model.dao.BoardDAO;
import com.josso.board.vo.Board;
import com.josso.employee.vo.Employee;

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
	public Board selectNoticeDetail(String boardNum) throws Exception {
		// 조회수 올리기
		boardDao.hitUpdate(boardNum);
		// 디테일 보여주기
		Board NoticeDetail = boardDao.selectNoticeDetail(boardNum);
		return NoticeDetail;
	}
	
	// 공지사항 작성
	public int noticeWrite(Board board, HttpSession session, HttpServletResponse response) throws Exception {
		// 캐릭터인코딩
		response.setContentType("text/html;charset=utf-8");
		
		// 로그인 한 회원정보 세션값으로 가져오기
		Employee employee = (Employee)session.getAttribute("employee");
		board.setBoardWriter(employee.getEmployeeNumber());
		
		int result = boardDao.noticeWrite(board);

		PrintWriter out = response.getWriter();
		out.print("<script>alert('글이 등록되었습니다.'); location.href='list'; </script>");
		out.close();
		
		return result;
	}

	// 공지사항 수정
	public int noticeUpdate(Board board) throws Exception {
		int result = boardDao.noticeUpdate(board);
		return result;
	}
	
	// 공지사항 삭제
	public int noticeDelete(String boardNum) throws Exception {
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
	public int suggestionUpdate(Board board) throws Exception {
		int result = boardDao.suggestionUpdate(board);
		return result;
	}
	
	// 건의사항 삭제
	public int suggestionDelete(int boardNum) throws Exception {
		int result = boardDao.suggestionDelete(boardNum);
		return result;
		
	}
	

}
