package com.josso.schedule.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.josso.schedule.vo.Schedule;

public interface ScheduleService {

	public List<Schedule> selectScheduleAll() throws Exception;
	
	public int insertSchedule(Schedule schedule) throws Exception;
	
}
