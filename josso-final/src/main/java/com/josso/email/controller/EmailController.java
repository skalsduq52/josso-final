package com.josso.email.controller;

import java.util.List;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.josso.email.service.EmailService;
import com.josso.email.vo.Email;
import com.josso.employee.vo.Employee;


@Controller
public class EmailController{
	
	@Autowired
	private EmailService emailService;

	// 메일 메인페이지(완성)
	@RequestMapping(value = "email.do", method = RequestMethod.GET)
	public String email() throws Exception{
		return "email/acceptList";
	}
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@받은 메일함@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 받은메일함 목록 보여주기(완성)
	@RequestMapping(value = "email/accept/list", method = RequestMethod.GET)
	public ModelAndView acceptList(ModelAndView modelAndView, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		List<Email> acceptList = emailService.AcceptList(id);
		modelAndView.addObject("acceptList",acceptList);
		modelAndView.setViewName("email/acceptList");
		return modelAndView;
	}
	
	// 받은메일함 - 자세히보기 - 답장버튼 클릭(완성)
	@RequestMapping(value = "email/accept/reply", method = RequestMethod.GET)
	public ModelAndView acceptReply(int num, ModelAndView modelAndView) throws Exception{
		Email acceptReply = emailService.AcceptReply(num);
		modelAndView.addObject("acceptReply",acceptReply);
		modelAndView.setViewName("email/acceptReply");
		return modelAndView;
	}
	
	// 받은메일함 - 답장보내기버튼 클릭
	@RequestMapping(value = "email/accept/replySend", method = RequestMethod.GET)
	public ModelAndView acceptReplySend(Email email, ModelAndView modelAndView) throws Exception{
		int writeSend = emailService.WriteSend(email);
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}
	
	// 받은메일함 - 자세히 보기 - 전달버튼 클릭시
	@RequestMapping(value = "email/accept/delivery", method = RequestMethod.GET)
	public ModelAndView acceptDelivery(int num, ModelAndView modelAndView) throws Exception{
		Email acceptDelivery = emailService.AcceptDelivery(num);
		modelAndView.addObject("acceptDelivery",acceptDelivery);
		modelAndView.setViewName("email/acceptDelivery");
		return modelAndView;
	}
	
	// 받은메일함 - 자세히보기 - 전달보내기(불필요)
	@RequestMapping(value = "email/accept/deliverySend", method = RequestMethod.GET)
	public String acceptDeliverySend() throws Exception{
		return "email/acceptList";
	}
	
	// 받은메일함 - 휴지통버튼 클릭
	@RequestMapping(value = "email/accept/wastebasket", method = RequestMethod.GET)
	public ModelAndView acceptWastebasket(int num, ModelAndView modelAndView) throws Exception{
		Email acceptWastebasket = emailService.AcceptWastebasket(num);
		modelAndView.addObject("acceptWastebasket",acceptWastebasket);
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}
	
	// 받은메일함 - 읽음/안읽음 버튼 클릭
	@RequestMapping(value = "email/accept/read", method = RequestMethod.GET)
	public ModelAndView acceptRead(int num, ModelAndView modelAndView) throws Exception{
		System.out.println(num);
		int acceptRead = emailService.AcceptRead(num);
		modelAndView.addObject("acceptRead",acceptRead);
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@보낸 메일함 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 보낸메일함 목록 보여주기
	@RequestMapping(value = "email/send/list", method = RequestMethod.GET)
	public ModelAndView sentList(ModelAndView modelAndView, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{

		//		System.out.println("2");
//		String field_ = request.getParameter("f");
//		String search = request.getParameter("q");
//		System.out.println(request.getParameter("f"));
//		System.out.println(request.getParameter("q"));
//		String field = "EMAIL_TITLE";
//		if(field_ != null && !field_.equals("")) {
//			field = field_;
//		}
//		String query = "";
//		if(search != null && !search.equals("")) {
//			query = search;
//		}
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		List<Email> sendList = emailService.SendList(id); // , String field, String query
		modelAndView.addObject("sendList",sendList);
		modelAndView.setViewName("email/sendList");
		return modelAndView;
	}
	
	// 받은메일함 - 읽음/안읽음 버튼 클릭
	@RequestMapping(value = "email/send/read", method = RequestMethod.GET)
	public ModelAndView sendRead(int num, ModelAndView modelAndView) throws Exception{
		System.out.println(num);
		int sendRead = emailService.AcceptRead(num);
		modelAndView.addObject("sendRead",sendRead);
		modelAndView.setViewName("redirect:/email/send/list");
		return modelAndView;
	}
	
	// 받은메일함 - 자세히보기(완성)
	@RequestMapping(value = "email/accept/detail", method = RequestMethod.GET)
	public ModelAndView acceptDetail(int num, ModelAndView modelAndView, HttpSession session) throws Exception{
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
	public ModelAndView sendDetail(int num, ModelAndView modelAndView) throws Exception{
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
	public ModelAndView wastebasketDetail(int num, ModelAndView modelAndView) throws Exception{
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
	public ModelAndView sendDelivery(int num, ModelAndView modelAndView) throws Exception{
		Email sendDelivery = emailService.AcceptDelivery(num);
		modelAndView.addObject("sendDelivery",sendDelivery);
		modelAndView.setViewName("email/sendDelivery");
		return modelAndView;
	}
	
	// 보낸메일함 - 삭제버튼 클릭
	@RequestMapping(value = "email/send/wastebasket", method = RequestMethod.GET)
	public ModelAndView sendWastebasket(int num, ModelAndView modelAndView) throws Exception{
		int sendWastebasket = emailService.SendWastebasket(num);
		modelAndView.addObject("sendWastebasket",sendWastebasket);
		modelAndView.setViewName("redirect:/email/send/list");
		return modelAndView;
	}
		
	// 보낸메일함 - 자세히보기 -전달버튼 - 전달보내기 버튼
	@RequestMapping(value = "email/send/deliverySend", method = RequestMethod.GET)
	public ModelAndView sendDeliverySend(Email email, ModelAndView modelAndView) throws Exception{
		int sendDeliverySend = emailService.SendDeliverySend(email);
		modelAndView.setViewName("redirect:/email/send/list");
		return modelAndView;
	}
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@휴지통 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 휴지통 목록 보여주기
	@RequestMapping(value = "email/wastebasket/list", method = RequestMethod.GET)
	public ModelAndView wastebasketList(ModelAndView modelAndView, HttpSession session) throws Exception{
		Employee employee = (Employee) session.getAttribute("employee");
		String id = employee.getEmployeeEmail();
		List<Email> wastebasketList = emailService.WastebasketList(id);
		modelAndView.addObject("wastebasketList",wastebasketList);
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
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@새 메일쓰기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 새 메일쓰기
	@RequestMapping(value = "email/write/open", method = RequestMethod.GET)
	public String writeOpen() throws Exception{
		return "email/emailWrite";
	}
	
	// 새 메일쓰기 - 보내기 버튼
	@RequestMapping(value = "email/write/send", method = RequestMethod.GET)
	public ModelAndView writeSend(Email email, ModelAndView modelAndView, HttpSession session) throws Exception{
		int writeSend = emailService.WriteSend(email);
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@체크박스 기능 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 받은메일함 리스트 - 체크박스 - 휴지통
	@RequestMapping(value = "email/accept/ckWastebasket", method = RequestMethod.GET)
	public ModelAndView acceptCkWastebasket(int check[], ModelAndView modelAndView) throws Exception{ 
		for(int i=0; i<check.length;i++) {
			emailService.AcceptWastebasket(check[i]);
		}
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}
	
	// 받은메일함 리스트 - 체크박스 - 읽음버튼
	@RequestMapping(value = "email/accept/ckRead", method = RequestMethod.GET)
	public ModelAndView acceptCkRead(int num[], ModelAndView modelAndView) throws Exception{ 
		for(int i=0; i<num.length;i++) {
			System.out.println(num[i]);
			emailService.AcceptRead(num[i]);
		}
		modelAndView.setViewName("redirect:/email/accept/list");
		return modelAndView;
	}

	// 보낸메일함 리스트 - 체크박스 - 삭제
	@RequestMapping(value = "email/send/ckWastebasket", method = RequestMethod.GET)
	public ModelAndView sendCkWastebasket(int check[], ModelAndView modelAndView) throws Exception{ 
		for(int i=0; i<check.length;i++) {
			emailService.SendWastebasket(check[i]);
		}
		modelAndView.setViewName("redirect:/email/send/list");
		return modelAndView;
	}
	
	// 휴지통리스트 - 체크박스 - 복구
	@RequestMapping(value = "email/wastebasket/ckWastebasket", method = RequestMethod.GET)
	public ModelAndView wastebasketCkWastebasket(int check[], ModelAndView modelAndView) throws Exception{ 
		for(int i=0; i<check.length;i++) {
			emailService.AcceptWastebasket(check[i]);
		}
		modelAndView.setViewName("redirect:/email/wastebasket/list");
		return modelAndView;
	}
	
	// 휴지통리스트 - 체크박스 - 삭제
	@RequestMapping(value = "email/wastebasket/ckRestoration", method = RequestMethod.GET)
	public ModelAndView wastebasketCkRestoration(int num[], ModelAndView modelAndView) throws Exception{ 
		for(int i=0; i<num.length;i++) {
			System.out.println(num[i]);
			emailService.WastebasketDelete(num[i]);
		}
		modelAndView.setViewName("redirect:/email/wastebasket/list");
		return modelAndView;
	}

	@RequestMapping(value = "email/search", method = RequestMethod.GET)
	public ModelAndView EmailSearch(String word, ModelAndView modelAndView) throws Exception{
		List<Email> acceptList = emailService.EmailSearch(word);
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("word", word);
//		map.put("id", id);
//		System.out.println(map.get("word"));
//		System.out.println(map.get("id"));
		modelAndView.addObject("acceptList",acceptList);
		modelAndView.setViewName("email/acceptList");
		return modelAndView;
	}

	
	
	
}
