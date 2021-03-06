package com.josso.email.controller;

import java.util.List;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.josso.email.service.EmailService;
import com.josso.email.vo.Email;
import com.josso.email.vo.EmailPaging;
import com.josso.employee.vo.Employee;


@Controller
public class EmailController{
	
	@Autowired
	private EmailService emailService;
 
	// /* ------------------------------받은 메일함------------------------------- */
	// 받은메일함 목록 보여주기
	@RequestMapping(value = "email/accept/list", method = RequestMethod.GET)
	public ModelAndView acceptList(ModelAndView modelAndView, EmailPaging page, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");	// 로그인 후 세션에서 정보 받아오기
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);			// 휴지통 - 전체 메일 수 
		int acceptCount = emailService.acceptCount(id);						// 받은메일함 - 전체메일 수
		int emailCount = emailService.emailCount(id);						// 받은메일함 - 안읽은 메일 수
		page.setEmployeeEmail(employee.getEmployeeEmail());					// 이메일 값 
		if(page.getTitle().equals("")) {
			page.setTitle("EMAIL_TITLE");
		}
		page.setCount(acceptCount);											// page VO에 값 세팅
		page.setStartNum(page.getPage());									// page VO에 값 세팅
		page.setLastNum(page.getCount());									// page VO에 값 세팅
		page.setStartRange(page.getPage());									// page VO에 값 세팅
		page.setEndRange(page.getPage());									// page VO에 값 세팅
		List<Email> acceptList = emailService.AcceptList(page);				// 받은 메일함 리스트 출력
		modelAndView.addObject("wastebasketCount",wastebasketCount);		// 휴지통 메일 전체 수
		modelAndView.addObject("emailCount",emailCount);					// 받은메일함 메일 전체 수
		modelAndView.addObject("acceptList", acceptList);					// 받은 메일 출력
		modelAndView.addObject("page", page);								
		modelAndView.setViewName("email/part/aside");
		modelAndView.setViewName("email/acceptList");
		return modelAndView;
	}
	
	// 받은메일함 - 자세히보기 - 답장버튼 클릭
	@RequestMapping(value = "email/accept/reply", method = RequestMethod.GET)
	public ModelAndView eply(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		Email es = emailService.Es(num);	// 보낸사람 정보
		System.out.println("es"+es);
		modelAndView.addObject("es",es);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		Email acceptReply = emailService.AcceptReply(num);
		modelAndView.addObject("acceptReply",acceptReply);
		modelAndView.setViewName("email/acceptReply");
		return modelAndView;
	}
	
	// 받은메일함 - 답장보내기버튼 클릭
	@RequestMapping(value = "email/accept/replySend", method = RequestMethod.GET)
	public ModelAndView acceptReplySend(Email email, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		int writeSend = emailService.WriteSend(email);
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}
	
	// 받은메일함 - 자세히 보기 - 전달버튼 클릭시
	@RequestMapping(value = "email/accept/delivery", method = RequestMethod.GET)
	public ModelAndView acceptDelivery(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		Email acceptDelivery = emailService.AcceptDelivery(num);
		modelAndView.addObject("acceptDelivery",acceptDelivery);
		modelAndView.setViewName("email/acceptDelivery");
		return modelAndView;
	}
	
	// 받은메일함 - 휴지통버튼 클릭
	@RequestMapping(value = "email/accept/wastebasket", method = RequestMethod.GET)
	public ModelAndView acceptWastebasket(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		Email acceptWastebasket = emailService.AcceptWastebasket(num);
		modelAndView.addObject("acceptWastebasket",acceptWastebasket);
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}
	
	// 받은메일함 - 읽음/안읽음 버튼 클릭
	@RequestMapping(value = "email/accept/read", method = RequestMethod.GET)
	public ModelAndView acceptRead(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		int acceptRead = emailService.AcceptRead(num);
		modelAndView.addObject("acceptRead",acceptRead);
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}
	
	// /* ------------------------------보낸 메일함------------------------------- */
	// 보낸메일함 목록 보여주기
	@RequestMapping(value = "email/send/list", method = RequestMethod.GET)
	public ModelAndView sentList(ModelAndView modelAndView, EmailPaging page, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		int sendCount = emailService.sendCount(id);		// 받은메일함 - 전체메일 수
		int emailCount = emailService.emailCount(id);		// 받은메일함 - 안읽은 메일 수
		page.setEmployeeEmail(employee.getEmployeeEmail());
		if(page.getTitle().equals("")) {
			page.setTitle("EMAIL_TITLE");
		}
		page.setCount(sendCount);
		page.setStartNum(page.getPage());
		page.setLastNum(page.getCount());
		page.setStartRange(page.getPage());
		page.setEndRange(page.getPage());
		List<Email> sendList = emailService.SendList(page);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		modelAndView.addObject("emailCount",emailCount);		
		modelAndView.addObject("sendList", sendList);
		modelAndView.addObject("page", page);
		modelAndView.setViewName("email/part/aside");
		modelAndView.setViewName("email/sendList");
		return modelAndView;
	}
	
	// 받은메일함 - 읽음/안읽음 버튼 클릭
	@RequestMapping(value = "email/send/read", method = RequestMethod.GET)
	public ModelAndView sendRead(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		int sendRead = emailService.AcceptRead(num);
		modelAndView.addObject("sendRead",sendRead);
		modelAndView.setViewName("redirect:/email/send/list");
		return modelAndView;
	}
	
	// 받은메일함 - 자세히보기(완성)
	@RequestMapping(value = "email/accept/detail", method = RequestMethod.GET)
	public ModelAndView acceptDetail(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		emailService.AutoRead(num);
		Email acceptDetail = emailService.AcceptDetail(num);
		Email er = emailService.Er(num);	// 참조자 정보
		Email es = emailService.Es(num);	// 보낸사람 정보
		Email ea = emailService.Ea(num);	// 받는사람 정보
		modelAndView.addObject("ea",ea);
		modelAndView.addObject("es",es);
		modelAndView.addObject("er",er);
		modelAndView.addObject("acceptDetail",acceptDetail);
		modelAndView.setViewName("email/acceptDetail");
		return modelAndView;
	}
	
	
	
	// 보낸메일함 - 자세히보기(완성)
	@RequestMapping(value = "email/send/detail", method = RequestMethod.GET)
	public ModelAndView sendDetail(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		emailService.AutoRead(num);
		Email sendDetail = emailService.AcceptDetail(num);
		Email er = emailService.Er(num);	// 참조자 정보
		Email es = emailService.Es(num);	// 보낸사람 정보
		Email ea = emailService.Ea(num);	// 받는사람 정보
		modelAndView.addObject("ea",ea);
		modelAndView.addObject("es",es);
		modelAndView.addObject("er",er);
		modelAndView.addObject("sendDetail",sendDetail);
		modelAndView.setViewName("email/sendDetail");
		return modelAndView;
	}
	
	// 휴지통 - 자세히보기
	@RequestMapping(value = "email/wastebasket/detail", method = RequestMethod.GET)
	public ModelAndView wastebasketDetail(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		Email wastebasketDetail = emailService.WastebasketDetail(num);
		Email er = emailService.Er(num);	// 참조자 정보
		Email es = emailService.Es(num);	// 보낸사람 정보
		Email ea = emailService.Ea(num);	// 받는사람 정보
		modelAndView.addObject("ea",ea);
		modelAndView.addObject("es",es);
		modelAndView.addObject("er",er);
		modelAndView.addObject("wastebasketDetail",wastebasketDetail);
		modelAndView.setViewName("email/wastebasketDetail");
		return modelAndView;
	}
	
	// 받은메일함 - 자세히 보기 - 전달버튼 클릭시
	@RequestMapping(value = "email/send/delivery", method = RequestMethod.GET)
	public ModelAndView sendDelivery(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		Email sendDelivery = emailService.AcceptDelivery(num);
		modelAndView.addObject("sendDelivery",sendDelivery);
		modelAndView.setViewName("email/sendDelivery");
		return modelAndView;
	}
	
	// 보낸메일함 - 삭제버튼 클릭
	@RequestMapping(value = "email/send/wastebasket", method = RequestMethod.GET)
	public ModelAndView sendWastebasket(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		int sendWastebasket = emailService.SendWastebasket(num);
		modelAndView.addObject("sendWastebasket",sendWastebasket);
		modelAndView.setViewName("redirect:/email/send/list");
		return modelAndView;
	}
		
	// 보낸메일함 - 자세히보기 -전달버튼 - 전달보내기 버튼
	@RequestMapping(value = "email/send/deliverySend", method = RequestMethod.GET)
	public ModelAndView sendDeliverySend(Email email, ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		int sendDeliverySend = emailService.SendDeliverySend(email);
		modelAndView.setViewName("redirect:/email/send/list");
		return modelAndView;
	}
	
	// /* ------------------------------ 휴지통 ------------------------------- */
	// 휴지통 목록 보여주기
	@RequestMapping(value = "email/wastebasket/list", method = RequestMethod.GET)
	public ModelAndView wastebasketList(ModelAndView modelAndView, EmailPaging page, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		int emailCount = emailService.emailCount(id);		// 받은메일함 - 안읽은 메일 수
		page.setEmployeeEmail(employee.getEmployeeEmail());
		if(page.getTitle().equals("")) {
			page.setTitle("EMAIL_TITLE");
		}
		page.setCount(emailCount);
		page.setStartNum(page.getPage());
		page.setLastNum(page.getCount());
		page.setStartRange(page.getPage());
		page.setEndRange(page.getPage());
		List<Email> wastebasketList = emailService.WastebasketList(page);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		modelAndView.addObject("emailCount",emailCount);		
		modelAndView.addObject("wastebasketList", wastebasketList);
		modelAndView.addObject("page", page);
		modelAndView.setViewName("email/part/aside");
		modelAndView.setViewName("email/wastebasketList");
		return modelAndView;
	}
	
	// 휴지통 - 자세히보기 - 복구버튼 클릭
	@RequestMapping(value = "email/wastebasket/restoration", method = RequestMethod.GET)
	public ModelAndView wastebasketRestoration(int num, ModelAndView modelAndView) throws Exception{
		int wastebasketRestoration = emailService.WastebasketRestoration(num);
		modelAndView.addObject("wastebasketRestoration",wastebasketRestoration);
		modelAndView.setViewName("redirect:/email/wastebasket/list");
		return modelAndView;
	}
	
	// 휴지통 - 자세히보기 - 삭제버튼 클릭
	@RequestMapping(value = "email/wastebasket/delete", method = RequestMethod.GET)
	public ModelAndView wastebasketDelete(int num, ModelAndView modelAndView) throws Exception{
		int wastebasketDelete = emailService.WastebasketDelete(num);
		modelAndView.setViewName("redirect:/email/wastebasket/list");
		return modelAndView;
	}
	
	// /* ------------------------------새 메일쓰기------------------------------- */
	// 새 메일쓰기
	@RequestMapping(value = "email/write/open", method = RequestMethod.GET)
	public ModelAndView writeOpen(ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int emailCount = emailService.emailCount(id);
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		modelAndView.setViewName("email/emailWrite");
		return modelAndView;
	}
	
	// 주소록에서 보내지는 메일 보내기
	@RequestMapping(value = "email/write/directSend", method = RequestMethod.GET)
	public ModelAndView directSend(ModelAndView modelAndView, HttpSession session, @RequestParam("emailAccept") String emailAccept) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int emailCount = emailService.emailCount(id);
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("emailAccept", emailAccept);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		modelAndView.setViewName("email/emailWrite_Staff");
		return modelAndView;
	}
	
	// 새 메일쓰기 - 보내기 버튼
	@RequestMapping(value = "email/write/send", method = RequestMethod.GET)
	public ModelAndView writeSend(Email email, ModelAndView modelAndView, HttpSession session) throws Exception{
		int writeSend = emailService.WriteSend(email);
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}

	// /* ------------------------------체크박스 기능------------------------------- */
	// 받은메일함 리스트 - 체크박스 - 휴지통
	@RequestMapping(value = "email/accept/ckWastebasket", method = RequestMethod.GET)
	public ModelAndView acceptCkWastebasket(int check[], ModelAndView modelAndView, HttpSession session) throws Exception{ 
		Employee employee = (Employee) session.getAttribute("employee");	// 세션에서 정보 받아오기
		String id = employee.getEmployeeEmail();							// 이메일값
		int emailCount = emailService.emailCount(id);						// 받은메일함 - 전체메일 수
		modelAndView.addObject("emailCount",emailCount);
		int wastebasketCount = emailService.wastebasketCount(id);			// 휴지통 - 전체 메일 수
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		modelAndView.setViewName("email/part/aside");
		for(int i=0; i<check.length;i++) {									// 체크박스 값들 배열에 담기
			emailService.AcceptWastebasket(check[i]);
		}
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}
	
	// 받은메일함 리스트 - 체크박스 - 읽음버튼
	@RequestMapping(value = "email/accept/ckRead", method = RequestMethod.GET)
	public ModelAndView acceptCkRead(int num[], ModelAndView modelAndView, HttpSession session) throws Exception{ 
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		for(int i=0; i<num.length;i++) {
			emailService.ListRead(num[i]);
		}
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}
	
	// 받은메일함 리스트 - 체크박스 - 읽음버튼
	@RequestMapping(value = "email/accept/ckClose", method = RequestMethod.GET)
	public ModelAndView acceptCkClose(int num[], ModelAndView modelAndView, HttpSession session) throws Exception{ 
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		for(int i=0; i<num.length;i++) {
			System.out.println(num[i]);
			emailService.ListClose(num[i]);
		}
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}

	// 보낸메일함 리스트 - 체크박스 - 삭제
	@RequestMapping(value = "email/send/ckWastebasket", method = RequestMethod.GET)
	public ModelAndView sendCkWastebasket(int check[], ModelAndView modelAndView, HttpSession session) throws Exception{ 
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		for(int i=0; i<check.length;i++) {
			emailService.SendWastebasket(check[i]);
		}
		modelAndView.setViewName("redirect:/email/send/list");
		return modelAndView;
	}
	
	// 휴지통리스트 - 체크박스 - 복구
	@RequestMapping(value = "email/wastebasket/ckWastebasket", method = RequestMethod.GET)
	public ModelAndView wastebasketCkWastebasket(int check[], ModelAndView modelAndView, HttpSession session) throws Exception{ 
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		for(int i=0; i<check.length;i++) {
			emailService.AcceptWastebasket(check[i]);
		}
		modelAndView.setViewName("redirect:/email/wastebasket/list");
		return modelAndView;
	}
	
	// 휴지통리스트 - 체크박스 - 삭제
	@RequestMapping(value = "email/wastebasket/ckRestoration", method = RequestMethod.GET)
	public ModelAndView wastebasketCkRestoration(int num[], ModelAndView modelAndView, HttpSession session) throws Exception{ 
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		int wastebasketCount = emailService.wastebasketCount(id);
		modelAndView.addObject("wastebasketCount",wastebasketCount);
		int emailCount = emailService.emailCount(id);
		modelAndView.addObject("emailCount",emailCount);
		modelAndView.setViewName("email/part/aside");
		for(int i=0; i<num.length;i++) {
			System.out.println(num[i]);
			emailService.WastebasketDelete(num[i]);
		}
		modelAndView.setViewName("redirect:/email/wastebasket/list");
		return modelAndView;
	}

	// 작성시 메일주소 검색
	@RequestMapping(value="email/write/searchName", method=RequestMethod.POST)
	public void emailSearchName(Employee employee, ModelAndView modelAndView, HttpServletResponse response, HttpSession session) throws Exception {
		Employee eemployee = (Employee) session.getAttribute("employee");		
		String id = eemployee.getEmployeeEmail();						// 로그인 후 세션에서 정보 받아오기
		int wastebasketCount = emailService.wastebasketCount(id);		// 휴지통 - 전체 메일 수
		modelAndView.addObject("wastebasketCount",wastebasketCount);	
		int emailCount = emailService.emailCount(id);					// 받은메일함 - 전체 메일 수
		modelAndView.addObject("emailCount",emailCount);				
		modelAndView.setViewName("email/part/aside");
		List<Employee> empList = emailService.selectEmpAll(employee);	// 모든 임직원 데이터
			 JSONObject sendJson = new JSONObject();					// 전송용 최종 json 객체
			 JSONArray empArray = new JSONArray();						// JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
			 for(Employee employeeList : empList){
				 JSONObject user = new JSONObject();					// user 정보 저장할 json 객체 선언
				 user.put("dCode", employeeList.getDepartmentCode());	// 부서코드 
				 user.put("rCode", employeeList.getRankCode());			// 직급
				 user.put("name", employeeList.getEmployeeName());		// 이름
				 user.put("email", employeeList.getEmployeeEmail());	// 이메일
				 user.put("empNo", employeeList.getEmployeeNumber());	// 사원번호
				 empArray.add(user);
			}
			 sendJson.put("list", empArray);
			 response.setContentType("application/json; charset=utf-8");
			 PrintWriter out = response.getWriter();
			 out.println(sendJson.toJSONString());
			 out.flush();
			 out.close();
	}
}
