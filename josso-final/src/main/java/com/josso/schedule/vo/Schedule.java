package com.josso.schedule.vo;

import java.util.Date;

public class Schedule {
	private String scheduleNumber;	// 일정번호
	private String scheduleTitle;	// 일정제목
	private String schedulePlace;	// 일정장소
	private String scheduleContent;	// 일정내용
	private String Attendee;		// 참석자
	private Date scheduleStartDate;	// 일정시작날짜
	private Date scheduleStartTime;	// 일정시작시간
	private Date scheduleEndDate;	// 일정종료날짜
	private Date scheduleEndTime;	// 일정종료시간
	
	public Schedule() {}

	public Schedule(String scheduleNumber, String scheduleTitle, String schedulePlace, String scheduleContent,
			String attendee, Date scheduleStartDate, Date scheduleStartTime, Date scheduleEndDate,
			Date scheduleEndTime) {
		this.scheduleNumber = scheduleNumber;
		this.scheduleTitle = scheduleTitle;
		this.schedulePlace = schedulePlace;
		this.scheduleContent = scheduleContent;
		this.Attendee = attendee;
		this.scheduleStartDate = scheduleStartDate;
		this.scheduleStartTime = scheduleStartTime;
		this.scheduleEndDate = scheduleEndDate;
		this.scheduleEndTime = scheduleEndTime;
	}

	public String getScheduleNumber() {
		return scheduleNumber;
	}

	public void setScheduleNumber(String scheduleNumber) {
		this.scheduleNumber = scheduleNumber;
	}

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	public String getSchedulePlace() {
		return schedulePlace;
	}

	public void setSchedulePlace(String schedulePlace) {
		this.schedulePlace = schedulePlace;
	}

	public String getScheduleContent() {
		return scheduleContent;
	}

	public void setScheduleContent(String scheduleContent) {
		this.scheduleContent = scheduleContent;
	}

	public String getAttendee() {
		return Attendee;
	}

	public void setAttendee(String attendee) {
		Attendee = attendee;
	}

	public Date getScheduleStartDate() {
		return scheduleStartDate;
	}

	public void setScheduleStartDate(Date scheduleStartDate) {
		this.scheduleStartDate = scheduleStartDate;
	}

	public Date getScheduleStartTime() {
		return scheduleStartTime;
	}

	public void setScheduleStartTime(Date scheduleStartTime) {
		this.scheduleStartTime = scheduleStartTime;
	}

	public Date getScheduleEndDate() {
		return scheduleEndDate;
	}

	public void setScheduleEndDate(Date scheduleEndDate) {
		this.scheduleEndDate = scheduleEndDate;
	}

	public Date getScheduleEndTime() {
		return scheduleEndTime;
	}

	public void setScheduleEndTime(Date scheduleEndTime) {
		this.scheduleEndTime = scheduleEndTime;
	}

	@Override
	public String toString() {
		return "Schedule [scheduleNumber=" + scheduleNumber + ", scheduleTitle=" + scheduleTitle + ", schedulePlace="
				+ schedulePlace + ", scheduleContent=" + scheduleContent + ", Attendee=" + Attendee
				+ ", scheduleStartDate=" + scheduleStartDate + ", scheduleStartTime=" + scheduleStartTime
				+ ", scheduleEndDate=" + scheduleEndDate + ", scheduleEndTime=" + scheduleEndTime + "]";
	}
}
