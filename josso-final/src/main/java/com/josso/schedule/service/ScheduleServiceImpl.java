package com.josso.schedule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.schedule.model.dao.ScheduleDao;
import com.josso.schedule.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	ScheduleDao sd;
	
	@Override
	public int insertSchedule(Schedule schedule) throws Exception {

		int result = sd.scheduleRegister(schedule);
		
		return result;
	}
	
}
