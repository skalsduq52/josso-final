package com.josso.employee.controller.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
}
