package com.josso.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.employee.vo.Employee;
import com.josso.schedule.model.dao.ScheduleDao;
import com.josso.schedule.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	ScheduleDao sd;
	
	// Schedule 전체 조회
	@Override
	public List<Schedule> selectScheduleAll() throws Exception{
		
		List<Schedule> scheduleList = sd.selectScheduleAll();
		
		return scheduleList;
	}
	
	// Schedule 등록
	@Override
	public int insertSchedule(Schedule schedule) throws Exception {

		int result = sd.insertSchedule(schedule);
		
		return result;
	}
	
	// 참석자 목록 조회
	@Override
	public List<Employee> selectAttendeeAll() throws Exception{
		
		List<Employee> ep = sd.selectAttendeeAll();
		
		return ep; 
	}
	
	// Schedule 하나만 조회(상세 페이지)
	@Override
	public Schedule selectSchedule(String scheduleNum) throws Exception{
		
		Schedule sc = sd.selectSchedule(scheduleNum);
		
		return sc;
	}
	
	// Schedule 수정
	@Override
	public int updateSchedule(Schedule schedule) throws Exception{
		
		int result = sd.updateSchedule(schedule);
		
		return result;
	}
	
	// Schedule 삭제
	@Override
	public int deleteSchedule(String scheduleNum) throws Exception{
		
		int result = sd.deleteSchedule(scheduleNum);
		
		return result;
	}
}
