package com.josso.electronicApproval.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.josso.electronicApproval.controller.model.dao.electronicApprovalDAO;
import com.josso.electronicApproval.controller.model.service.electronicApprovalServiceImpl;
import com.josso.electronicApproval.vo.ElectView;
import com.josso.electronicApproval.vo.ElectronicApproval;
import com.josso.electronicApproval.vo.Paging;
import com.josso.employee.vo.Employee;

@Controller
public class ElectronicController {
	
	@Autowired
	electronicApprovalServiceImpl es;
	
	// 결재 메인페이지
	@RequestMapping(value="elecApproval", method=RequestMethod.GET)
	public ModelAndView approvalMain(ElectronicApproval ep, ModelAndView mv, HttpSession session) throws Exception {
		Employee emp = (Employee) session.getAttribute("employee");
		String empNo = emp.getEmployeeNumber();
		List<ElectronicApproval> mySign = es.selectLastMy(empNo);
		List<ElectView> waitSign = es.selectLastWait(empNo);
		List<ElectView> receiveSign = es.selectLastReceive(empNo);
		mv.addObject("waitSign",waitSign);
		mv.addObject("mySign", mySign);
		mv.addObject("receiveSign", receiveSign);
		mv.addObject("emp",emp);
		mv.setViewName("/electronicApproval/electronicApprovalMain");
		return mv;
	}
	
	// 결재 대기문서 눌렀을 때
	@RequestMapping(value="elecApproval/waiting", method=RequestMethod.GET)
	public ModelAndView approvalWaiting(ModelAndView mv, Paging page, HttpSession session) throws Exception {
		Employee emp = (Employee) session.getAttribute("employee");
		String empNo = emp.getEmployeeNumber();
		page = es.setPage(page,empNo,"wait");
		List<ElectView> elist = es.selectWaitSign(page);
		mv.addObject("waitList",elist);
		mv.addObject("page",page);
		mv.setViewName("/electronicApproval/waitingSign");
		return mv;
	}
	
	// 결재 수신문서 눌렀을 때
	@RequestMapping(value="elecApproval/receive", method=RequestMethod.GET)
	public ModelAndView approvalReceive(ModelAndView mv, Paging page, HttpSession session) throws Exception {
		Employee emp = (Employee) session.getAttribute("employee");
		String empNo = emp.getEmployeeNumber();
		page = es.setPage(page,empNo,"receive");
		List<ElectView> receive = es.selectReceiveSign(page);
		mv.addObject("receiveList",receive);
		mv.addObject("page",page);
		mv.setViewName("/electronicApproval/receiveSign");
		return mv;
	}
	
	// 내가 기안한 문서 눌렀을 때
	@RequestMapping(value="elecApproval/my", method=RequestMethod.GET)
	public ModelAndView approvalMy(ModelAndView mv, HttpSession session, Paging page) throws Exception {
		Employee emp = (Employee) session.getAttribute("employee");
		String empNo = emp.getEmployeeNumber();
		page = es.setPage(page,empNo,"my");
		List<ElectView> elist = es.selectMySign(page);
		mv.addObject("myList",elist);
		mv.addObject("page",page);
		mv.setViewName("/electronicApproval/mySign");
		return mv;
	}
	
	// 결재 진행시 넘어가는 페이지
	@RequestMapping(value="elecApproval/signing", method=RequestMethod.POST)
	public ModelAndView approvalSigning(@RequestParam(name = "middle") String middle,
										@RequestParam(name = "middlename") String middleName,
										@RequestParam(name = "middlenum") String middleNum,
										@RequestParam(name = "last") String last,
										@RequestParam(name = "lastname") String lastName,
										@RequestParam(name = "lastnum") String lastNum, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		Employee emp = (Employee) session.getAttribute("employee");
		Date date = new Date(System.currentTimeMillis());
		int usedHoly = 16-emp.getEmployeeAnnualLeave();
		mv.addObject("emp",emp);
		mv.addObject("middle",middle);
		mv.addObject("middleName",middleName);
		mv.addObject("middlenum",middleNum);
		mv.addObject("last",last);
		mv.addObject("lastName",lastName);
		mv.addObject("lastnum",lastNum);
		mv.addObject("date",date);
		mv.addObject("used",usedHoly);
		mv.setViewName("/electronicApproval/signing");
		return mv;
	}
	
	// 이름 검색하는 ajax
	@RequestMapping(value="elecApproval/serachName", method=RequestMethod.POST)
	public void approvalSearch(Employee emp, HttpServletResponse response) throws Exception {
		System.out.println(emp.getEmployeeName());
		List<Employee> empList = es.selectEmpAll(emp);
			// 전송용 최종 json 객체
			 JSONObject sendJson = new JSONObject();
			 // JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
			 JSONArray empArray = new JSONArray();
			 
			 for(Employee employee : empList){
				 //user 정보 저장할 json 객체 선언
				 JSONObject em = new JSONObject();
				 em.put("dCode", employee.getDepartmentCode());
				 em.put("rCode", employee.getRankCode());
				 em.put("name", employee.getEmployeeName());
				 em.put("empNo", employee.getEmployeeNumber());
				 empArray.add(em);
			}
			 sendJson.put("list", empArray);
			 response.setContentType("application/json; charset=utf-8");
			 PrintWriter out = response.getWriter();
			 out.println(sendJson.toJSONString());
			 out.flush();
			 out.close();
	}
	
	// 결재 등록
	@RequestMapping(value="elecApproval/insert", method=RequestMethod.POST)
	public ModelAndView insertApp(ElectronicApproval ep, ModelAndView mv) throws Exception {
		es.insertApp(ep);
		mv.setViewName("redirect:/elecApproval");
		return mv;
	}
	
	// 결재 상세보기
	@RequestMapping(value="elecApproval/signdetail", method=RequestMethod.GET)
	public ModelAndView detailSign(@RequestParam(name = "num") String num, ModelAndView mv) throws Exception {
		ElectView ev = es.selectElecApp(num);
		Employee drafter = es.selectEmpOne(ev.getDrafter());
		Employee middle = es.selectEmpOne(ev.getMiddle());
		Employee last = es.selectEmpOne(ev.getLast());
		int usedHoly = 16-drafter.getEmployeeAnnualLeave();
		mv.addObject("ev",ev);
		mv.addObject("drafter", drafter);
		mv.addObject("middle", middle);
		mv.addObject("last", last);
		mv.addObject("used", usedHoly);
		mv.setViewName("/electronicApproval/signDetail");
		return mv;
	}
	
	// 중간결재자 승인
	@RequestMapping(value="elecApproval/middleAccept", method=RequestMethod.GET)
	public ModelAndView middleAccept(@RequestParam(name="num") String num, ModelAndView mv) throws Exception {
		es.middleAccept(num);
		mv.addObject("num",num);
		mv.setViewName("redirect:/elecApproval/signdetail");
		return mv;
	}
	
	// 중간결재자 반려
	@RequestMapping(value="elecApproval/middleReject", method=RequestMethod.POST)
	public void middleReject(ElectronicApproval ep, HttpServletResponse response) throws Exception {
		es.middleReject(ep);
		PrintWriter out = response.getWriter();
		out.println("1");
		out.flush();
		out.close();
	}
	
	// 최종결재자 승인
	@RequestMapping(value="elecApproval/lastAccept", method=RequestMethod.GET)
	public ModelAndView lastAccept(@RequestParam(name="num") String num,@RequestParam(name="num1") String num1,
			@RequestParam(name="emno") String emno, ModelAndView mv) throws Exception {
		es.lastAccept(num);
		es.dateUpdate(num1, emno);
		mv.addObject("num",num);
		mv.setViewName("redirect:/elecApproval/signdetail");
		return mv;
	}
	
	// 최종결재자 반려
	@RequestMapping(value="elecApproval/lastReject", method=RequestMethod.POST)
	public void lastReject(ElectronicApproval ep, HttpServletResponse response) throws Exception {
		es.lastReject(ep);
		PrintWriter out = response.getWriter();
		out.println("1");
		out.flush();
		out.close();
	}
	
	// 반려코멘트
	@RequestMapping(value="elecApproval/rejectComment", method=RequestMethod.POST)
	public void rejectComment (@RequestParam("documentNo") String no, HttpServletResponse response) throws Exception {
		ElectView ev = es.selectElecApp(no);
		if(ev.getRejecter() != null) {
		Employee emp = es.selectEmpOne(ev.getRejecter());
		JSONObject sendJson = new JSONObject();
		sendJson.put("rejecter", emp.getEmployeeName());
		sendJson.put("rankCode", emp.getRankCode());
		sendJson.put("departmentCode", emp.getDepartmentCode());
		sendJson.put("rejectComment", ev.getRejectComment());
		sendJson.put("middleAccept", ev.getMiddleAccept());
		sendJson.put("lastAccept", ev.getLastAccept());
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
		}else {
		System.out.println("hi");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("1");
		out.flush();
		out.close();
		}
	}
	
	
}