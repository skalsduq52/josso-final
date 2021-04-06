package com.josso.electronicApproval.controller.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.electronicApproval.controller.model.dao.electronicApprovalDAO;
import com.josso.electronicApproval.vo.ElectView;
import com.josso.electronicApproval.vo.ElectronicApproval;
import com.josso.electronicApproval.vo.Paging;
import com.josso.employee.vo.Employee;

@Service
public class electronicApprovalServiceImpl implements electornicApprovalService {
	
	@Autowired
	electronicApprovalDAO ed;

	// 회원 정보 리스트 가져가는거
	@Override
	public List<Employee> selectEmpAll(Employee emp) throws Exception {
		List<Employee> empList = ed.selectEmpAll(emp);
		return empList;
	}

	// 회원 정보 한개 가져가기
	@Override
	public Employee selectEmpOne(String num) throws Exception {
		Employee emp = ed.selectEmpOne(num);
		return emp;
	}

	// 결재 등록
	@Override
	public void insertApp(ElectronicApproval ep) throws Exception {
		ed.insertApp(ep);
	}

	// 내가 기안한 문서 최근 3개 가져오기
	@Override
	public List<ElectronicApproval> selectLastMy(String empNo) throws Exception {
		List<ElectronicApproval> mySign = ed.selectLastMy(empNo);
		return mySign;
	}

	// 내가 기안한 문서 리스트 가져오기
	@Override
	public List<ElectView> selectMySign(Paging page) throws Exception {
		List<ElectView> elist = ed.selectMySign(page);
		return elist;
	}

	// 결재 대기중 문서 최근 3개 가져오기
	@Override
	public List<ElectView> selectLastWait(String empNo) throws Exception {
		List<ElectView> waitSign = ed.selectLastWait(empNo);
		return waitSign;
	}

	// 결재 대기중 문서 리스트 가져오기
	@Override
	public List<ElectView> selectWaitSign(Paging page) throws Exception {
		List<ElectView> elist = ed.selectWaitSign(page);
		return elist;
	}

	// 결재 수신문서 최근 3개 가져오기
	@Override
	public List<ElectView> selectLastReceive(String empNo) throws Exception {
		List<ElectView> receiveSign = ed.selectLastReceive(empNo);
		return receiveSign;
	}

	@Override
	public List<ElectView> selectReceiveSign(Paging page) throws Exception {
		List<ElectView> receiveList = ed.selectReceiveSign(page);
		return receiveList;
	}

	@Override
	public ElectView selectElecApp(String num) throws Exception {
		ElectView ev = ed.selectElecApp(num);
		return ev;
	}

	// 중간결재자 승인
	@Override
	public void middleAccept(String num) throws Exception {
		ed.middleAccept(num);
	}

	// 중간결재자 반려
	@Override
	public void middleReject(ElectronicApproval ep) throws Exception {
		ed.middleReject(ep);
	}

	// 최종결재자 승인
	@Override
	public void lastAccept(String num) throws Exception {
		ed.lastAccept(num);
	}

	// 최종결재자 반려
	@Override
	public void lastReject(String num) throws Exception {
		ed.lastReject(num);
	}

	// 최종결재자 승인시 연차 업데이트
	@Override
	public void dateUpdate(String num, String emno) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("num1", num);
		map.put("emno", emno);
		ed.dateUpdate(map);
	}

	// 
	@Override
	public Paging setPage(Paging page, String empNo, String type) throws Exception {
		page.setEmployeeNum(empNo);
		if(page.getTitle().equals("")) {
			page.setTitle("DOCUMENT_NAME");
		}
		switch(type) {
		case "wait" : page.setCount(ed.selectWaitCount(page));
			break;
		case "my" : page.setCount(ed.selectMyCount(page));
			break;
		case "receive" : page.setCount(ed.selectReceiveCount(page));
			break;
		}
		page.setStartNum(page.getPage());
		page.setLastNum(page.getCount());
		page.setStartRange(page.getPage());
		page.setEndRange(page.getPage());
		return page;
	}

}
