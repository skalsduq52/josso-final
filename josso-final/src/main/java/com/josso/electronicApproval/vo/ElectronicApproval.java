package com.josso.electronicApproval.vo;

import java.util.Date;

public class ElectronicApproval {

	private int rowNum;
	private int documentNo;
	private String documentForm;
	private String documentName;
	private Date registerDate;
	private String startDate;
	private String endDate;
	private String drafter;
	private String drafterAccept;
	private String middle;
	private String middleAccept;
	private String last;
	private String lastAccept;
	private String attachedFile;
	private String holyType;
	private Date middleAcceptDate;
	private Date lastAcceptDate;
	private String rejecter;
	private String rejectComment;
	
	public ElectronicApproval() {}

	public ElectronicApproval(int rowNum, int documentNo, String documentForm, String documentName, Date registerDate,
			String startDate, String endDate, String drafter, String drafterAccept, String middle, String middleAccept,
			String last, String lastAccept, String attachedFile, String holyType, Date middleAcceptDate,
			Date lastAcceptDate, String rejecter, String rejectComment) {
		this.rowNum = rowNum;
		this.documentNo = documentNo;
		this.documentForm = documentForm;
		this.documentName = documentName;
		this.registerDate = registerDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.drafter = drafter;
		this.drafterAccept = drafterAccept;
		this.middle = middle;
		this.middleAccept = middleAccept;
		this.last = last;
		this.lastAccept = lastAccept;
		this.attachedFile = attachedFile;
		this.holyType = holyType;
		this.middleAcceptDate = middleAcceptDate;
		this.lastAcceptDate = lastAcceptDate;
		this.rejecter = rejecter;
		this.rejectComment = rejectComment;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(int documentNo) {
		this.documentNo = documentNo;
	}

	public String getDocumentForm() {
		return documentForm;
	}


	public void setDocumentForm(String documentForm) {
		this.documentForm = documentForm;
	}


	public String getDocumentName() {
		return documentName;
	}


	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}


	public Date getRegisterDate() {
		return registerDate;
	}


	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getDrafter() {
		return drafter;
	}


	public void setDrafter(String drafter) {
		this.drafter = drafter;
	}


	public String getDrafterAccept() {
		return drafterAccept;
	}


	public void setDrafterAccept(String drafterAccept) {
		this.drafterAccept = drafterAccept;
	}


	public String getMiddle() {
		return middle;
	}


	public void setMiddle(String middle) {
		this.middle = middle;
	}


	public String getMiddleAccept() {
		return middleAccept;
	}


	public void setMiddleAccept(String middleAccept) {
		this.middleAccept = middleAccept;
	}


	public String getLast() {
		return last;
	}


	public void setLast(String last) {
		this.last = last;
	}


	public String getLastAccept() {
		return lastAccept;
	}


	public void setLastAccept(String lastAccept) {
		this.lastAccept = lastAccept;
	}


	public String getAttachedFile() {
		return attachedFile;
	}


	public void setAttachedFile(String attachedFile) {
		this.attachedFile = attachedFile;
	}


	public String getHolyType() {
		return holyType;
	}


	public void setHolyType(String holyType) {
		this.holyType = holyType;
	}


	public Date getMiddleAcceptDate() {
		return middleAcceptDate;
	}


	public void setMiddleAcceptDate(Date middleAcceptDate) {
		this.middleAcceptDate = middleAcceptDate;
	}


	public Date getLastAcceptDate() {
		return lastAcceptDate;
	}


	public void setLastAcceptDate(Date lastAcceptDate) {
		this.lastAcceptDate = lastAcceptDate;
	}


	public String getRejecter() {
		return rejecter;
	}


	public void setRejecter(String rejecter) {
		this.rejecter = rejecter;
	}


	public String getRejectComment() {
		return rejectComment;
	}


	public void setRejectComment(String rejectComment) {
		this.rejectComment = rejectComment;
	}

	@Override
	public String toString() {
		return "ElectronicApproval [rowNum=" + rowNum + ", documentNo=" + documentNo + ", documentForm=" + documentForm
				+ ", documentName=" + documentName + ", registerDate=" + registerDate + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", drafter=" + drafter + ", drafterAccept=" + drafterAccept + ", middle="
				+ middle + ", middleAccept=" + middleAccept + ", last=" + last + ", lastAccept=" + lastAccept
				+ ", attachedFile=" + attachedFile + ", holyType=" + holyType + ", middleAcceptDate=" + middleAcceptDate
				+ ", lastAcceptDate=" + lastAcceptDate + ", rejecter=" + rejecter + ", rejectComment=" + rejectComment
				+ "]";
	}
	
}