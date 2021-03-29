package com.josso.schedule.service;

import org.springframework.stereotype.Service;

import com.josso.schedule.vo.Schedule;

public interface ScheduleService {

	public int insertSchedule(Schedule schedule) throws Exception;
	
}
