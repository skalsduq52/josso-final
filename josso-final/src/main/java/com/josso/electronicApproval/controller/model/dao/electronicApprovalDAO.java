package com.josso.electronicApproval.controller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.employee.vo.Employee;

@Repository
public class electronicApprovalDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public electronicApprovalDAO() {};
	
	public List<Employee> selectEmpAll(Employee emp) throws Exception {
		List<Employee> empList = sqlSession.selectList("Employee.serachEmpName",emp);
		return empList;
	}
	
	
	
}
