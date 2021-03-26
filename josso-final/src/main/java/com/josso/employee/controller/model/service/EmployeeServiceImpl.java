package com.josso.employee.controller.model.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.employee.controller.model.dao.EmployeeDao;
import com.josso.employee.vo.Employee;


@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	EmployeeDao employeeDao;
	
	@Override
	public List<Employee> selectEmployeeAll() throws Exception{
		List<Employee> employeeList = employeeDao.selectEmployeeAll();
		return employeeList;
	}
	@Override
	public Employee selectEmployee(String employeeNumber) throws Exception{
		Employee employee = employeeDao.selectEmployee(employeeNumber);
		return employee;
	}
	
	@Override
	public void checkEmployeeNumber(String employeeNumber, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.println(employeeDao.checkEmployeeNumber(employeeNumber));
		out.close();
	}
	
	@Override
	public void checkEmployeeEmail(String employeeEmail, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.println(employeeDao.checkEmployeeEmail(employeeEmail));
		out.close();
		
	}
	
	@Override
	public int insertEmployee(Employee employee) throws Exception{
//		PrintWriter out = response.getWriter();
//		
//		if(employeeDao.checkEmployeeNumber(employee.getEmployeeNumber())==1) {
//			out.println("<script>");
//			out.println("alert('동일한 사원번호가 존재합니다.');");
//			out.println("history.go(-1);");
//			out.println("</script>");
//			out.close();
//			return 0;
//		}else if(employeeDao.checkEmployeeEmail(employee.getEmployeeEmail())==1) {
//			out.println("<script>");
//			out.println("alert('동일한 이메일이 존재합니다.');");
//			out.println("history.go(-1);");
//			out.println("</script>");
//			out.close();
//			return 0;
//		}else {
		int cnt = employeeDao.insertEmployee(employee);
		return cnt;
//		}
		
	}
	@Override
	public int updateEmployee(Employee employee) throws Exception{
		int cnt = employeeDao.updateEmployee(employee);
		return cnt;
		
	}
	@Override
	public int deleteEmployee(Employee employee) throws Exception{
		int cnt = employeeDao.deleteEmployee(employee);
		return cnt;
		
	}
	
	@Override
	public Employee login(Employee employee, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//등록된 아이디가 없을경우
		if(employeeDao.checkEmployeeNumber(employee.getEmployeeNumber())==0) {
			out.println("<script>");
			out.println("alert('등록된 사원번호가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			String employeePassword = employee.getEmployeePassword();
			employee = employeeDao.login(employee.getEmployeeNumber());
			System.out.println(employee.getEmployeePassword());
			// 비밀번호가 다를 경우
			if(!employee.getEmployeePassword().equals(employeePassword)) {
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}else {
				employeeDao.updateLogDate(employee.getEmployeeNumber());
				return employee;
			}
		}
	}
	
	

}
