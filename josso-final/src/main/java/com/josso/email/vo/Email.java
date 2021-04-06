package com.josso.email.vo;

import java.util.Date;

public class Email {
	
	private String employeeNumber;	// 임직원 번호
	private int emailNumber;		// 이메일 고유번호
	private String emailSend;		// 이메일 보낸사람
	private String emailAccept;		// 이메일 받는사람
	private String emailReference;	// 이메일  참조자
	private String emailTitle;		// 이메일  제목
	private String emailContent;	// 이메일  내용
	private String emailFile;		// 이메일 첨부파일
	private Date regDate;			// 이메일 작성날짜
	private String emailWastebasket;// 이메일 휴지통상태
	private String emailRead;		// 이메일 읽음상태
	private String emailPosition;	// 이메일 위치
	private String employeeName;	// 임직원 이름
	private String rankCode;		// 임직원 직급
	private String departmentCode;	// 임직원 부서명
	
	public Email() {
		
	}

	@Override
	public String toString() {
		return "Email [employeeNumber=" + employeeNumber + ", emailNumber=" + emailNumber + ", emailSend=" + emailSend
				+ ", emailAccept=" + emailAccept + ", emailReference=" + emailReference + ", emailTitle=" + emailTitle
				+ ", emailContent=" + emailContent + ", emailFile=" + emailFile + ", regDate=" + regDate
				+ ", emailWastebasket=" + emailWastebasket + ", emailRead=" + emailRead + ", emailPosition="
				+ emailPosition + ", employeeName=" + employeeName + ", rankCode=" + rankCode + ", departmentCode="
				+ departmentCode + "]";
	}

	public Email(String employeeNumber, int emailNumber, String emailSend, String emailAccept, String emailReference,
			String emailTitle, String emailContent, String emailFile, Date regDate, String emailWastebasket,
			String emailRead, String emailPosition, String employeeName, String rankCode, String departmentCode) {
		super();
		this.employeeNumber = employeeNumber;
		this.emailNumber = emailNumber;
		this.emailSend = emailSend;
		this.emailAccept = emailAccept;
		this.emailReference = emailReference;
		this.emailTitle = emailTitle;
		this.emailContent = emailContent;
		this.emailFile = emailFile;
		this.regDate = regDate;
		this.emailWastebasket = emailWastebasket;
		this.emailRead = emailRead;
		this.emailPosition = emailPosition;
		this.employeeName = employeeName;
		this.rankCode = rankCode;
		this.departmentCode = departmentCode;
	}

	public String getEmployeeNumber() {
		return employeeNumber;
	}

	public void setEmployeeNumber(String employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public int getEmailNumber() {
		return emailNumber;
	}

	public void setEmailNumber(int emailNumber) {
		this.emailNumber = emailNumber;
	}

	public String getEmailSend() {
		return emailSend;
	}

	public void setEmailSend(String emailSend) {
		this.emailSend = emailSend;
	}

	public String getEmailAccept() {
		return emailAccept;
	}

	public void setEmailAccept(String emailAccept) {
		this.emailAccept = emailAccept;
	}

	public String getEmailReference() {
		return emailReference;
	}

	public void setEmailReference(String emailReference) {
		this.emailReference = emailReference;
	}

	public String getEmailTitle() {
		return emailTitle;
	}

	public void setEmailTitle(String emailTitle) {
		this.emailTitle = emailTitle;
	}

	public String getEmailContent() {
		return emailContent;
	}

	public void setEmailContent(String emailContent) {
		this.emailContent = emailContent;
	}

	public String getEmailFile() {
		return emailFile;
	}

	public void setEmailFile(String emailFile) {
		this.emailFile = emailFile;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getEmailWastebasket() {
		return emailWastebasket;
	}

	public void setEmailWastebasket(String emailWastebasket) {
		this.emailWastebasket = emailWastebasket;
	}

	public String getEmailRead() {
		return emailRead;
	}

	public void setEmailRead(String emailRead) {
		this.emailRead = emailRead;
	}

	public String getEmailPosition() {
		return emailPosition;
	}

	public void setEmailPosition(String emailPosition) {
		this.emailPosition = emailPosition;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getRankCode() {
		return rankCode;
	}

	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	
	
	
}


