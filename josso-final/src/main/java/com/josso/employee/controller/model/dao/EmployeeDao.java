package com.josso.employee.controller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.josso.employee.vo.Employee;



@Repository	//DAO에 쓰이는 annotation으로 @Controller와 유사하게 class를 자동으로 생성
public class EmployeeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public EmployeeDao() {}
	
	// 전체 사원 조회
	public List<Employee> selectEmployeeAll() throws Exception{
		List<Employee> EmployeeList = sqlSession.selectList("Employee.selectEmployeeAll");
		return EmployeeList;
	}
	
	// 사원 한명 조회
	public Employee selectEmployee(String employeeNumber) throws Exception{
		Employee employee = sqlSession.selectOne("Employee.selectEmployee", employeeNumber);
		return employee;
	}
	
	// 사원번호 중복 검사
	public int checkEmployeeNumber(String employeeNumber) throws Exception{
		return sqlSession.selectOne("Employee.checkEmployeeNumber", employeeNumber);		
	}
	
	// 이메일 중복 검사
	public int checkEmployeeEmail(String employeeEmail) throws Exception{
		return sqlSession.selectOne("Employee.checkEmployeeEmail", employeeEmail);
	}
	
	// 사원 등록
	public int insertEmployee(Employee employee) throws Exception {
		int cnt = sqlSession.insert("Employee.insertEmployee", employee);
		
		return cnt;
		
	}
	
	// 사원 정보 수정
	public int updateEmployee(Employee employee)throws Exception {
		int cnt = sqlSession.update("Employee.updateEmployee", employee);
		return cnt;
	}
	
	// 사원 삭제
	public int deleteEmployee(Employee employee) throws Exception{
		int cnt = sqlSession.delete("Employee.deleteEmployee", employee);
		
		return cnt;
	}
		
	//로그인 검사
	@Transactional
	public Employee login(String employeeNumber) throws Exception{
		System.out.println("employee.getEmployeeNumber() dao:"+employeeNumber);
		return sqlSession.selectOne("Employee.login", employeeNumber);
	}
	//로그인 접속일자 변경
	@Transactional
	public int updateLogDate(String employeeNumber) throws Exception{
		return sqlSession.update("Employee.updateLogDate", employeeNumber);
	}
}