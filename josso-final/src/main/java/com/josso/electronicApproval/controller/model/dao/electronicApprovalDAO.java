package com.josso.electronicApproval.controller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.electronicApproval.vo.ElectronicApproval;
import com.josso.employee.vo.Employee;

@Repository
public class electronicApprovalDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public electronicApprovalDAO() {};
	
	
	// 결재창 검색 ajax용
	public List<Employee> selectEmpAll(Employee emp) throws Exception {
		List<Employee> empList = sqlSession.selectList("Employee.serachEmpName",emp);
		return empList;
	}
	
	public Employee selectEmpOne(String num) throws Exception {
		Employee emp = sqlSession.selectOne("Employee.selectEmployee",num);
		return emp;
	}
	
	public int insertApp(ElectronicApproval ep) throws Exception {
		int result = sqlSession.insert("ElectronicApproval.insertElecApp",ep);
		return result;
	}
	
	public List<ElectronicApproval> selectLastMy(String empNo) throws Exception {
		List<ElectronicApproval> ml = sqlSession.selectList("ElectronicApproval.selectLastMy", empNo);
		return ml;
	}
	
	public ElectronicApproval selectElecApp(String num) throws Exception {
		ElectronicApproval ep = sqlSession.selectOne("ElectronicApproval.selectDetail", num);
		return ep;
	}
	
}