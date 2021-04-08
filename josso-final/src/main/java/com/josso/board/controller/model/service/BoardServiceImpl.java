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
import com.josso.board.vo.BoardPaging;
import com.josso.employee.vo.Employee;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired 
	BoardDAO boardDao;
	
	// 공통
	// 수정
	@Override
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
	@Override
	public int boardDelete(int boardNum) throws Exception {
		int result = boardDao.boardDelete(boardNum);
		return result;
	}
	
	
	/* ------------------------------------------------------------- */
	
	// 공지사항 디테일페이지
	@Override
	public Board noticeDetail(String boardNum, HttpServletRequest request) throws Exception {
		// 조회수 올리기
		boardDao.hitUpdate(boardNum);
		// 디테일 보여주기
		Board NoticeDetail = boardDao.noticeDetail(boardNum);
		// 치환
		String title = NoticeDetail.getBoardTitle();
		title = title.replace(" ", "&nbsp;");
		String content = NoticeDetail.getBoardContent();
		content = content.replace("\n\r", "<br>");
		content = content.replace(" ", "&nbsp;");
		// 깃 받아라
		return NoticeDetail;
	}
	
	// 공지사항
	// 공지사항 리스트 조회
	@Override
	public List<Board> noticeList(BoardPaging page) throws Exception {
		List<Board> NoticeList = boardDao.noticeList(page);
		return NoticeList;
	}
	
	// 공지사항 작성
	@Override
	public int noticeWrite(Board board, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
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

	// 공지사항 갯수
	@Override
	public int noticeBoardCount(BoardPaging page) throws Exception {
		int count = boardDao.noticeBoardCount(page);
		return count;
	}

	
	
	/* ------------------------------------------------------------- */
	
	// 건의사항
	@Override
	public Board suggestionDetail(String boardNum, HttpServletRequest request) throws Exception {
		// 조회수 올리기
		boardDao.hitUpdate(boardNum);
		// 디테일 보여주기
		Board suggestionDetail = boardDao.suggestionDetail(boardNum);
		// 치환
		String title = suggestionDetail.getBoardTitle();
		title = title.replace(" ", "&nbsp;");
		String content = suggestionDetail.getBoardContent();
		content = content.replace("\n\r", "<br>");
		content = content.replace(" ", "&nbsp;");
		// 깃 받아라
		return suggestionDetail;
	}
	
	// 건의사항
	// 건의사항 리스트 조회
	@Override
	public List<Board> suggestionList(BoardPaging page) throws Exception {
		List<Board> SuggestionList = boardDao.suggestionList(page);
		return SuggestionList;
	}
	
	// 건의사항 작성
	@Override
	public int suggestionWrite(Board board, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		// 캐릭터인코딩
		response.setContentType("text/html;charset=utf-8");
		// 로그인 한 회원정보 세션값으로 가져오기
		Employee employee = (Employee)session.getAttribute("employee");
		board.setBoardWriter("작성자 : " +employee.getEmployeeNumber());
		System.out.println(board.getBoardWriter());
		int result = boardDao.suggestionWrite(board);
		System.out.println("결과 : " + result);
		PrintWriter out = response.getWriter();
		out.print("<script>alert('글이 등록되었습니다.'); location.href='list'; </script>");
		out.close();
		return result;
	}
	
	
	// 건의사항 갯수
	@Override
	public int suggestionBoardCount(BoardPaging page) throws Exception {
		int count = boardDao.suggestionBoardCount(page);
		return count;
	}

	

}
