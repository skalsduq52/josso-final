package com.josso.board.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.josso.board.controller.model.dao.BoardDAO;
import com.josso.board.controller.model.service.BoardService;
import com.josso.board.vo.Board;
import com.josso.board.vo.BoardPaging;
import com.josso.employee.vo.Employee;

@Controller 
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	// 공지사항 (목록)
	@RequestMapping(value="board/notice/list", method=RequestMethod.GET)
	public ModelAndView noticeList(ModelAndView mv, BoardPaging page) throws Exception {
		// 세팅
		if(page.getTitle().contentEquals("")) {
			page.setTitle("BOARD_TITLE");
		}
		int noticeBoardCount = boardService.noticeBoardCount(page);
		page.setCount(noticeBoardCount);
		page.setStartNum(page.getPage());
		page.setLastNum(page.getCount());
		page.setStartRange(page.getPage());
		page.setEndRange(page.getPage());
		// 공지사항 리스트 불러오기
		List<Board> noticeList = boardService.noticeList(page);
		// 값 전송
		mv.addObject("page", page);
		mv.addObject("noticeList", noticeList);
		mv.addObject(noticeBoardCount);
		mv.setViewName("board/noticeList");
		return mv;
	}
	
	// 공지사항 (작성페이지)
	@RequestMapping(value="board/notice/write", method=RequestMethod.GET)
	public ModelAndView noticeWrite(ModelAndView mv) throws Exception {
		mv.setViewName("board/noticeWrite");
		return mv;
	}
	
	// 공지사항 (글 등록)
	@RequestMapping(value="board/notice/register", method=RequestMethod.POST)
	public ModelAndView noticeRegister(
			@RequestParam("boardTitle") String title,
			@RequestParam("boardContent") String content,
			@RequestParam("boardFile") MultipartFile file,
			ModelAndView mv,  HttpSession session, HttpServletResponse response, MultipartHttpServletRequest request) throws Exception {
		// 보드 객체 생성
		Board board = new Board();
		// 보드vo에 requestParam값 입력
		board.setBoardTitle(title);
		board.setBoardContent(content);
		// 첨부파일 originalName을 변수에 저장
		String originalName = file.getOriginalFilename();
		// uuid로 새로운 파일명으로 변환
		UUID uid = UUID.randomUUID();
		String rename = uid.toString() + "_" + originalName;
		// 내가 가진 깃 리포지토리 저장경로(절대경로임)(홍수명)
		String path = "C:/Git/josso-final/josso-final/src/main/webapp/resources/multipartFile/"+rename;
		// 깃으로 돌릴 때는 이 주소값 쓰세요(※주의※ 'workspace 경로에 한글이 들어가면 안됨')
		//String path = request.getSession().getServletContext().getRealPath("resources/multipartFile"); 
		// 파일저장
		file.transferTo(new File(path));
		// boardVO에 파일 저장
		board.setBoardFile(rename);
		boardService.noticeWrite(board, session, response, request);
		return mv;
	}
	

	// 공지사항 (디테일페이지)
	@RequestMapping(value="board/notice/detailPage", method=RequestMethod.GET)
	public ModelAndView noticeDetail(ModelAndView mv, @RequestParam("num") String boardNum, HttpServletRequest request) throws Exception {
		Board noticeBoard = boardService.noticeDetail(boardNum, request);
		String num = boardNum;
		mv.addObject("num", num);
		mv.addObject("noticeBoard", noticeBoard);
		mv.setViewName("board/noticeDetail");
		return mv;
	}
	
	// 공지사항 (수정) '브릿지'
	@RequestMapping(value="board/notice/updateBridge", method=RequestMethod.GET)
	public ModelAndView noticeUpdateBridge(ModelAndView mv, @RequestParam("num") String num, HttpServletRequest request) throws Exception {
		String num1 = num;
		Board board = boardService.noticeDetail(num, request);
		mv.addObject("num1", num1);
		mv.addObject("board", board);
		mv.setViewName("board/noticeUpdate");
		return mv;
	}
	
	// 공지사항 (수정)
	@RequestMapping(value="board/notice/update", method=RequestMethod.POST)
	public ModelAndView noticeUpdate(ModelAndView mv, Board board) throws Exception {
		boardService.boardUpdate(board);
		mv.addObject("num", board.getBoardNum());
		mv.setViewName("redirect:detailPage");
		return mv;
	}
	
	// 공지사항(삭제)
	@RequestMapping(value="board/notice/delete", method=RequestMethod.GET)
	public ModelAndView noticeDelete(ModelAndView mv, @RequestParam("num") int boardNum) throws Exception {
		boardService.boardDelete(boardNum);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	/* ------------------------------------------------------------------- */
	
	// 건의사항 (목록)
	@RequestMapping(value="board/suggestion/list", method=RequestMethod.GET)
	public ModelAndView suggestionList(ModelAndView mv, BoardPaging page) throws Exception {
		// 세팅
		if(page.getTitle().contentEquals("")) {
			page.setTitle("BOARD_TITLE");
		}
		int suggestionBoardCount = boardService.suggestionBoardCount(page);
		page.setCount(suggestionBoardCount);
		page.setStartNum(page.getPage());
		page.setLastNum(page.getCount());
		page.setStartRange(page.getPage());
		page.setEndRange(page.getPage());
		// 건의사항 리스트 불러오기
		List<Board> suggestionList = boardService.suggestionList(page);
		// 값 전송
		mv.addObject("page", page);
		mv.addObject("suggestionList", suggestionList);
		mv.addObject("count", suggestionBoardCount);
		mv.setViewName("/board/suggestionList");
		return mv;
	}
	
	// 건의사항 (글 작성)
	@RequestMapping(value="board/suggestion/write", method=RequestMethod.GET)
	public ModelAndView suggestionWriteBridge(ModelAndView mv) throws Exception {
		mv.setViewName("board/suggestionWrite");
		return mv;
	}
	
	// 답글 달기(브릿지)
	@RequestMapping(value="board/suggestion/reply", method=RequestMethod.GET)
	public ModelAndView suggestionReply(ModelAndView mv, Board board) throws Exception {
		String fk_Seq = board.getFk_Seq();
		String groupNo = board.getGroupNo();
		String depthNo = board.getDepthNo();
		
		System.out.println("답글 브릿지 : " + fk_Seq);
		System.out.println("답글 브릿지 : " + groupNo);
		System.out.println("답글 브릿지 : " + depthNo);
		
		mv.addObject("fk_Seq", fk_Seq);
		mv.addObject("groupNo", groupNo);
		mv.addObject("depthNo", depthNo);
		
		mv.setViewName("board/suggestionReply");
		return mv;
	}
	
	// 건의사항 (글 등록)
		@RequestMapping(value="board/suggestion/register", method=RequestMethod.POST)
		public ModelAndView suggestionWrite(
				@RequestParam("boardTitle") String title,
				@RequestParam("boardContent") String content,
				@RequestParam("boardFile") MultipartFile file,
				ModelAndView mv, HttpSession session, HttpServletResponse response, MultipartHttpServletRequest request) throws Exception {
			// 보드 객체 생성
			Board board = new Board();
			// 보드vo에 requestParam값 입력
			board.setBoardTitle(title);
			board.setBoardContent(content);
			if(file != null) {
				// 첨부파일 originalName을 변수에 저장
				String originalName = file.getOriginalFilename();
				// uuid로 새로운 파일명으로 변환
				UUID uid = UUID.randomUUID();
				String rename = uid.toString() + "_" + originalName;
				// 내가 가진 깃 리포지토리 저장경로(절대경로임)(홍수명)
				String path = "C:/Git/josso-final/josso-final/src/main/webapp/resources/multipartFile/"+rename;
				// 깃으로 돌릴 때는 이 주소값 쓰세요(※주의※ 'workspace 경로에 한글이 들어가면 안됨')
				//String path = request.getSession().getServletContext().getRealPath("resources/multipartFile"); 
				// 파일저장
				file.transferTo(new File(path));
				// boardVO에 파일 저장
				board.setBoardFile(rename);
				} else {
					file = null;
				}
			boardService.suggestionWrite(board, session, response, request);
			return mv;
		}


		// 건의사항(답글)
		@RequestMapping(value="board/suggestion/writeReply", method=RequestMethod.POST)
		public ModelAndView suggestionWrite(
				@RequestParam("boardTitle") String title,
				@RequestParam("boardContent") String content,
				@RequestParam("boardFile") MultipartFile file,
				@RequestParam(value="fk_Seq") String seq,
				@RequestParam(value="groupNo") String gNo,
				@RequestParam(value="depthNo") String dNo,
				ModelAndView mv, HttpSession session, HttpServletResponse response, MultipartHttpServletRequest request) throws Exception {
			System.out.println("seq : " + seq);
			System.out.println("gNo : " + gNo);
			System.out.println("dNo : " + dNo);
			// 보드 객체 생성
			Board board = new Board();
			// 보드에 답글관련 데이터 세팅
			board.setFk_Seq(seq);
			board.setGroupNo(gNo);
			board.setDepthNo(dNo);
			// 보드vo에 requestParam값 입력
			board.setBoardTitle(title);
			board.setBoardContent(content);
			if(file != null) {
				// 첨부파일 originalName을 변수에 저장
				String originalName = file.getOriginalFilename();
				// uuid로 새로운 파일명으로 변환
				UUID uid = UUID.randomUUID();
				String rename = uid.toString() + "_" + originalName;
				// 내가 가진 깃 리포지토리 저장경로(절대경로임)(홍수명)
				String path = "C:/Git/josso-final/josso-final/src/main/webapp/resources/multipartFile/"+rename;
				// 깃으로 돌릴 때는 이 주소값 쓰세요(※주의※ 'workspace 경로에 한글이 들어가면 안됨')
				//String path = request.getSession().getServletContext().getRealPath("resources/multipartFile"); 
				// 파일저장
				file.transferTo(new File(path));
				// boardVO에 파일 저장
				board.setBoardFile(rename);
				} else {
					file = null;
				}
			boardService.suggestionReply(board, session, response, request);
			return mv;
		}
		
		
	
	// 건의사항 (디테일페이지)
	@RequestMapping(value="board/suggestion/detailPage", method=RequestMethod.GET)
	public ModelAndView suggestionDetail(ModelAndView mv, @RequestParam("num") String boardNum, HttpServletRequest request) throws Exception {
		
		Board suggestionBoard = boardService.suggestionDetail(boardNum, request);
		System.out.println("리스트에서 디테일 눌렀을 때 해당 게시물의 depth값 : " + suggestionBoard.getDepthNo());
		String num = boardNum;
		mv.addObject("num", num);
		mv.addObject("suggestionBoard", suggestionBoard);
		mv.setViewName("board/suggestionDetailPage");
		return mv;
	}
	
	// 건의사항 (수정) '브릿지'
	@RequestMapping(value="board/suggestion/updateBridge", method=RequestMethod.GET)
	public ModelAndView suggestionUpdateBridge(ModelAndView mv, @RequestParam("num") String num, HttpServletRequest request) throws Exception {
		String num1 = num;
		Board board = boardService.suggestionDetail(num, request);
		mv.addObject("num1", num1);
		mv.addObject("board", board);
		mv.setViewName("board/suggestionUpdate");
		return mv;
	}
	

	// 건의사항 (수정)
	@RequestMapping(value="board/suggestion/update", method=RequestMethod.POST)
	public ModelAndView suggestionUpdate(ModelAndView mv, Board board) throws Exception {
		boardService.boardUpdate(board);
		mv.addObject("num", board.getBoardNum());
		mv.setViewName("redirect:detailPage");
		return mv;
	}
	
	// 건의사항(삭제)
	@RequestMapping(value="board/suggestion/delete", method=RequestMethod.GET)
	public ModelAndView suggestionDelete(ModelAndView mv, @RequestParam("num") int boardNum) throws Exception {
		boardService.boardDelete(boardNum);
		mv.setViewName("redirect:list");
		return mv;
	}
	

	
	// 첨부파일 업로드 기능
	/* private void saveFile(MultipartFile file, HttpServletRequest request) {
		 
		 String savePath = request.getSession().getServletContext().getRealPath("${pageContext.request.contextPath}/resources/multipartFile"); 
		 String filePath = null; 
		 
		 File folder = new File(savePath);
		  
		 if(!folder.exists()) { 
		 	 folder.mkdir(); 
		 }
		 
		 try { 
			 System.out.println(file.getOriginalFilename() + "을 저장합니다.");
			 System.out.println("저장경로 : " + savePath);
		 
			 filePath = folder + "\\" + file.getOriginalFilename();
		 
			 file.transferTo(new File(filePath));
		 
			 System.out.println("파일명 : " + file.getOriginalFilename());
			 System.out.println("파일 경로 : " + filePath);
			 System.out.println("파일 전송이 완료되었습니다.");
		 
		 } catch (Exception e) { 
			 System.out.println("파일 전송 에러 : " + e.getMessage()); }
		 }*/
}
