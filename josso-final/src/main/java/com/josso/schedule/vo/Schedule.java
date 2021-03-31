package com.josso.schedule.vo;

import java.util.Date;

public class Schedule {
	private String scheduleNumber;	// 일정번호
	private String scheduleTitle;	// 일정제목
	private String schedulePlace;	// 일정장소
	private String scheduleContent;	// 일정내용
	private String Attendee;		// 참석자
	private String scheduleStartDate;	// 일정시작날짜
	private String scheduleStartTime;	// 일정시작시간
	private String scheduleEndDate;	// 일정종료날짜
	private String scheduleEndTime;	// 일정종료시간
	
	public Schedule() {}

	public Schedule(String scheduleNumber, String scheduleTitle, String schedulePlace, String scheduleContent,
			String attendee, String scheduleStartDate, String scheduleStartTime, String scheduleEndDate,
			String scheduleEndTime) {
		this.scheduleNumber = scheduleNumber;
		this.scheduleTitle = scheduleTitle;
		this.schedulePlace = schedulePlace;
		this.scheduleContent = scheduleContent;
		Attendee = attendee;
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

	public String getScheduleStartDate() {
		return scheduleStartDate;
	}

	public void setScheduleStartDate(String scheduleStartDate) {
		this.scheduleStartDate = scheduleStartDate;
	}

	public String getScheduleStartTime() {
		return scheduleStartTime;
	}

	public void setScheduleStartTime(String scheduleStartTime) {
		this.scheduleStartTime = scheduleStartTime;
	}

	public String getScheduleEndDate() {
		return scheduleEndDate;
	}

	public void setScheduleEndDate(String scheduleEndDate) {
		this.scheduleEndDate = scheduleEndDate;
	}

	public String getScheduleEndTime() {
		return scheduleEndTime;
	}

	public void setScheduleEndTime(String scheduleEndTime) {
		this.scheduleEndTime = scheduleEndTime;
	}

	
	
}
