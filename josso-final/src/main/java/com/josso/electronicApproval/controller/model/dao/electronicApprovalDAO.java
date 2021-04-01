package com.josso.electronicApproval.controller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.electronicApproval.vo.ElectView;
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
	
	// 사원 한명 검색
	public Employee selectEmpOne(String num) throws Exception {
		Employee emp = sqlSession.selectOne("Employee.selectEmployee",num);
		return emp;
	}
	
	// 결재 등록
	public int insertApp(ElectronicApproval ep) throws Exception {
		int result = sqlSession.insert("ElectronicApproval.insertElecApp",ep);
		return result;
	}
	
	// 내가 기안한 문서 최근 3개
	public List<ElectronicApproval> selectLastMy(String empNo) throws Exception {
		List<ElectronicApproval> ml = sqlSession.selectList("ElectronicApproval.selectLastMy", empNo);
		return ml;
	}
	
	// 결재 대기중 문서 최근 3개
	public List<ElectView> selectLastWait(String empNo) throws Exception {
		List<ElectView> ev = sqlSession.selectList("ElectView.selectLastWait", empNo);
		return ev;
	}
	
	
	// 결재 상세보기
	public ElectView selectElecApp(String num) throws Exception {
		ElectView ev = sqlSession.selectOne("ElectView.selectDetail", num);
		return ev;
	}
	
	
	
}