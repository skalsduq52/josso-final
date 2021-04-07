package com.josso.schedule.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.employee.vo.Employee;
import com.josso.schedule.vo.Schedule;

@Repository
public class ScheduleDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ScheduleDao() {
		// TODO Auto-generated constructor stub
	}
	
	// Schedule 전체 조회
	public List<Schedule> selectScheduleAll() throws Exception{
		
		List<Schedule> scheduleListAll = sqlSession.selectList("Schedule.selectScheduleAll");
		
		return scheduleListAll;
	}
	
	// Schedule 팀 조회
	public List<Schedule> selectScheduleTeam(String empDeptCode) throws Exception{
		
		List<Schedule> scheduleListTeam = sqlSession.selectList("Schedule.selectScheduleTeam", empDeptCode);
		
		return scheduleListTeam;
	}
	
	// Schedule 나만 조회
	public List<Schedule> selectScheduleMe(String empNum) throws Exception{
		
		List<Schedule> scheduleListMe = sqlSession.selectList("Schedule.selectScheduleMe", empNum);
		
		return scheduleListMe;
	}
	
	// Schedule 등록
	public int insertSchedule(Schedule schedule) throws Exception{
		
		int result = sqlSession.insert("Schedule.insertSchedule", schedule);
		
		return result;
	}
	
	// 참석자 목록 조회
	public List<Employee> selectAttendeeAll() throws Exception{
		
		List<Employee> ep = sqlSession.selectList("Employee.selectEmployeePart");
		
		return ep;
	}
	
	// Schedule 하나만 조회(상세 페이지)
	public Schedule selectSchedule(String scheduleNum) throws Exception{
		
		Schedule sc = sqlSession.selectOne("Schedule.selectSchedule", scheduleNum);
		
		return sc;
	}
	
	// Schedule 수정
	public int updateSchedule(Schedule schedule) throws Exception{
		
		int result = sqlSession.update("Schedule.updateSchedule", schedule);
		
		return result;
	}
	
	// Schedule 삭제
	public int deleteSchedule(String scheduleNum) throws Exception{
		
		int result = sqlSession.delete("Schedule.deleteSchedule", scheduleNum);
		
		return result;
	}
}