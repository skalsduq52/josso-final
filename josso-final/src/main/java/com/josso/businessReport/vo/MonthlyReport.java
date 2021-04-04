package com.josso.businessReport.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MonthlyReport {
	
	// 필드부
	private int reportNumber;				// 게시글 번호
	private String reportTitle;				// 제목
	private String writer;					// 작성자
	private Date writeTime;					// 작성시간
	
	@DateTimeFormat(pattern="yyyy-MM")
	private Date lastMonth;					// 지난 달
	private String lastQuantity;			// 지난 달 정량성과
	private String lastQuality;				// 지난 달 정성성과
	private String lastReason;				// 지난 달 성과근거
	private String lastSupplement;			// 보충할 점
	
	private Date thisMonth;					// 다음 달
	private String thisQuantity;			// 다음 달 정량성과
	private String thisQuality;				// 다음 달 정성성과
	private String thisReason;				// 다음 달 성과근거
	private String thisSupplement;			// 보충할 점
	
	// 조인을 위해 추가한 것
	private String employeeName;		// 사원이름
	private String departmentCode;		// 부서
	private String rankCode;			// 직위
	
	// 생성자
	public MonthlyReport() {}

	
	// 메서드
	public int getReportNumber() {
		return reportNumber;
	}

	public void setReportNumber(int reportNumber) {
		this.reportNumber = reportNumber;
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

	public Date getLastMonth() {
		return lastMonth;
	}

	public void setLastMonth(Date lastMonth) {
		this.lastMonth = lastMonth;
	}

	public String getLastQuantity() {
		return lastQuantity;
	}

	public void setLastQuantity(String lastQuantity) {
		this.lastQuantity = lastQuantity;
	}

	public String getLastQuality() {
		return lastQuality;
	}

	public void setLastQuality(String lastQuality) {
		this.lastQuality = lastQuality;
	}

	public String getLastReason() {
		return lastReason;
	}

	public void setLastReason(String lastReason) {
		this.lastReason = lastReason;
	}

	public String getLastSupplement() {
		return lastSupplement;
	}

	public void setLastSupplement(String lastSupplement) {
		this.lastSupplement = lastSupplement;
	}

	public Date getThisMonth() {
		return thisMonth;
	}

	public void setThisMonth(Date thisMonth) {
		this.thisMonth = thisMonth;
	}

	public String getThisQuantity() {
		return thisQuantity;
	}

	public void setThisQuantity(String thisQuantity) {
		this.thisQuantity = thisQuantity;
	}

	public String getThisQuality() {
		return thisQuality;
	}

	public void setThisQuality(String thisQuality) {
		this.thisQuality = thisQuality;
	}

	public String getThisReason() {
		return thisReason;
	}

	public void setThisReason(String thisReason) {
		this.thisReason = thisReason;
	}

	public String getThisSupplement() {
		return thisSupplement;
	}

	public void setThisSupplement(String thisSupplement) {
		this.thisSupplement = thisSupplement;
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


	@Override
	public String toString() {
		return String.format(
				"MonthlyReport [reportNumber=%s, reportTitle=%s, writer=%s, writeTime=%s, lastMonth=%s, lastQuantity=%s, lastQuality=%s, lastReason=%s, lastSupplement=%s, thisMonth=%s, thisQuantity=%s, thisQuality=%s, thisReason=%s, thisSupplement=%s, employeeName=%s, departmentCode=%s, rankCode=%s]",
				reportNumber, reportTitle, writer, writeTime, lastMonth, lastQuantity, lastQuality, lastReason,
				lastSupplement, thisMonth, thisQuantity, thisQuality, thisReason, thisSupplement, employeeName,
				departmentCode, rankCode);
	}
	
	



	
	



	
}
