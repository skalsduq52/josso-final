package com.josso.board.controller.model.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	// 공통
	// 디테일페이지
	public Board boardDetail(String boardNum, HttpServletRequest request) throws Exception {
		// 조회수 올리기
		boardDao.hitUpdate(boardNum);
		// 디테일 보여주기
		Board NoticeDetail = boardDao.boardDetail(boardNum);
		// 치환
		String content = NoticeDetail.getBoardContent();
		content = content.replace("\n\r", "<br>");
		content = content.replace(" ", "&nbsp;");
		// 깃 받아라
		return NoticeDetail;
	}
	
	// 수정
	public int boardUpdate(Board board, HttpServletRequest request) throws Exception {
		// 치환
		String content = request.getParameter("boardContent");
		content = content.replace("\n\r", "<br>");
		content = content.replace(" ", "&nbsp;");
		// 결과값
		int result = boardDao.boardUpdate(board);
		return result;
	}
	
	// 삭제
	public int boardDelete(int boardNum) throws Exception {
		int result = boardDao.boardDelete(boardNum);
		return result;
	}
	
	
	/* ------------------------------------------------------------- */
	
	// 공지사항
	// 공지사항 리스트 조회
	@Override
	public List<Board> selectNoticeAll() throws Exception {
		List<Board> NoticeList = boardDao.selectNoticeAll();
		return NoticeList;
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


	/* ------------------------------------------------------------- */
	
	// 건의사항
	// 건의사항 리스트 조회
	public List<Board> selectSuggestionAll() throws Exception {
		List<Board> SuggestionList = boardDao.selectSuggestionAll();
		return SuggestionList;
	}
	
	// 건의사항 작성
	public int suggestionWrite(Board board, HttpSession session, HttpServletResponse response) throws Exception {
		// 캐릭터인코딩
		response.setContentType("text/html;charset=utf-8");
		
		// 로그인 한 회원정보 세션값으로 가져오기
		Employee employee = (Employee)session.getAttribute("employee");
		board.setBoardWriter(employee.getEmployeeNumber());
		
		int result = boardDao.suggestionWrite(board);
		return result;
	}
	

	

}
