package com.josso.businessReport.vo;

import java.util.Date;

public class WeeklyReport {
	
	// 필드부
	private int reportNumber;				// 게시글 번호
	private String reportTitle;			// 제목
	private String writer;				// 작성자
	private Date writeTime;				// 작성시간
	
	private Date thisStart;				// 이번 주 시작날짜
	private Date thisEnd;				// 이번 주 종료날짜
	private String thisMeeting;			// 이번 주 미팅
	private String thisConference;		// 이번 주 회의
	private String thisProject;			// 이번 주 프로젝트
	private String thisEtc;				// 이번 주 기타사항
	
	private Date nextStart;				// 다음 주 시작날짜
	private Date nextEnd;				// 다음 주 종료날짜
	private String nextMeeting;			// 다음 주 미팅
	private String nextConference;		// 다음 주 회의
	private String nextProject;			// 다음 주 프로젝트
	private String nextEtc;				// 다음 주 기타사항
	
	// 생성자
	public WeeklyReport() {}

	// 메소드
	public int getReportSeq() {
		return reportNumber;
	}
	
	public void setReportSeq(int reportSeq) {
		this.reportNumber = reportSeq;
	}
	
	public String getReportTitle() {
		return reportTitle;
	}
	
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public Date getWriteTime() {
		return writeTime;
	}
	
	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}
	
	public Date getThisStart() {
		return thisStart;
	}
	
	public void setThisStart(Date thisStart) {
		this.thisStart = thisStart;
	}
	
	public Date getThisEnd() {
		return thisEnd;
	}
	
	public void setThisEnd(Date thisEnd) {
		this.thisEnd = thisEnd;
	}
	
	public String getThisMeeting() {
		return thisMeeting;
	}
	
	public void setThisMeeting(String thisMeeting) {
		this.thisMeeting = thisMeeting;
	}
	
	public String getThisConference() {
		return thisConference;
	}
	
	public void setThisConference(String thisConference) {
		this.thisConference = thisConference;
	}
	
	public String getThisProject() {
		return thisProject;
	}
	
	public void setThisProject(String thisProject) {
		this.thisProject = thisProject;
	}
	
	public String getThisEtc() {
		return thisEtc;
	}
	
	public void setThisEtc(String thisEtc) {
		this.thisEtc = thisEtc;
	}
	
	public Date getNextStart() {
		return nextStart;
	}
	
	public void setNextStart(Date nextStart) {
		this.nextStart = nextStart;
	}
	
	public Date getNextEnd() {
		return nextEnd;
	}
	
	public void setNextEnd(Date nextEnd) {
		this.nextEnd = nextEnd;
	}
	
	public String getNextMeeting() {
		return nextMeeting;
	}
	
	public void setNextMeeting(String nextMeeting) {
		this.nextMeeting = nextMeeting;
	}
	
	public String getNextConference() {
		return nextConference;
	}
	
	public void setNextConference(String nextConference) {
		this.nextConference = nextConference;
	}
	
	public String getNextProject() {
		return nextProject;
	}
	
	public void setNextProject(String nextProject) {
		this.nextProject = nextProject;
	}
	
	public String getNextEtc() {
		return nextEtc;
	}
	
	public void setNextEtc(String nextEtc) {
		this.nextEtc = nextEtc;
	}
	
	
	
}
