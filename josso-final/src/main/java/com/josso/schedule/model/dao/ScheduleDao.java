package com.josso.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.schedule.vo.Schedule;

@Repository
public class ScheduleDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ScheduleDao() {
		// TODO Auto-generated constructor stub
	}
	
	public int scheduleRegister(Schedule schedule) throws Exception{
		
		int result = sqlSession.insert("Schedule.scheduleRegister", schedule);
		
		return result;
	}
}
