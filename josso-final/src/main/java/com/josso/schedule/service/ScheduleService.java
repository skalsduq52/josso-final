package com.josso.schedule.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.josso.employee.vo.Employee;
import com.josso.schedule.vo.Schedule;

public interface ScheduleService {
	
	// Schedule 전체 조회
	public List<Schedule> selectScheduleAll() throws Exception;
	
	// Schedule 등록
	public int insertSchedule(Schedule schedule) throws Exception;
	
	// 참석자 목록 조회
	public List<Employee> selectAttendeeAll() throws Exception;
	
	// Schedule 하나만 조회(상세 페이지)
	public Schedule selectSchedule(String scheduleNum) throws Exception;
	
	// Schedule 수정
	public int updateSchedule(Schedule schedule) throws Exception;
	
	// Schedule 삭제
	public int deleteSchedule(String scheduleNum) throws Exception;
}