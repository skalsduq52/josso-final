package com.josso.electronicApproval.vo;

import java.util.Date;

public class ElectronicApproval {

	private int documentNo;
	private String documentForm;
	private String documentName;
	private Date registerDate;
	private Date startDate;
	private Date endDate;
	private String drafter;
	private String drafterAccept;
	private String middle;
	private String middleAccept;
	private String last;
	private String lastAccept;
	
	public ElectronicApproval() {}

	public ElectronicApproval(int documentNo, String documentForm, String documentName, Date registerDate,
			Date startDate, Date endDate, String drafter, String drafterAccept, String middle, String middleAccept,
			String last, String lastAccept) {
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
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

	@Override
	public String toString() {
		return "ElectronicApproval [documentNo=" + documentNo + ", documentForm=" + documentForm + ", documentName="
				+ documentName + ", registerDate=" + registerDate + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", drafter=" + drafter + ", drafterAccept=" + drafterAccept + ", middle=" + middle + ", middleAccept="
				+ middleAccept + ", last=" + last + ", lastAccept=" + lastAccept + "]";
	}
	
	
	
	

}
