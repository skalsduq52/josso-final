package com.josso.employee.controller.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.josso.employee.vo.Employee;



public interface EmployeeService {

		public List<Employee> selectEmployeeAll() throws Exception;
		
		public Employee selectEmployee(String employeeNumber) throws Exception;
		
		public void checkEmployeeNumber(String employeeNumber, HttpServletResponse response) throws Exception;
		
		public void checkEmployeeEmail(String employeeEmail, HttpServletResponse response) throws Exception;
		
		public int insertEmployee(Employee employee) throws Exception;
		
		public int updateEmployee(Employee employee) throws Exception;
		
		public int deleteEmployee(Employee employee) throws Exception;
		
		public Employee login(Employee employee, HttpServletResponse response) throws Exception;
		
		public void logout(HttpServletResponse response) throws Exception;
		
		public String findEmployeeNumber(HttpServletResponse response, String employeeEmail) throws Exception;

		public void regist(Employee employee) throws Exception;
		
		public Employee userAuthKey(String authkey) throws Exception;
}
