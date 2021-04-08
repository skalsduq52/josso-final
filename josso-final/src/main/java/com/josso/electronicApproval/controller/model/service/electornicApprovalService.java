package com.josso.electronicApproval.controller.model.service;

import java.util.HashMap;
import java.util.List;

import com.josso.electronicApproval.vo.ElectView;
import com.josso.electronicApproval.vo.ElectronicApproval;
import com.josso.electronicApproval.vo.Paging;
import com.josso.employee.vo.Employee;

public interface electornicApprovalService {

	// 사원 데이터 가져오기
	public List<Employee> selectEmpAll(Employee emp) throws Exception;
		
	// 사원 한명 검색
	public Employee selectEmpOne(String num) throws Exception;
		
	// 결재 등록
	public void insertApp(ElectronicApproval ep) throws Exception;
		
	// 내가 기안한 문서 최근 3개
	public List<ElectronicApproval> selectLastMy(String empNo) throws Exception;
		
	// 내가 기안한 문서 리스트
	public List<ElectView> selectMySign(Paging page) throws Exception;
		
	// 결재 대기중 문서 최근 3개
	public List<ElectView> selectLastWait(String empNo) throws Exception;
		
	// 결재 대기중 문서 리스트
	public List<ElectView> selectWaitSign(Paging page) throws Exception;
		
	// 결재 수신 문서 최근 3개
	public List<ElectView> selectLastReceive(String empNo) throws Exception;
		
	// 결재 수신 문서 리스트
	public List<ElectView> selectReceiveSign(Paging page) throws Exception;
		
	// 결재 상세보기
	public ElectView selectElecApp(String num) throws Exception;
		
	// 중간결재 승인
	public void middleAccept(String num) throws Exception;
		
	// 중간결재 반려
	public void middleReject(ElectronicApproval ep) throws Exception;
		
	// 최종결재 승인
	public void lastAccept(String num) throws Exception;
		
	// 최종결재 반려
	public void lastReject(ElectronicApproval ep) throws Exception;
		
	// 최종결재 하면 연차 차감
	public void dateUpdate(String num, String emno) throws Exception;
		
	// 페이징 셋팅
	public Paging setPage(Paging page, String empNo, String type) throws Exception;

}
