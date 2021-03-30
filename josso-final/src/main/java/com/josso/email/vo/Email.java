package com.josso.email.vo;

import java.sql.Date;

public class Email {

	private String emailSend;
	private String emailAccept;
	private String emailReference;
	private String emailTitle;
	private String emailContent;
	private Date regDate;
	private String emailWastebasket;
	private String emailRead;
	private int emailNumber;
	private String emailPosition;
	
	public Email() {
		
	}
	public Email(String emailSend, String emailAccept, String emailReference, String emailTitle,
			String emailContent, Date regDate, String emailWastebasket, String emailRead, int emailNumber, String emailPosition) {
		super();
		this.emailSend = emailSend;
		this.emailAccept = emailAccept;
		this.emailReference = emailReference;
		this.emailTitle = emailTitle;
		this.emailContent = emailContent;
		this.regDate = regDate;
		this.emailWastebasket = emailWastebasket;
		this.emailRead = emailRead;
		this.emailNumber = emailNumber;
		this.emailPosition = emailPosition;
	}
			
	@Override
	public String toString() {
		return "Email [emailSend=" + emailSend + ", emailAccept=" + emailAccept + ", emailReference="
				+ emailReference + ", emailTitle=" + emailTitle + ", emailContent=" + emailContent + ", regDate="
				+ regDate + ", emailWastebasket=" + emailWastebasket + ", emailRead=" + emailRead + ", emailNumber=" + emailNumber + ", emailPosition=" + emailPosition +"]";
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
	public int getEmailNumber() {
		return emailNumber;
	}
	public void setEmailNuber(int emailNuber) {
		this.emailNumber = emailNumber;
	}
	public String getEmailPosition() {
		return emailPosition;
	}
	public void setEmailPosition(String emailPosition) {
		this.emailPosition = emailPosition;
	}
	
	
	
	
}


