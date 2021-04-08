package com.josso.electronicApproval.controller.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.electronicApproval.vo.ElectView;
import com.josso.electronicApproval.vo.ElectronicApproval;
import com.josso.electronicApproval.vo.Paging;
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
	public void insertApp(ElectronicApproval ep) throws Exception {
		int result = sqlSession.insert("ElectronicApproval.insertElecApp",ep);
	}
	
	// 내가 기안한 문서 최근 3개
	public List<ElectronicApproval> selectLastMy(String empNo) throws Exception {
		List<ElectronicApproval> ml = sqlSession.selectList("ElectronicApproval.selectLastMy", empNo);
		return ml;
	}
	
	// 내가 기안한 문서 리스트
	public List<ElectView> selectMySign(Paging page) throws Exception {
		List<ElectView> ev = sqlSession.selectList("ElectView.selectMySign", page);
		return ev;
	}
	
	// 결재 대기중 문서 최근 3개
	public List<ElectView> selectLastWait(String empNo) throws Exception {
		List<ElectView> ev = sqlSession.selectList("ElectView.selectLastWait", empNo);
		return ev;
	}
	
	// 결재 대기중 문서 리스트
	public List<ElectView> selectWaitSign(Paging page) throws Exception {
		List<ElectView> ev = sqlSession.selectList("ElectView.selectWaitSign", page);
		return ev;
	}
	
	// 결재 수신 문서 최근 3개
	public List<ElectView> selectLastReceive(String empNo) throws Exception {
		List<ElectView> ev = sqlSession.selectList("ElectView.selectLastRecive", empNo);
		return ev;
	}
	
	// 결재 수신 문서 리스트
	public List<ElectView> selectReceiveSign(Paging page) throws Exception {
		List<ElectView> ev = sqlSession.selectList("ElectView.selectReciveSign", page);
		return ev;
	}
	
	// 결재 상세보기
	public ElectView selectElecApp(String num) throws Exception {
		ElectView ev = sqlSession.selectOne("ElectView.selectDetail", num);
		return ev;
	}
	
	// 중간결재 승인
	public void middleAccept(String num) throws Exception {
		sqlSession.update("ElectronicApproval.middleAccept",num);
	}
	
	// 중간결재 반려
	public void middleReject(ElectronicApproval ep) throws Exception {
		sqlSession.update("ElectronicApproval.middleReject",ep);
	}
	
	// 최종결재 승인
	public void lastAccept(String num) throws Exception {
		sqlSession.update("ElectronicApproval.lastAccept",num);
	}
	
	// 최종결재 반려
	public void lastReject(ElectronicApproval ep) throws Exception {
		sqlSession.update("ElectronicApproval.lastReject",ep);
	}
	
	// 최종결재 하면 연차 차감
	public void dateUpdate(HashMap<String, String> map) throws Exception {
		sqlSession.update("ElectronicApproval.dateUpdate",map);
	}
	
	// 결재 대기문서용 카운트
	public int selectWaitCount(Paging pg) throws Exception {
		int count = sqlSession.selectOne("ElectronicApproval.selectWaitCount", pg);
		return count;
	}
	
	// 내가 기안한문서용 카운트
	public int selectMyCount(Paging pg) throws Exception {
		int count = sqlSession.selectOne("ElectronicApproval.selectMyCount", pg);
		return count;
	}
	
	// 결재 수신문서용 카운트
	public int selectReceiveCount(Paging pg) throws Exception {
		int count = sqlSession.selectOne("ElectronicApproval.selectReceiveCount", pg);
		return count;
	}
}