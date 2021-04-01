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
	
	@Override
	public List<Schedule> selectScheduleAll() throws Exception{
		
		List<Schedule> scheduleList = sd.selectScheduleAll();
		
		return scheduleList;
	}
	
	@Override
	public int insertSchedule(Schedule schedule) throws Exception {

		int result = sd.scheduleRegister(schedule);
		
		return result;
	}
	
	@Override
	public List<Employee> selectAttendeeAll() throws Exception{
		
		List<Employee> ep = sd.selectAttendeeAll();
		
		return ep; 
	}
	
}
