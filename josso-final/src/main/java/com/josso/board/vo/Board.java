package com.josso.board.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Board {
	
	// 필드부
	private int boardNum;
	private String boardKind;
	private String boardTitle;
	private String boardContent;
	private String boardFile;
	//private MultipartFile boardFile;(사용 안 됨.. 왜지...)
	private String boardWriter;
	private Date boardRegDate; 
	private int boardHit;
	// 조인할 때 쓸 것
	private String employeeName;
	private String departmentCode;
	private String rankCode;
	// 답변 게시판에 쓸 것
	private String groupNo;
	private String fk_Seq;
	private String depthNo;
	






	// 기본 생성자
	public Board() {}

	
	// 메서드
	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardKind() {
		return boardKind;
	}

	public void setBoardKind(String boardKind) {
		this.boardKind = boardKind;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public Date getBoardRegDate() {
		return boardRegDate;
	}

	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getRankCode() {
		return rankCode;
	}

	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}
	
	public String getGroupNo() {
		return groupNo;
	}


	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	
	public String getFk_Seq() {
		return fk_Seq;
	}


	public void setFk_Seq(String fk_Seq) {
		this.fk_Seq = fk_Seq;
	}
	
	public String getDepthNo() {
		return depthNo;
	}


	public void setDepthNo(String depthNo) {
		this.depthNo = depthNo;
	}







	
	
	
	
}
